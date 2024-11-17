import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/road_services/data/models/road_service_model.dart';
import 'package:url_launcher/url_launcher.dart';

class GasStationContainer extends StatelessWidget {
  const GasStationContainer({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.locationMap,
    required this.phone,
    required this.roadService,
  });

  final RoadService roadService;
  final String image;

  final String title;

  final String location;

  final String locationMap;

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: 280.w,
              height: 90.h,
              decoration: BoxDecoration(
                  color: AppColors.greyColor3,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.primaryColor, width: 1.w)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 9.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      image,
                      height: 60.h,
                      width: 60.w,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          color: AppColors.red,
                        );
                      },
                    ),
                    SizedBox(width: 14.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600)),
                        Text(location,
                            style: TextStyle(
                                fontSize: 9.sp, fontWeight: FontWeight.w600)),
                        Text(phone,
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Container(
              height: 90.h,
              decoration: BoxDecoration(
                  color: AppColors.greyColor3,
                  borderRadius: BorderRadius.circular(8.r),
                  border:
                      Border.all(color: AppColors.primaryColor, width: 1.w)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                child: GestureDetector(
                  onTap: () async {
                    Uri url = Uri.parse(roadService.mapsLink);
                    launchUrl(url);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(AppAssets.locationIcon, width: 20.w),
                      const Spacer(),
                      Text(
                        StringManager.servicesMenu.tr(context),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
