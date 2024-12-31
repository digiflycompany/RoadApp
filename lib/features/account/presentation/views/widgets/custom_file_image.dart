import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/Theming/colors.dart';
import '../../../../../core/helpers/app_assets.dart';

class CustomFileImage extends StatelessWidget {
  const CustomFileImage({
    super.key,
    this.image,
  });

  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? Container(
            width: 110.w,
            height: 110.h,
            decoration: BoxDecoration(
              color: AppColors.emptyImageColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: FileImage(
                  File(image!.path),
                ),
              ),
            ),
          )
        : Container(
            width: 110.w,
            height: 110.h,
            decoration: const BoxDecoration(
                color: AppColors.emptyImageColor, shape: BoxShape.circle),
            child: Center(
                child: SvgPicture.asset(AppAssets.emptyImageIcon,
                    width: 50, height: 50)));
  }
}
