import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/resources/colors.dart';

class FloatingActionButtonComponent extends StatelessWidget {
  const FloatingActionButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40)
      ),
      backgroundColor: AppColors.primaryColor,
      onPressed: () {},
      elevation: 0,
      child: Align(
        alignment: const Alignment(-0.25, 0),
        child: SvgPicture.asset(
          AppImages.logo
        ),
      ),
    );
  }
}
