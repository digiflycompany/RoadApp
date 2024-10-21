import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/layout/presentation/views/screens/app_layout.dart';

class SelectCountryButton extends StatelessWidget {
  const SelectCountryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        onTap: () {
          AppNavigation.navigateOffAll(const AppLayout());
        },
        width: 200.w,
        height: 50.h,
        widget: Text(StringManager.select.tr(context),
            style: TextStyle(fontSize: 11.sp)));
  }
}