import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
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
        child: Image.asset(imagePath, width: w, height: h, fit: fit));
  }
}