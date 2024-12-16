import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/services_guide/views/screens/services_guide_screen.dart';

class GoToServicesGuide extends StatelessWidget {
  const GoToServicesGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => AppNavigation.navigate(const ServicesGuideScreen()),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.yellowColor,
            borderRadius: BorderRadius.circular(10.r)),
        padding: const EdgeInsets.all(12),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            StringManager.servicesGuide.tr(context),
            style: Styles.textStyle16,
          ),
        ),
      ),
    );
  }
}
