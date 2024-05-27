import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/layout/views/widgets/logout_alert_dialog.dart';
import 'package:roadapp/modules/account/views/screens/account_settings_screen.dart';
import 'package:roadapp/modules/account/views/screens/vendor_account_settings_screen.dart';
import 'package:roadapp/modules/fuel_consuming_rate/views/screens/fuel_consuming_rate_screen.dart';
import 'package:roadapp/modules/login/views/screens/login_screen.dart';
import 'package:roadapp/modules/maintenance%20_report/views/screens/maintenance_report_screen.dart';
import 'package:roadapp/modules/reserve_appointment/views/screens/reserve_appointment_screen.dart';
import 'package:roadapp/modules/road_services/views/screens/road_services_screen.dart';
import 'package:roadapp/services/navigation/navigation.dart';
import 'package:roadapp/services/shared_preferences/preferences_helper.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/widgets/custom_alert_dialog.dart';

class DrawerMenuItemComponent extends StatelessWidget {
  const DrawerMenuItemComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight * 0.75,
      child: Padding(
        padding: EdgeInsets.only(right: 26.w),
        child: PreferencesHelper.isVendor==true?Column(
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
              onTap: () {
                AppNavigation.navigate(const VendorAccountSettingsScreen());
              },
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.settingsIcon,width: 20.w,)
              ),
              title: Text("نماذج العمل",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: ()=>AppNavigation.navigate(const MaintenanceReportScreen()),
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.settingsIcon,width: 20.w,)
              ),
              title: Text("إدارة الحجوزات والإشعارات",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: (){},
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.writingIcon,width: 20.w,)
              ),
              title: Text("مذكرة مواعيد زمنية",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: () =>AppNavigation.navigate(const AppointmentScreen()),
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.guideIcon,width: 20.w,)
              ),
              title: Text("دليل الخدمات والمنتجات",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: ()=>AppNavigation.navigate(const FuelConsumingRateScreen()),
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.documentIcon,width: 20.w,)
              ),
              title: Text("تقارير العمل",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: ()=>AppNavigation.navigate(const RoadServicesScreen()),
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppImages.contactIcon,width: 15.w,)
              ),
              title: Text("تواصل معنا",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: ()=>AppNavigation.navigate(const RoadServicesScreen()),
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
                showCustomAlertDialog(
                    context: context,
                    title: 'تنبيه', content: const LogoutALerDialog());
                //AppNavigation.navigate(const LoginScreen());
              },
            ),
          ],
        ):Column(
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
              onTap: () {
                AppNavigation.navigate(const AccountSettingsScreen());
              },
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
              onTap: ()=>AppNavigation.navigate(const MaintenanceReportScreen()),
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
              onTap: (){},
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
              onTap: () =>AppNavigation.navigate(const AppointmentScreen()),
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
              onTap: ()=>AppNavigation.navigate(const FuelConsumingRateScreen()),
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
              onTap: ()=>AppNavigation.navigate(const RoadServicesScreen()),
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
