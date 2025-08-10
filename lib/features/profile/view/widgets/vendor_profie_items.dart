import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/addAds/presentation/views/screen/ads_screen.dart';
import 'package:roadapp/features/business_models/presentation/views/screens/business_models_screen.dart';
import 'package:roadapp/features/calendar/presentation/views/screens/calender_screen.dart';
import 'package:roadapp/features/clients/views/screens/clients_screen.dart';
import 'package:roadapp/features/contact_us/views/screens/contact_us_screen.dart';
import 'package:roadapp/features/coupons_and_gifts/views/screens/coupons_and_gifts_screen.dart';
import 'package:roadapp/features/general_inventory/data/repos/get_general_stock_repo.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_cubit.dart';
import 'package:roadapp/features/general_inventory/presentation/views/screens/general_inventory_movement_screen.dart';
import 'package:roadapp/features/products_guide/views/screens/products_services_screen.dart';
import 'package:roadapp/features/profile/view/widgets/profile_option_item.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/view/screens/vendor_reservations_management_screen.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';
import 'package:roadapp/features/work_reports/presentation/views/screens/work_reports_screen.dart';

import '../../../favorite/presentation/views/screens/favorite_screen.dart';
import '../../../privacyPolicy/cubit/privacy_policy_cubit.dart';
import '../../../privacyPolicy/view/screen/privacy_police_screen.dart';
import '../../../vendor_reservations_management/presentation/cubit/reservations_management_cubit.dart';
import '../../../vendor_reservations_management/presentation/cubit/reservations_management_state.dart';
import '../../../work_reports/presentation/views/screens/work_section_screen.dart';

class VendorProfileItems extends StatelessWidget {
  const VendorProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      ///----------------- نماذج العمل  -----------------///
      ProfileOptionItem(
          image: AppAssets.documentIcon,
          title: StringManager.workModels.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const BusinessModelsScreen());
          }),

      ///----------------- تقارير العمل  -----------------///
      ProfileOptionItem(
          image: AppAssets.documentIcon,
          title: StringManager.workReports.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const WorkSectionScreen());
          }),

      ///----------------- تقارير العملاء   -----------------///
      ProfileOptionItem(
          image: AppAssets.reportsIcon,
          title: StringManager.identifiedCustomersReports.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const ClientsScreen());
          }),

      ///----------------- تقارير العملاء المعرفين -----------------///
      BlocBuilder<ReservationManagementCubit, ReservationManagementStates>(
        builder: (context, state) {
          return ProfileOptionItem(
              image: AppAssets.alarmIcon,
              title:
                  StringManager.appointmentNotificationManagement.tr(context),
              voidCallback: () {
                ReservationManagementCubit.get(context)
                    .getReservationManagementData('PENDING');
                AppNavigation.navigate(
                    const VendorReservationsManagementScreen());
              });
        },
      ),

      ///----------------- سله الخدمات و المنتجات  -----------------///
      ProfileOptionItem(
          image: AppAssets.cartIcon,
          title: StringManager.servicesAndProductsBasket.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const ProductsServicesScreen());
          }),

      ///----------------- المفضله -----------------///
      ProfileOptionItem(
          image: AppAssets.heart,
          title: StringManager.fav.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const FavoriteScreen());
          }),

      ///----------------- مؤكره مواعيد زمنيه -----------------///
      ProfileOptionItem(
          image: AppAssets.writingIcon,
          title: StringManager.timelineMemo.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const CalenderScreen());
          }),

      ///----------------- حركه المخزون العام -----------------///
      ProfileOptionItem(
          image: AppAssets.writingIcon,
          title: StringManager.generalInventoryMovement.tr(context),
          voidCallback: () {
            AppNavigation.navigate(BlocProvider(
              create: (context) =>
                  InventoryCubit(getIt.get<GetGeneralStockRepo>())
                    ..getInventoryRecord(),
              child: const GeneralInventoryMovementScreen(),
            ));
          }),

      ///----------------- طلب اضافه اعلان -----------------///
      ProfileOptionItem(
          image: AppAssets.addIcon,
          title: StringManager.addAds.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const AdsScreen());
          }),
      // ProfileOptionItem(
      //     image: AppAssets.surprise,
      //     title: StringManager.giftsAndDiscountCoupons.tr(context),
      //     voidCallback: () {
      //       AppNavigation.navigate(const CouponsAndGiftsScreen());
      //     }),
      // ProfileOptionItem(
      //     image: AppAssets.guideIcon,
      //     title: StringManager.servicesAndProductsGuide.tr(context),
      //     voidCallback: () {
      //       AppNavigation.navigate(const ProductsServicesScreen());
      //     }),
      // ProfileOptionItem(
      //     image: AppAssets.update,
      //     title: StringManager.accountUpgrade.tr(context)),

      ///----------------- تغيير اللغه -----------------///
      ProfileOptionItem(
          voidCallback: () => LocaleCubit.get(context)
              .changeLanguage(currentLang == 'ar' ? 'en' : 'ar'),
          image: AppAssets.language,
          title: StringManager.changeLang.tr(context)),

      ///----------------- سياسه الخصوصيه -----------------///
      BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
        builder: (context, state) {
          var cubit = PrivacyPolicyCubit.get(context);
          return ProfileOptionItem(
              image: AppAssets.policy,
              title: StringManager.privacyPolicy.tr(context),
              voidCallback: () {
                cubit.fetchPrivacyPolicy();
                AppNavigation.navigate(const PrivacyPoliceScreen());
              });
        },
      ),
      // ProfileOptionItem(
      //     image: AppAssets.policy,
      //     title: StringManager.membershipPolicy.tr(context)),

      ///----------------- تواصل معنا -----------------///
      ProfileOptionItem(
          image: AppAssets.contactUs,
          title: StringManager.contactUs.tr(context),
          voidCallback: () {
            AppNavigation.navigate(const ContactUsScreen());
          })
    ]);
  }
}
