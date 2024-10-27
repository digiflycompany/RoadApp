import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/service_country/views/screens/service_country_screen.dart';

class SelectSectorButton extends StatelessWidget {
  const SelectSectorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        onTap: () {
          AppNavigation.navigate(const ServiceCountryScreen());
        },
        width: 200.w,
        height: 50.h,
        widget: Text(StringManager.select.tr(context),
            style: TextStyle(fontSize: 11.sp)));
  }
}