import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/calender/views/screens/calender_screen.dart';
import 'package:roadapp2/modules/favorite/views/screens/favorite_screen.dart';
import 'package:roadapp2/modules/fuel_consuming_rate/views/screens/fuel_consuming_rate_screen.dart';
import 'package:roadapp2/modules/maintenance%20_report/views/screens/maintenance_report_screen.dart';
import 'package:roadapp2/modules/profile/view/widgets/profile_option_item.dart';
import 'package:roadapp2/modules/reserve_appointment/screens/appointment_screen.dart';
import 'package:roadapp2/modules/vehicles/vehicles_screen.dart';
import 'package:roadapp2/services/navigation/navigation.dart';
import 'package:roadapp2/shared/components.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        elevation: 2,
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.all(15.r),
          decoration: const BoxDecoration(
            color: AppColors.tertiary,
          ),
          child: SingleChildScrollView(
            child: Column(
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
                      AppNavigation.navigate(const MaintenanceReportScreen());
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
                const ProfileOptionItem(
                    image: AppImages.surprise, title: "الهدايا وكوبونات الخصم"),
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
                const ProfileOptionItem(
                    image: AppImages.contactUs, title: "تواصل معنا"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
