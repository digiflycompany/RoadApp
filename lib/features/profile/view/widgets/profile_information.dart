import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  Future<String?> _getUserName() async {
    return await CacheHelper().getData(CacheVars.userName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: _getUserName(),
        builder: (context, snapshot) {
          String userName = snapshot.data ?? "";
          return Text(userName,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.tertiary,
                  fontWeight: FontWeight.w500));
        });
  }
}