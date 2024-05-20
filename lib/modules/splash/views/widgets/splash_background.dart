import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/shared/const/app_images.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SvgPicture.asset(AppImages.splashBackground));
  }
}