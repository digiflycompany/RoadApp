import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/modules/login/views/screens/login_screen.dart';
import 'package:roadapp2/services/navigation/navigation.dart';
import 'package:roadapp2/shared/const/app_images.dart';

class DrawerMenuItemComponent extends StatelessWidget {
  const DrawerMenuItemComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight * 0.75,
      child: Padding(
        padding: EdgeInsets.only(right: 26.w),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.settingsIcon,width: 20.w,)
              ),
              title: Text("اعدادات الحساب",
              style: TextStyle(
                fontSize: 16.sp
              ),
              ),
              onTap: () {},
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.repairingIcon,width: 20.w,)
              ),
              title: Text("تقارير الصيانة",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.searchIcon,width: 20.w,)
              ),
              title: Text("البحث",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.calendarIcon,width: 20.w,)
              ),
              title: Text("إدارة الحجوزات",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.fuelIcon,width: 20.w,)
              ),
              title: Text("تقارير الوقود",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.repairingIcon,width: 20.w,)
              ),
              title: Text("خدمات الطريق",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: () {},
            ),
            const Spacer(),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.logoutIcon,width: 20.w,)
              ),
              title: const Text("تسجيل الخروج"),
              onTap: () {
                AppNavigation.navigate(const LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
