import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';

class DrawerHeaderComponent extends StatelessWidget {
  const DrawerHeaderComponent({super.key});

  Future<String?> _getUserName() async {
    return await CacheHelper().getData(CacheVars.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 26.w),
        child: FutureBuilder<String?>(
            future: _getUserName(),
            builder: (context, snapshot) {
                String userName = snapshot.data ?? "Guest";
                return Row(children: [
                  Image.asset(width: 70.w, height: 70.h, AppAssets.person),
                  SizedBox(width: 6.5.w),
                  Text(userName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 20.h)
                ]);

            }));
  }
}
