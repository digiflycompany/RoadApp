import 'package:flutter/material.dart';
import 'package:roadapp/shared/resources/colors.dart';

class Palette {
  static MaterialColor getPrimarySwatchDegrees = MaterialColor(
    AppColors.primaryColor.value,
    <int, Color>{
      50: AppColors.primaryColor.withOpacity(0.1), //10%
      100: AppColors.primaryColor.withOpacity(0.2), //20%
      200: AppColors.primaryColor.withOpacity(0.3), //30%
      300: AppColors.primaryColor.withOpacity(0.4), //40%
      400: AppColors.primaryColor.withOpacity(0.5), //50%
      500: AppColors.primaryColor.withOpacity(0.6), //60%
      600: AppColors.primaryColor.withOpacity(0.7), //70%
      700: AppColors.primaryColor.withOpacity(0.8), //80%
      800: AppColors.primaryColor.withOpacity(0.9), //90%
      900: AppColors.primaryColor, //100%
    },
  );
}
