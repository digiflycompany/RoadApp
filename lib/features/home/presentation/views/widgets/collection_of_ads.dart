import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_cached_network_image.dart';
import 'package:roadapp/features/home/data/models/ads_response.dart';

Widget collectionOfAds(context, List<AD> ads) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(children: [
      handlingImage(ads[0].images![0], context),
      if (ads.length > 1) SizedBox(height: 10.h),
      if (ads.length > 1) handlingImage(ads[1].images![0], context),
      if (ads.length > 2) SizedBox(height: 10.h),
      if (ads.length > 2) handlingImage(ads[2].images![0], context)
    ]));

Widget handlingImage(String image, context) {
  return Expanded(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: CustomCachedNetworkImage(
              url: image, width: double.infinity, fit: BoxFit.fill)));
}