import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/custom_image.dart';
import 'package:roadapp/features/maintenance_center_details/view/screens/maintenance_center_details_screen.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MaintenanceCenterItem extends StatelessWidget {
  const MaintenanceCenterItem({super.key, this.maintenanceCenterList});

  final dynamic maintenanceCenterList;

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
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomImage(
            imagePath: AppAssets.carServiceWorker,
            radius: 4,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('${maintenanceCenterList.maintenanceCenterId.name}',
                        style: Styles.textStyle12.copyWith(fontSize: 8)),
                    const Spacer(),
                    Text(
                      '${StringManager.price.tr(context)}: ${maintenanceCenterList.cost} ${StringManager.le.tr(context)}',
                      style: Styles.textStyle12.copyWith(fontSize: 8),
                    ),
                  ],
                ),
                RatingBarIndicator(
                  rating: double.parse(((maintenanceCenterList
                                  .maintenanceCenterId
                                  .averageReviews
                                  .employeesBehavior +
                              maintenanceCenterList
                                  .maintenanceCenterId.averageReviews.speed +
                              maintenanceCenterList
                                  .maintenanceCenterId.averageReviews.honesty +
                              maintenanceCenterList
                                  .maintenanceCenterId.averageReviews.fairCost +
                              maintenanceCenterList.maintenanceCenterId
                                  .averageReviews.efficiency) /
                          5)
                      .toString()),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.r,
                  direction: Axis.horizontal,
                ),
                Row(
                  children: [
                    Container(
                      width: 5.r,
                      height: 5.r,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "${maintenanceCenterList.maintenanceCenterId.address.city} : ${maintenanceCenterList.maintenanceCenterId.address.firstLine}",
                      style: const TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                height: 16.h,
                width: width >= 500 ? width * .1025 : width * .205,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isArabic ? 0 : 4),
                    bottomRight: Radius.circular(isArabic ? 4 : 0)),
                onTap: () {
                  AppNavigation.navigate(MaintenanceCenterDetailsScreen(
                    maintenanceCenterList: maintenanceCenterList,
                  ));
                },
                widget: Text(
                  StringManager.forReservationsAndInquiries.tr(context),
                  style: const TextStyle(
                    fontSize: 8,
                    color: AppColors.secondColor,
                  ),
                ),
              ),
              CustomElevatedButton(
                height: 16.h,
                width: width >= 500 ? width * .1025 : width * .205,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isArabic ? 4 : 0),
                    bottomRight: Radius.circular(isArabic ? 0 : 4)),
                onTap: () async{

                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: maintenanceCenterList.maintenanceCenterId.landline,
                    );
                    await launchUrl(launchUri);

                },
                widget: Text(
                  "${StringManager.phoneNumber.tr(context)} : ${maintenanceCenterList.maintenanceCenterId.landline}",
                  style:
                      TextStyle(fontSize: 8.sp, color: AppColors.secondColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
