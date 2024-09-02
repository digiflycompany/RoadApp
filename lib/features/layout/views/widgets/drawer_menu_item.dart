import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/cach_helper/cache_helper.dart';
import 'package:roadapp/core/cach_helper/cache_vars.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/features/layout/views/widgets/logout_alert_dialog.dart';
import 'package:roadapp/features/account/views/screens/account_settings_screen.dart';
import 'package:roadapp/features/account/views/screens/vendor_account_settings_screen.dart';
import 'package:roadapp/features/business_models/views/screens/business_models_screen.dart';
import 'package:roadapp/features/calender/views/screens/calender_screen.dart';
import 'package:roadapp/features/fuel_consuming_rate/views/screens/fuel_consuming_rate_screen.dart';
import 'package:roadapp/features/maintenance%20_report/views/screens/maintenance_report_screen.dart';
import 'package:roadapp/features/products_guide/views/screens/products_services_screen.dart';
import 'package:roadapp/features/reserve_appointment/views/screens/reserve_appointment_screen.dart';
import 'package:roadapp/features/road_services/views/screens/road_services_screen.dart';
import 'package:roadapp/features/vendor_reservations_management/view/screens/vendor_reservations_management_screen.dart';
import 'package:roadapp/features/work_reports/views/screens/work_reports_screen.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class DrawerMenuItemComponent extends StatelessWidget {
  const DrawerMenuItemComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight * 0.75,
      child: Padding(
        padding: EdgeInsets.only(right: 26.w),
        child: CacheHelper().getData(CacheVars.isVendor) ==true?Column(
          children: [
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppAssets.settingsIcon,width: 20.w,)
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
                  child: SvgPicture.asset(AppAssets.settingsIcon,width: 20.w,)
              ),
              title: Text("نماذج العمل",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: ()=>AppNavigation.navigate(const BusinessModelsScreen()),
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppAssets.settingsIcon,width: 20.w,)
              ),
              title: Text("إدارة الحجوزات والإشعارات",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: (){
                AppNavigation.navigate(const VendorReservationsManagementScreen());
              },
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppAssets.writingIcon,width: 20.w,)
              ),
              title: Text("مذكرة مواعيد زمنية",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: () =>AppNavigation.navigate(const CalenderScreen()),
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppAssets.guideIcon,width: 20.w,)
              ),
              title: Text("دليل الخدمات والمنتجات",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: ()=>AppNavigation.navigate(const ProductsServicesScreen()),
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppAssets.documentIcon,width: 20.w,)
              ),
              title: Text("تقارير العمل",
                style: TextStyle(
                    fontSize: 16.sp
                ),
              ),
              onTap: ()=>AppNavigation.navigate(const WorkReportsScreen()),
            ),
            SizedBox(height:5.h),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppAssets.contactIcon,width: 15.w,)
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
                  child: SvgPicture.asset(AppAssets.logoutIcon,width: 20.w,)
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
                  child: SvgPicture.asset(AppAssets.settingsIcon,width: 20.w,)
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
                  child: SvgPicture.asset(AppAssets.repairingIcon,width: 20.w,)
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
                  child: SvgPicture.asset(AppAssets.searchIcon,width: 20.w,)
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
                  child: SvgPicture.asset(AppAssets.calendarIcon,width: 20.w,)
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
                  child: SvgPicture.asset(AppAssets.fuelIcon,width: 20.w,)
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
                  child: SvgPicture.asset(AppAssets.repairingIcon,width: 20.w,)
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
                  child: SvgPicture.asset(AppAssets.logoutIcon,width: 20.w,)
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
        ),
      ),
    );
  }
}
