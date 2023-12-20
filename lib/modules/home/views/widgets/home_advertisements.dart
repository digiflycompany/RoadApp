import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/home/cubit/home_cubit.dart';
import 'package:roadapp2/modules/home/cubit/home_states.dart';
import 'package:roadapp2/shared/const/app_images.dart';

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
            onPageChanged: (index) {
              if (index == 0) {
                cubit.controller1.jumpToPage(cubit.verticalIndex);
              } else if (index == 1) {
                cubit.controller2.jumpToPage(cubit.verticalIndex);
              } else if (index == 2) {
                cubit.controller3.jumpToPage(cubit.verticalIndex);
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
                  collectionOfAds(
                      context, AppImages.car1, AppImages.car2, AppImages.car3),
                  collectionOfAds(
                      context, AppImages.car4, AppImages.car5, AppImages.car6),
                  collectionOfAds(
                      context, AppImages.car7, AppImages.car8, AppImages.car9),
                ],
              ),
              PageView(
                onPageChanged: (index) {
                  cubit.verticalIndex = index;
                },
                controller: cubit.controller2,
                scrollDirection: Axis.vertical,
                children: [
                  collectionOfAds(
                      context, AppImages.car1, AppImages.car2, AppImages.car3),
                  collectionOfAds(
                      context, AppImages.car4, AppImages.car5, AppImages.car6),
                  collectionOfAds(
                      context, AppImages.car7, AppImages.car8, AppImages.car9),
                ],
              ),
              PageView(
                onPageChanged: (index) {
                  cubit.verticalIndex = index;
                },
                controller: cubit.controller3,
                scrollDirection: Axis.vertical,
                children: [
                  collectionOfAds(
                      context, AppImages.car1, AppImages.car2, AppImages.car3),
                  collectionOfAds(
                      context, AppImages.car4, AppImages.car5, AppImages.car6),
                  collectionOfAds(
                      context, AppImages.car7, AppImages.car8, AppImages.car9),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget collectionOfAds(context, String image1, String image2, String image3) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          handlingImage(image1, context),
          SizedBox(
            height: 10.h,
          ),
          handlingImage(image2, context),
          SizedBox(
            height: 10.h,
          ),
          handlingImage(image3, context),
        ],
      ),
    );

Widget handlingImage(String image, context) {
  return Expanded(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Image.asset(
        image,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    ),
  );
}
