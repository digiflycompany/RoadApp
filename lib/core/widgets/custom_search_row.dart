import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class CustomSearchRow extends StatelessWidget {
  const CustomSearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(StringManager.otherServices.tr(context),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.sp)),
      SizedBox(width: 10.w),
      Expanded(
          child: TextField(
              onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF707070).withOpacity(0.05),
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  hintText: StringManager.search.tr(context),
                  hintStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
                  border: InputBorder.none,
                  prefixIcon:
                      const Icon(CupertinoIcons.search, color: Colors.grey),
                  suffixIcon: Container(
                      margin: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.black),
                      child: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(AppAssets.settingIcon,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn))))),
              controller: TextEditingController()))
    ]);
  }
}