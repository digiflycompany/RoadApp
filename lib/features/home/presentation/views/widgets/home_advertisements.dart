import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/auth/presentation/views/screens/login_screen.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
import 'package:roadapp/features/home/presentation/cubit/home_states.dart';
import 'package:roadapp/features/home/presentation/views/widgets/ads_single_page.dart';

class HomeAdvertisements extends StatelessWidget {
  const HomeAdvertisements({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(listener: (_, state) {
      if (state is AdsErrorState &&
          state.errorMessage == "انتهت صلاحية الجلسة من فضلك سجل دخولك") {
        AppNavigation.navigateOffAll(const LoginScreen());
      }
    }, builder: (BuildContext context, HomeState state) {
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
                      cubit.updateVerticalIndex(index);

                      if (index < cubit.controllers.length) {
                        if (cubit.controllers[index].hasClients) {
                          cubit.controllers[index]
                              .jumpToPage(cubit.verticalIndex);
                        }
                        cubit.updateVerticalIndex(index);
                      }
                    });
                    cubit.loadMoreAds(index);
                    DefaultLogger.logger.w(index);
                    DefaultLogger.logger.d('$startIndex <= => $endIndex');
                  },
                  children: [
                  for (int i = 0; i < cubit.pagesCount; i++)
                    state is FetchingAdsLoadingState ||
                            state is MoreLoadingState
                        ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomLoadingIndicator(height: 100.h),
                        )
                        : state is AdsErrorState
                            ? Text(state.errorMessage) : cubit.ads.isEmpty? Center(child: Text(StringManager.noAds.tr(context)))
                            : AdsSinglePage(
                                pageController: cubit.controllers[i],
                                ads: cubit.ads.sublist(startIndex, endIndex))
                ]));
    });
  }
}