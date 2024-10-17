import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
import 'package:roadapp/features/home/presentation/cubit/home_states.dart';

class HomeAdvertisements extends StatelessWidget {
  const HomeAdvertisements({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) {},
        builder: (BuildContext context, HomeState state) {
          var cubit = HomeCubit.get(context);
          return Flexible(
              child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: cubit.mainController,
                  onPageChanged: (index) {
                    if (index == 0) {
                      cubit.controller1.jumpToPage(cubit.verticalIndex);
                    } else if (index == 1) {
                      cubit.controller2.jumpToPage(cubit.verticalIndex);
                    } else if (index == 2) {
                      cubit.controller3.jumpToPage(cubit.verticalIndex);
                    } else if (index == 3) {
                      cubit.controller4.jumpToPage(cubit.verticalIndex);
                    } else if (index == 4) {
                      cubit.controller5.jumpToPage(cubit.verticalIndex);
                    }
                  },
                  children: [
                PageView(
                    onPageChanged: (index) {
                      cubit.verticalIndex = index;
                    },
                    controller: cubit.controller1,
                    scrollDirection: Axis.vertical,
                    children: [
                      collectionOfAds(context, AppAssets.car1, AppAssets.car2,
                          AppAssets.car3),
                      collectionOfAds(context, AppAssets.car4, AppAssets.car5,
                          AppAssets.car6),
                      collectionOfAds(context, AppAssets.car7, AppAssets.car8,
                          AppAssets.car9),
                      collectionOfAds(context, AppAssets.car4, AppAssets.car5,
                          AppAssets.car6),
                      collectionOfAds(context, AppAssets.car7, AppAssets.car8,
                          AppAssets.car9)
                    ]),
                PageView(
                    onPageChanged: (index) {
                      cubit.verticalIndex = index;
                    },
                    controller: cubit.controller2,
                    scrollDirection: Axis.vertical,
                    children: [
                      collectionOfAds(context, AppAssets.car1, AppAssets.car2,
                          AppAssets.car3),
                      collectionOfAds(context, AppAssets.car4, AppAssets.car5,
                          AppAssets.car6),
                      collectionOfAds(context, AppAssets.car7, AppAssets.car8,
                          AppAssets.car9),
                      collectionOfAds(context, AppAssets.car4, AppAssets.car5,
                          AppAssets.car6),
                      collectionOfAds(context, AppAssets.car7, AppAssets.car8,
                          AppAssets.car9)
                    ]),
                PageView(
                    onPageChanged: (index) {
                      cubit.verticalIndex = index;
                    },
                    controller: cubit.controller3,
                    scrollDirection: Axis.vertical,
                    children: [
                      collectionOfAds(context, AppAssets.car1, AppAssets.car2,
                          AppAssets.car3),
                      collectionOfAds(context, AppAssets.car4, AppAssets.car5,
                          AppAssets.car6),
                      collectionOfAds(context, AppAssets.car7, AppAssets.car8,
                          AppAssets.car9),
                      collectionOfAds(context, AppAssets.car4, AppAssets.car5,
                          AppAssets.car6),
                      collectionOfAds(context, AppAssets.car7, AppAssets.car8,
                          AppAssets.car9)
                    ]),
                PageView(
                    onPageChanged: (index) {
                      cubit.verticalIndex = index;
                    },
                    controller: cubit.controller4,
                    scrollDirection: Axis.vertical,
                    children: [
                      collectionOfAds(context, AppAssets.car1, AppAssets.car2,
                          AppAssets.car3),
                      collectionOfAds(context, AppAssets.car4, AppAssets.car5,
                          AppAssets.car6),
                      collectionOfAds(context, AppAssets.car7, AppAssets.car8,
                          AppAssets.car9),
                      collectionOfAds(context, AppAssets.car4, AppAssets.car5,
                          AppAssets.car6),
                      collectionOfAds(context, AppAssets.car7, AppAssets.car8,
                          AppAssets.car9)
                    ]),
                PageView(
                    onPageChanged: (index) {
                      cubit.verticalIndex = index;
                    },
                    controller: cubit.controller5,
                    scrollDirection: Axis.vertical,
                    children: [
                      collectionOfAds(context, AppAssets.car1, AppAssets.car2,
                          AppAssets.car3),
                      collectionOfAds(context, AppAssets.car4, AppAssets.car5,
                          AppAssets.car6),
                      collectionOfAds(context, AppAssets.car7, AppAssets.car8,
                          AppAssets.car9),
                      collectionOfAds(context, AppAssets.car4, AppAssets.car5,
                          AppAssets.car6),
                      collectionOfAds(context, AppAssets.car7, AppAssets.car8,
                          AppAssets.car9)
                    ])
              ]));
        });
  }
}

Widget collectionOfAds(context, String image1, String image2, String image3) =>
    Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          handlingImage(image1, context),
          SizedBox(height: 10.h),
          handlingImage(image2, context),
          SizedBox(height: 10.h),
          handlingImage(image3, context)
        ]));

Widget handlingImage(String image, context) {
  return Expanded(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(image, width: double.infinity, fit: BoxFit.fill)));
}