import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class FloatingActionButtonComponent extends StatelessWidget {
  const FloatingActionButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
        elevation: 0,
        child: Align(
            alignment: const Alignment(-0.25, 0),
            child: SvgPicture.asset(AppAssets.logo)));
  }
}