import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/calendar/presentation/views/screens/calender_screen.dart';
import 'package:roadapp/features/contact_us/views/screens/contact_us_screen.dart';
import 'package:roadapp/features/coupons_and_gifts/views/screens/coupons_and_gifts_screen.dart';
import 'package:roadapp/features/favorite/views/screens/favorite_screen.dart';
import 'package:roadapp/features/fuel_consuming_rate/views/screens/fuel_consuming_rate_screen.dart';
import 'package:roadapp/features/profile/view/widgets/profile_option_item.dart';
import 'package:roadapp/features/reserve_appointment/views/screens/reserve_appointment_screen.dart';
import 'package:roadapp/features/vehicles/views/vehicles_screen.dart';
import 'package:roadapp/features/vehicles/views/vehicles_screen_two.dart';

class UserProfileItems extends StatelessWidget {
  const UserProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      ProfileOptionItem(
          image: AppAssets.car,
          title: StringManager.identifiedVehicles.tr(context),
          voidCallback: () {
            AppNavigation.navigate(VehiclesScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.repair,
          title: StringManager.maintenanceReports.tr(context),
          voidCallback: () {
            AppNavigation.navigate(VehiclesScreenTwo());
          }),
      ProfileOptionItem(
          image: AppAssets.heart,
          title: StringManager.fav.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const FavoriteScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.writing,
          title: StringManager.reservationsManagement.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const AppointmentScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.calender,
          title: StringManager.timeScheduleNote.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const CalenderScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.fuel,
          title: StringManager.fuelUsageRate.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const FuelConsumingRateScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.surprise,
          title: StringManager.giftsAndDiscountCoupons.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const CouponsAndGiftsScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.update,
          title: StringManager.accountUpgrade.tr(context)),
      ProfileOptionItem(
          voidCallback: () => context
              .read<LocaleCubit>()
              .changeLanguage(currentLang == 'ar' ? 'en' : 'ar'),
          image: AppAssets.language,
          title: StringManager.changeLang.tr(context)),
      ProfileOptionItem(
          image: AppAssets.policy,
          title: StringManager.privacyPolicy.tr(context)),
      ProfileOptionItem(
          image: AppAssets.contactUs,
          title: StringManager.contactUs.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const ContactUsScreen());
          })
    ]);
  }
}