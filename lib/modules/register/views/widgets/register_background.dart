import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/shared/const/app_images.dart';

class RegisterBackground extends StatelessWidget {
  const RegisterBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImages.roadBackground,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
