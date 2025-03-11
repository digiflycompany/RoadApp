import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/screens/account_settings_screen.dart';
import 'package:roadapp/features/my_maintenance_centers/presentation/views/screens/my_maintenance_centers.dart';
import 'package:roadapp/features/business_models/presentation/views/screens/business_models_screen.dart';
import 'package:roadapp/features/calendar/presentation/views/screens/calender_screen.dart';
import 'package:roadapp/features/layout/presentation/views/widgets/logout_alert_dialog.dart';
import 'package:roadapp/features/products_guide/views/screens/products_services_screen.dart';
import 'package:roadapp/features/road_services/views/screens/road_services_screen.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/view/screens/vendor_reservations_management_screen.dart';
import 'package:roadapp/features/work_reports/presentation/views/screens/work_reports_screen.dart';

import '../../../../contact_us/views/screens/contact_us_screen.dart';
import '../../../../work_reports/presentation/views/screens/work_section_screen.dart';

class VendorDrawer extends StatelessWidget {
  const VendorDrawer({super.key});

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
      BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          return ListTile(
              leading: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.black),
                  child: SvgPicture.asset(AppAssets.settingsIcon, width: 20.w)),
              title: Text(StringManager.maintenanceCenters.tr(context),
                  style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                AccountCubit.get(context).fetchAccount();
                AccountCubit.get(context).fetchMaintenanceServiceType();
                AccountCubit.get(context).fetchProductType();
                AccountCubit.get(context).userData!.user!;
                if(AccountCubit.get(context).userData!.user != null){
                  AppNavigation.navigate(const MyMaintenanceCenters());

                }
              });
        },
      ),
      const SizedBox(height: 5),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.documentIcon, width: 20.w)),
          title: Text(StringManager.workModels.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () => AppNavigation.navigate(const BusinessModelsScreen())),
      const SizedBox(height: 5),

      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.documentIcon, width: 20.w)),
          title: Text(StringManager.workReports.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () => AppNavigation.navigate(const WorkSectionScreen())
      ),
      const SizedBox(height: 5),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.alarmIcon, width: 20.w)),
          title: Text(
              StringManager.reservationsAndNotificationsManagement.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () {
            AppNavigation.navigate(const VendorReservationsManagementScreen());
          }),
      const SizedBox(height: 5),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.writingIcon, width: 20.w)),
          title: Text(StringManager.timeScheduleNote.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () => AppNavigation.navigate(const CalenderScreen())),
      const SizedBox(height: 5),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.guideIcon, width: 20.w)),
          title: Text(StringManager.servicesAndProductsGuide.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () => AppNavigation.navigate(const ProductsServicesScreen())),
      const SizedBox(height: 5),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.documentIcon, width: 20.w)),
          title: Text(StringManager.workReports.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () => AppNavigation.navigate(const WorkReportsScreen())),
      const SizedBox(height: 5),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.contactIcon, width: 15.w)),
          title: Text(StringManager.contactUs.tr(context),
              style: TextStyle(fontSize: 16.sp)),
          onTap: () => AppNavigation.navigate(const ContactUsScreen())),
      const Spacer(),
      ListTile(
          leading: Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.black),
              child: SvgPicture.asset(AppAssets.logoutIcon, width: 20.w)),
          title: Text(StringManager.logout.tr(context)),
          onTap: () {
            showCustomAlertDialog(
                context: context,
                title: StringManager.alert.tr(context),
                content: const LogoutALerDialog());
          })
    ]);
  }
}