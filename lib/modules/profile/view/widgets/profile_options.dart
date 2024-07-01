import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/calender/views/screens/calender_screen.dart';
import 'package:roadapp/modules/clients/views/clients_screen.dart';
import 'package:roadapp/modules/contact_us/views/screens/contact_us_screen.dart';
import 'package:roadapp/modules/coupons_and_gifts/views/screens/coupons_and_gifts_screen.dart';
import 'package:roadapp/modules/favorite/views/screens/favorite_screen.dart';
import 'package:roadapp/modules/fuel_consuming_rate/views/screens/fuel_consuming_rate_screen.dart';
import 'package:roadapp/modules/profile/view/widgets/profile_option_item.dart';
import 'package:roadapp/modules/reserve_appointment/views/screens/reserve_appointment_screen.dart';
import 'package:roadapp/modules/vehicles/views/vehicles_screen.dart';
import 'package:roadapp/modules/vehicles/views/vehicles_screen_two.dart';
import 'package:roadapp/modules/work_reports/views/screens/work_reports_screen.dart';
import 'package:roadapp/services/navigation/navigation.dart';
import 'package:roadapp/services/shared_preferences/preferences_helper.dart';
import 'package:roadapp/shared/components.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/resources/colors.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        elevation: 2,
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: AppColors.tertiary,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SingleChildScrollView(
            child: PreferencesHelper.isVendor
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileOptionItem(
                          image: AppImages.documentIcon,
                          title: "نماذج وتقارير العمل",
                          voidCallback: () {
                            AppNavigation.navigate(
                                const VendorMaintenanceReportScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.reportsIcon,
                          title: "تقارير العملاء المعرفين",
                          voidCallback: () {
                            AppNavigation.navigate(ClientsScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.alarmIcon,
                          title: "ادارة المواعيد والاشعارات",
                          voidCallback: () {
                            AppNavigation.navigate(const FavoriteScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.cartIcon,
                          title: "سلة الخدمات والمنتجات",
                          voidCallback: () {
                            AppNavigation.navigate(const AppointmentScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.writingIcon,
                          title: "مذكرة مواعيد زمنية",
                          voidCallback: () {
                            AppNavigation.navigate(const CalenderScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.surprise,
                          title: "الهدايا وكوبونات الخصم",
                          voidCallback: () {
                            AppNavigation.navigate(
                                const CouponsAndGiftsScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.guideIcon,
                          title: "دليل الخدمات والمنتجات",
                          voidCallback: () {
                            AppNavigation.navigate(
                                const FuelConsumingRateScreen());
                          }),
                      divider(),
                      const ProfileOptionItem(
                          image: AppImages.update, title: "ترقية الحساب"),
                      divider(),
                      const ProfileOptionItem(
                          image: AppImages.language, title: "تغيير اللغة"),
                      divider(),
                      const ProfileOptionItem(
                          image: AppImages.policy, title: "سياسة العضوية"),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.contactUs,
                          title: "تواصل معنا",
                          voidCallback: () {
                            AppNavigation.navigate(const ContactUsScreen());
                          }),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileOptionItem(
                          image: AppImages.car,
                          title: "المركبات المعرفة",
                          voidCallback: () {
                            AppNavigation.navigate(VehiclesScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.repair,
                          title: "تقارير الصيانة",
                          voidCallback: () {
                            AppNavigation.navigate(VehiclesScreenTwo());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.heart,
                          title: "المفضلة",
                          voidCallback: () {
                            AppNavigation.navigate(const FavoriteScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.writing,
                          title: "إدارة الحجوزات",
                          voidCallback: () {
                            AppNavigation.navigate(const AppointmentScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.calender,
                          title: "مذكرة مواعيد زمنية",
                          voidCallback: () {
                            AppNavigation.navigate(const CalenderScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.fuel,
                          title: "معدل استهلاك الوقود",
                          voidCallback: () {
                            AppNavigation.navigate(
                                const FuelConsumingRateScreen());
                          }),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.surprise,
                          title: "الهدايا وكوبونات الخصم",
                          voidCallback: () {
                            AppNavigation.navigate(
                                const CouponsAndGiftsScreen());
                          }),
                      divider(),
                      const ProfileOptionItem(
                          image: AppImages.update, title: "ترقية الحساب"),
                      divider(),
                      const ProfileOptionItem(
                          image: AppImages.language, title: "تغيير اللغة"),
                      divider(),
                      const ProfileOptionItem(
                          image: AppImages.policy, title: "سياسة العضوية"),
                      divider(),
                      ProfileOptionItem(
                          image: AppImages.contactUs,
                          title: "تواصل معنا",
                          voidCallback: () {
                            AppNavigation.navigate(const ContactUsScreen());
                          }),
                    ],
                  ),
            child: PreferencesHelper.isVendor?Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileOptionItem(
                    image: AppImages.documentIcon,
                    title: "نماذج العمل",
                    voidCallback: () {
                      AppNavigation.navigate(const BusinessModelsScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.documentIcon,
                    title: "تقارير العمل",
                    voidCallback: () {
                      AppNavigation.navigate(const WorkReportsScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.reportsIcon,
                    title: "تقارير العملاء المعرفين",
                    voidCallback: () {
                      AppNavigation.navigate(const BusinessModelsScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.alarmIcon,
                    title: "ادارة المواعيد والاشعارات",
                    voidCallback: () {
                      AppNavigation.navigate(const FavoriteScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.cartIcon,
                    title: "سلة الخدمات والمنتجات",
                    voidCallback: () {
                      AppNavigation.navigate(const AppointmentScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.writingIcon,
                    title: "مذكرة مواعيد زمنية",
                    voidCallback: () {
                      AppNavigation.navigate(const CalenderScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.surprise, title: "الهدايا وكوبونات الخصم",
                    voidCallback: () {
                      AppNavigation.navigate(const CouponsAndGiftsScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.guideIcon,
                    title: "دليل الخدمات والمنتجات",
                    voidCallback: () {
                      AppNavigation.navigate(const FuelConsumingRateScreen());
                    }),
                divider(),
                const ProfileOptionItem(
                    image: AppImages.update, title: "ترقية الحساب"),
                divider(),
                const ProfileOptionItem(
                    image: AppImages.language, title: "تغيير اللغة"),
                divider(),
                const ProfileOptionItem(
                    image: AppImages.policy, title: "سياسة العضوية"),
                divider(),
                ProfileOptionItem(
                    image: AppImages.contactUs, title: "تواصل معنا",
                    voidCallback: () {
                      AppNavigation.navigate(const ContactUsScreen());
                    }),
              ],
            ):Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileOptionItem(
                    image: AppImages.car,
                    title: "المركبات المعرفة",
                    voidCallback: () {
                      AppNavigation.navigate(VehiclesScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.repair,
                    title: "تقارير الصيانة",
                    voidCallback: () {
                      AppNavigation.navigate(VehiclesScreenTwo());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.heart,
                    title: "المفضلة",
                    voidCallback: () {
                      AppNavigation.navigate(const FavoriteScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.writing,
                    title: "إدارة الحجوزات",
                    voidCallback: () {
                      AppNavigation.navigate(const AppointmentScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.calender,
                    title: "مذكرة مواعيد زمنية",
                    voidCallback: () {
                      AppNavigation.navigate(const CalenderScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.fuel,
                    title: "معدل استهلاك الوقود",
                    voidCallback: () {
                      AppNavigation.navigate(const FuelConsumingRateScreen());
                    }),
                divider(),
                ProfileOptionItem(
                    image: AppImages.surprise, title: "الهدايا وكوبونات الخصم",
                    voidCallback: () {
                      AppNavigation.navigate(const CouponsAndGiftsScreen());
                    }),
                divider(),
                const ProfileOptionItem(
                    image: AppImages.update, title: "ترقية الحساب"),
                divider(),
                const ProfileOptionItem(
                    image: AppImages.language, title: "تغيير اللغة"),
                divider(),
                const ProfileOptionItem(
                    image: AppImages.policy, title: "سياسة العضوية"),
                divider(),
                ProfileOptionItem(
                    image: AppImages.contactUs, title: "تواصل معنا",
                    voidCallback: () {
                      AppNavigation.navigate(const ContactUsScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
