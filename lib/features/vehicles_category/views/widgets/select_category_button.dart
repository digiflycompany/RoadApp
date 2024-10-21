import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';

class SelectCategoryButton extends StatelessWidget {
  const SelectCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        onTap: () {},
        widget: Text(StringManager.select.tr(context)),
        width: 150.w,
        height: 60.h);
  }
}