import 'package:flutter/material.dart';
import 'package:roadapp2/shared/const/app_images.dart';

class OnBoardingImg extends StatelessWidget {
  const OnBoardingImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset(AppImages.intro));
  }
}
