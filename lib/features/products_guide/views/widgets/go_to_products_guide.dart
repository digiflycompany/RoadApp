import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/products_guide/views/screens/products_guide_screen.dart';

class GoToProductsGuide extends StatelessWidget {
  const GoToProductsGuide({super.key, this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.yellowColor,
            borderRadius: BorderRadius.circular(10.r)),
        padding: const EdgeInsets.all(12),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            StringManager.productsGuide.tr(context),
            style: Styles.textStyle16,
          ),
        ),
      ),
    );
  }
}