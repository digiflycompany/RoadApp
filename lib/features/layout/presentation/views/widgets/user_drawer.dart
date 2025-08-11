import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/features/account/data/repo/account_repo.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/views/screens/account_settings_screen.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/repos/fuel_rates_repo.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/cubit.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/screens/fuel_consuming_rate_screen.dart';
import 'package:roadapp/features/layout/presentation/cubit/applayout_cubit.dart';
import 'package:roadapp/features/layout/presentation/views/widgets/logout_alert_dialog.dart';
import 'package:roadapp/features/reserve_appointment/presentation/views/screens/reserve_appointment_screen.dart';
import 'package:roadapp/features/road_services/views/screens/road_services_screen.dart';
import 'package:roadapp/features/vehicles/data/repos/vehicles_repo.dart';

import '../../../../contact_us/views/screens/contact_us_screen.dart';
import '../../../../vehicles/presentation/views/screens/vehicles_screen_two.dart';

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
            AppNavigation.navigate(BlocProvider(
              create: (context) => AccountCubit(getIt.get<AccountRepo>())
                ..fetchAccount()
                ..fetchAccountUser(),
              child: const AccountSettingsScreen(),
            ));
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
          onTap: () => AppNavigation.navigate(const VehiclesScreenTwo())),
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
          onTap: () {
            Navigator.pop(context);
            AppLayoutCubit.get(context).changeBottomNavBar(1);
          }),
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
          onTap: () => AppNavigation.navigate(BlocProvider(
              create: (context) => FuelConsumingRateCubit(
                  getIt.get<FuelRatesRepo>(), getIt.get<VehiclesRepo>())
                ..fetchFuelRates()
                ..fetchVehicles(),
              child: const FuelConsumingRateScreen()))),
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
          onTap: () {
            AppNavigation.navigate(
              const ContactUsScreen(),
            );
          }),
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
