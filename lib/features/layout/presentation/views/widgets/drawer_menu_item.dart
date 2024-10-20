import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/cach_helper/cache_helper.dart';
import 'package:roadapp/core/cach_helper/cache_vars.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/features/account/presentation/views/screens/account_settings_screen.dart';
import 'package:roadapp/features/account/presentation/views/screens/vendor_account_settings_screen.dart';
import 'package:roadapp/features/business_models/presentation/views/screens/business_models_screen.dart';
import 'package:roadapp/features/calendar/presentation/views/screens/calender_screen.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/screens/fuel_consuming_rate_screen.dart';
import 'package:roadapp/features/layout/presentation/views/widgets/logout_alert_dialog.dart';
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
    return Padding(
        padding: EdgeInsets.only(right: 26.w),
        child: CacheHelper().getData(CacheVars.isVendor) == true
            ? Column(children: [
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.settingsIcon,
                            width: 20.w)),
                    title: Text(StringManager.profileSettings.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () {
                      AppNavigation.navigate(
                          const VendorAccountSettingsScreen());
                    }),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.settingsIcon,
                            width: 20.w)),
                    title: Text(StringManager.workModels.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () => AppNavigation.navigate(
                        const BusinessModelsScreen())),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.settingsIcon,
                            width: 20.w)),
                    title: Text(
                        StringManager.reservationsAndNotificationsManagement
                            .tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () {
                      AppNavigation.navigate(
                          const VendorReservationsManagementScreen());
                    }),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.writingIcon,
                            width: 20.w)),
                    title: Text(StringManager.timeScheduleNote.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () =>
                        AppNavigation.navigate(const CalenderScreen())),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.guideIcon,
                            width: 20.w)),
                    title: Text(
                        StringManager.servicesAndProductsGuide.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () => AppNavigation.navigate(
                        const ProductsServicesScreen())),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.documentIcon,
                            width: 20.w)),
                    title: Text(StringManager.workReports.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () =>
                        AppNavigation.navigate(const WorkReportsScreen())),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.contactIcon,
                            width: 15.w)),
                    title: Text(StringManager.contactUs.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () =>
                        AppNavigation.navigate(const RoadServicesScreen())),
                const Spacer(),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.logoutIcon,
                            width: 20.w)),
                    title: Text(StringManager.logout.tr(context)),
                    onTap: () {
                      showCustomAlertDialog(
                          context: context,
                          title: StringManager.alert.tr(context),
                          content: const LogoutALerDialog());
                    })
              ])
            : Column(children: [
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.settingsIcon,
                            width: 20.w)),
                    title: Text(StringManager.profileSettings.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () {
                      AppNavigation.navigate(const AccountSettingsScreen());
                    }),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.repairingIcon,
                            width: 20.w)),
                    title: Text(
                        StringManager.maintenanceReports.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () => AppNavigation.navigate(
                        const MaintenanceReportScreen())),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.searchIcon,
                            width: 20.w)),
                    title: Text(StringManager.search.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () {}),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.calendarIcon,
                            width: 20.w)),
                    title: Text(
                        StringManager.reservationsManagement.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () =>
                        AppNavigation.navigate(const AppointmentScreen())),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.fuelIcon,
                            width: 20.w)),
                    title: Text(StringManager.fuelReports.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () => AppNavigation.navigate(
                        const FuelConsumingRateScreen())),
                const SizedBox(height: 5),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.repairingIcon,
                            width: 20.w)),
                    title: Text(StringManager.roadServices.tr(context),
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () =>
                        AppNavigation.navigate(const RoadServicesScreen())),
               const Spacer(),
                ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.black),
                        child: SvgPicture.asset(AppAssets.logoutIcon,
                            width: 20.w)),
                    title: const Text(StringManager.logout),
                    onTap: () {
                      showCustomAlertDialog(
                          context: context,
                          title: StringManager.alert.tr(context),
                          content: const LogoutALerDialog());
                    })
              ]));
  }
}