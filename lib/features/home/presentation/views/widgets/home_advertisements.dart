import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
import 'package:roadapp/features/home/presentation/cubit/home_states.dart';
import 'package:roadapp/features/home/presentation/views/widgets/ads_single_page.dart';

class HomeAdvertisements extends StatelessWidget {
  const HomeAdvertisements({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
      var cubit = HomeCubit.get(context);

      if (cubit.controllers.isEmpty) {
        cubit.controllers = List.generate(
            cubit.pagesCount, (_) => PageController(keepPage: false));
      }

      int startIndex = cubit.verticalIndex * 9;
      int endIndex = (startIndex + 9 > cubit.ads.length)
          ? cubit.ads.length
          : startIndex + 9;

      return state is AdsErrorState
          ? Center(child: Text(state.errorMessage))
          : Flexible(
              child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: cubit.mainController,
                  onPageChanged: (index) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (index < cubit.controllers.length) {
                        cubit.controllers[index]
                            .jumpToPage(cubit.verticalIndex);
                      }
                    });
                    cubit.loadMoreAds(index);
                    DefaultLogger.logger.wtf(index);
                  },
                  children: [
                  for (int i = 0; i < cubit.pagesCount; i++)
                    AdsSinglePage(
                        pageController: cubit.controllers[i],
                        ads: cubit.ads.sublist(startIndex, endIndex))
                ]));
    });
  }
}