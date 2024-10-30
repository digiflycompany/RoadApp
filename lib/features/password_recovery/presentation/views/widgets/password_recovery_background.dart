import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/app_assets.dart';

class PasswordRecoveryBackground extends StatelessWidget {
  const PasswordRecoveryBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.roadBackground,
        height: double.infinity, width: double.infinity, fit: BoxFit.fill);
  }
}