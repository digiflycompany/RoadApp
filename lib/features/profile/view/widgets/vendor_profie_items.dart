import 'package:flutter/material.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/views/screens/business_models_screen.dart';
import 'package:roadapp/features/calendar/presentation/views/screens/calender_screen.dart';
import 'package:roadapp/features/clients/views/screens/clients_screen.dart';
import 'package:roadapp/features/contact_us/views/screens/contact_us_screen.dart';
import 'package:roadapp/features/coupons_and_gifts/views/screens/coupons_and_gifts_screen.dart';
import 'package:roadapp/features/general_inventory/presentation/views/screens/general_inventory_movement_screen.dart';
import 'package:roadapp/features/products_guide/views/screens/products_services_screen.dart';
import 'package:roadapp/features/profile/view/widgets/profile_option_item.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/view/screens/vendor_reservations_management_screen.dart';
import 'package:roadapp/features/work_reports/presentation/views/screens/work_reports_screen.dart';

class VendorProfileItems extends StatelessWidget {
  const VendorProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      ProfileOptionItem(
          image: AppAssets.documentIcon,
          title: StringManager.workModels.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const BusinessModelsScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.documentIcon,
          title: StringManager.workReports.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const WorkReportsScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.reportsIcon,
          title: StringManager.identifiedCustomersReports.tr(context),
          voidCallback: () {
            AppNavigation.navigate(ClientsScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.alarmIcon,
          title: StringManager.appointmentNotificationManagement.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const VendorReservationsManagementScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.cartIcon,
          title: StringManager.servicesAndProductsBasket.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const ProductsServicesScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.writingIcon,
          title: StringManager.timelineMemo.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const CalenderScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.writingIcon,
          title: StringManager.generalInventoryMovement.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const GeneralInventoryMovementScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.surprise,
          title: StringManager.giftsAndDiscountCoupons.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const CouponsAndGiftsScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.guideIcon,
          title: StringManager.servicesAndProductsGuide.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const ProductsServicesScreen());
          }),
      ProfileOptionItem(image: AppAssets.update, title: StringManager.accountUpgrade.tr(context)),
      ProfileOptionItem(
          voidCallback: () => LocaleCubit.get(context).changeLanguage(currentLang == 'ar'? 'en': 'ar'),
          image: AppAssets.language, title: StringManager.changeLang.tr(context)),
      ProfileOptionItem(image: AppAssets.policy, title: StringManager.membershipPolicy.tr(context)),
      ProfileOptionItem(
          image: AppAssets.contactUs,
          title: StringManager.contactUs.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const ContactUsScreen());
          })
    ]);
  }
}