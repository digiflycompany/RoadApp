import 'package:flutter/material.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/business_models/views/screens/business_models_screen.dart';
import 'package:roadapp/features/calender/views/screens/calender_screen.dart';
import 'package:roadapp/features/clients/views/clients_screen.dart';
import 'package:roadapp/features/contact_us/views/screens/contact_us_screen.dart';
import 'package:roadapp/features/coupons_and_gifts/views/screens/coupons_and_gifts_screen.dart';
import 'package:roadapp/features/general_inventory/views/screens/general_inventory_movement_screen.dart';
import 'package:roadapp/features/products_guide/views/screens/products_services_screen.dart';
import 'package:roadapp/features/profile/view/widgets/profile_option_item.dart';
import 'package:roadapp/features/vendor_reservations_management/view/screens/vendor_reservations_management_screen.dart';
import 'package:roadapp/features/work_reports/views/screens/work_reports_screen.dart';

class VendorProfileItems extends StatelessWidget {
  const VendorProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: "تقارير العملاء المعرفين",
          voidCallback: () {
            AppNavigation.navigate(ClientsScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.alarmIcon,
          title: "ادارة المواعيد والاشعارات",
          voidCallback: () {
            AppNavigation.navigate(const VendorReservationsManagementScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.cartIcon,
          title: "سلة الخدمات والمنتجات",
          voidCallback: () {
            AppNavigation.navigate(const ProductsServicesScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.writingIcon,
          title: "مذكرة مواعيد زمنية",
          voidCallback: () {
            AppNavigation.navigate(const CalenderScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.writingIcon,
          title: "حركة المخزون العام",
          voidCallback: () {
            AppNavigation.navigate(const GeneralInventoryMovementScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.surprise,
          title: "الهدايا وكوبونات الخصم",
          voidCallback: () {
            AppNavigation.navigate(const CouponsAndGiftsScreen());
          }),
      ProfileOptionItem(
          image: AppAssets.guideIcon,
          title: "دليل الخدمات والمنتجات",
          voidCallback: () {
            AppNavigation.navigate(const ProductsServicesScreen());
          }),
      const ProfileOptionItem(image: AppAssets.update, title: "ترقية الحساب"),
      const ProfileOptionItem(image: AppAssets.language, title: "تغيير اللغة"),
      const ProfileOptionItem(image: AppAssets.policy, title: "سياسة العضوية"),
      ProfileOptionItem(
          image: AppAssets.contactUs,
          title: "تواصل معنا",
          voidCallback: () {
            AppNavigation.navigate(const ContactUsScreen());
          },
          withDevider: false)
    ]);
  }
}
