import 'package:flutter/material.dart';
import 'package:roadapp2/shared/widgets/palette.dart';

import '../resources/colors.dart';

class AppThemes {
  static ThemeData whiteTheme = ThemeData(
    dividerTheme: const DividerThemeData(color: Colors.transparent),
    fontFamily: 'NotoKufiArabic',
    primaryColor: AppColors.primaryColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primarySwatch: Palette.getPrimarySwatchDegrees,
    hoverColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white
  );
}
