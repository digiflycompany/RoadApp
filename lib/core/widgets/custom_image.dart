import 'package:flutter/material.dart';

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
            width: w,
            height: h,
            fit: fit,
        ) : Image.network(
          imagePath!,
          width: w,
          height: h,
          fit: fit,
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(
              child: Container(
                width: w,
                height: h,
                color: Colors.grey, // Background color for fallback
                child: const Icon(Icons.broken_image, size: 50, color: Colors.white), // Fallback icon
              ),
            );
          },
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