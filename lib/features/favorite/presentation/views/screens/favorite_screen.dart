import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/favorite/data/repos/fav_repo.dart';
import 'package:roadapp/features/favorite/presentation/cubit/fav_cubit.dart';
import 'package:roadapp/features/favorite/presentation/cubit/fav_state.dart';
import 'package:roadapp/features/favorite/presentation/views/widgets/fav_ads_shimmer.dart';
import 'package:roadapp/features/favorite/presentation/views/widgets/favorite_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.fav.tr(context))),
        body: Padding(
            padding: EdgeInsets.all(20.r),
            child: BlocProvider(
                create: (context) =>
                    FavCubit(getIt.get<FavRepo>())..fetchFavAds(),
                child:
                    BlocBuilder<FavCubit, FavState>(builder: (context, state) {
                  var cubit = FavCubit.get(context);
                  return state is FetchingFavAdsLoadingState
                      ? const FavAdsShimmer()
                      : state is FavErrorState
                          ? Center(child: Text(state.error))
                          : ListView.separated(
                              itemBuilder: (_, index) => FavoriteItem(
                                  ad: cubit.ads![index]),
                              separatorBuilder: (_, index) => Gap(20.h),
                              itemCount: cubit.ads?.length ?? 0);
                }))));
  }
}