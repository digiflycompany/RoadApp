import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 43,
        decoration: BoxDecoration(
            color: AppColors.greyColor2.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10.r)),
        child: TextField(
            style: Styles.textStyle12,
            onChanged: onChanged,
            onSubmitted: onChanged,
            onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
            decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                hintText: StringManager.search.tr(context),
                hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFFAAAAAA).withOpacity(0.5)),
                border: InputBorder.none,
                prefixIcon: const Icon(CupertinoIcons.search,
                    color: Colors.grey, size: 17.5))));
  }
}