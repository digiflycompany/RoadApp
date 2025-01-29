import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_assets.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key,
       this.imagePath,
      this.h,
      this.w,
      this.fit,
      this.radius});

  final String? imagePath;
  final double? h, w, radius;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: imagePath == null ? Image.asset(
          AppAssets.carServiceWorker,
            width: 100,
            height: 100,
            fit: fit,
        ) : SizedBox(
          width: w,
          height: h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8), // يمكنك ضبط قيمة الحواف كما تريد
            child: Image.network(
              imagePath!,
              width: double.infinity,
              height: 80.h,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  width: w,
                  height: h,
                  color: Colors.grey, // لون الخلفية في حالة حدوث خطأ
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.white), // أيقونة الخطأ
                );
              },
            ),
          ),
        )

    );
  }
}

class CustomImageAds extends StatelessWidget {
  const CustomImageAds(
      {super.key,
        required this.imagePath,
        this.h,
        this.w,
        this.fit,
        this.radius});

  final String imagePath;
  final double? h, w, radius;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: Image.asset(
          imagePath,
          width: w,
          height: h,
          fit: fit,
        )
    );
  }
}