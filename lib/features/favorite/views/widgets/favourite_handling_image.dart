import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteHandlingImage extends StatelessWidget {
  const FavouriteHandlingImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset(image, width: double.infinity, fit: BoxFit.fill));
  }
}