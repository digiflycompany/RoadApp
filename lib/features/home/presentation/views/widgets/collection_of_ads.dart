import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_cached_network_image.dart';
import 'package:roadapp/features/home/data/models/ads_response.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
import 'package:roadapp/features/home/presentation/cubit/home_states.dart';

Widget collectionOfAds(context, List<AD> ads) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(children: [
      handlingImage(ads[0].images![0], ads[0].id!, context),
      if (ads.length > 1) SizedBox(height: 10.h),
      if (ads.length > 1) handlingImage(ads[1].images![0], ads[1].id!, context),
      if (ads.length > 2) SizedBox(height: 10.h),
      if (ads.length > 2) handlingImage(ads[2].images![0], ads[2].id!, context)
    ]));

Widget handlingImage(String image, String id, context) {
  return Expanded(
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: CustomCachedNetworkImage(
            url: image,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: 30.w,
          height: 30.h,
          margin: const EdgeInsets.all(4),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFE9E9E9)),
              borderRadius: BorderRadius.circular(4),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 2,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              bool isLoading = cubit.currentLoadingAdId == id;

              return GestureDetector(
                onTap: () {
                  if (!isLoading) {
                    cubit.addToFav(id: id);
                  }
                },
                child: isLoading
                    ? state is AddToFavSuccessState && state.id == id
                        ? Icon(
                            Icons.favorite,
                            size: 20.sp,
                            color: Colors.red,
                          )
                        : const CircularProgressIndicator()
                    : Icon(
                        Icons.favorite_border,
                        size: 20.sp,
                      ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
