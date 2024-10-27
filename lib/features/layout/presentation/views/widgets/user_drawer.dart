import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/features/account/presentation/views/screens/account_settings_screen.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/screens/fuel_consuming_rate_screen.dart';
import 'package:roadapp/features/layout/presentation/views/widgets/logout_alert_dialog.dart';
import 'package:roadapp/features/maintenance%20_report/views/screens/maintenance_report_screen.dart';
import 'package:roadapp/features/reserve_appointment/views/screens/reserve_appointment_screen.dart';
import 'package:roadapp/features/road_services/views/screens/road_services_screen.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.settingsIcon, width: 20.w)),
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
              child: SvgPicture.asset(AppAssets.repairingIcon, width: 20.w)),
          title: Text(StringManager.maintenanceReports.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () => AppNavigation.navigate(const MaintenanceReportScreen())),
      const SizedBox(height: 5),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.searchIcon, width: 20.w)),
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
              child: SvgPicture.asset(AppAssets.calendarIcon, width: 20.w)),
          title: Text(StringManager.reservationsManagement.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () => AppNavigation.navigate(const AppointmentScreen())),
      const SizedBox(height: 5),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.fuelIcon, width: 20.w)),
          title: Text(StringManager.fuelReports.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () => AppNavigation.navigate(const FuelConsumingRateScreen())),
      const SizedBox(height: 5),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.repairingIcon, width: 20.w)),
          title: Text(StringManager.roadServices.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () => AppNavigation.navigate(const RoadServicesScreen())),
      const Spacer(),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.logoutIcon, width: 20.w)),
          title: const Text(StringManager.logout),
          onTap: () {
            showCustomAlertDialog(
                context: context,
                title: StringManager.alert.tr(context),
                content: const LogoutALerDialog());
          })
    ]);
  }
}