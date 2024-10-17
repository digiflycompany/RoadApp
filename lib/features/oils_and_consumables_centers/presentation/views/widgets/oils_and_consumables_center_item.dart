import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/custom_image.dart';
import 'package:roadapp/features/oils_and_consumables_center_details/view/screens/oils_and_consumables_center_details_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class OilsAndConsumablesCentersItem extends StatelessWidget {
  const OilsAndConsumablesCentersItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    var width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFD7D7D7),
                  blurRadius: 10,
                  offset: Offset(0, 2))
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomImage(imagePath: AppAssets.carServiceWorker, radius: 4),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text('${StringManager.centerName.tr(context)}:',
                          style: Styles.textStyle12.copyWith(fontSize: 8)),
                      const Spacer(),
                      Text(
                          '${StringManager.price.tr(context)}: 320 ${StringManager.le.tr(context)}',
                          style: Styles.textStyle12.copyWith(fontSize: 8))
                    ]),
                    RatingBarIndicator(
                        rating: 5,
                        itemBuilder: (context, index) =>
                        const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 15.r,
                        direction: Axis.horizontal),
                    Row(children: [
                      Container(
                          width: 5.r,
                          height: 5.r,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5.r))),
                      SizedBox(width: 10.w),
                      const Text("عباس العقاد - مدينة نصر",
                          style: TextStyle(
                              fontSize: 7, fontWeight: FontWeight.bold))
                    ])
                  ])),
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomElevatedButton(
                height: 16.h,
                width: width >= 500 ? width * .1025 : width * .205,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isArabic ? 0 : 4),
                    bottomRight: Radius.circular(isArabic ? 4 : 0)),
                onTap: () {
                  AppNavigation.navigate(
                      const OilsAndConsumablesCenterDetailsScreen());
                },
                widget: Text(
                    StringManager.forReservationsAndInquiries.tr(context),
                    style: const TextStyle(
                        fontSize: 8, color: AppColors.secondColor))),
            CustomElevatedButton(
                height: 16.h,
                width: width >= 500 ? width * .1025 : width * .205,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isArabic ? 4 : 0),
                    bottomRight: Radius.circular(isArabic ? 0 : 4)),
                onTap: () {},
                widget: Text(StringManager.phoneNumber.tr(context),
                    style: TextStyle(
                        fontSize: 8.sp, color: AppColors.secondColor)))
          ])
        ]));
  }
}
