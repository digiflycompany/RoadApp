import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/road_services/data/models/road_service_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/navigation/navigation.dart';
import '../screens/road_service_screen.dart';

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
    return SizedBox(
      height: 150,
      child: Padding(
        padding: EdgeInsets.only(bottom: 14.h),
        child: Row(
          children: [
            Expanded(
              child: Container(
                // height: 90.h,
                decoration: BoxDecoration(
                    color: AppColors.greyColor3,
                    borderRadius: BorderRadius.circular(8.r),
                    border:
                        Border.all(color: AppColors.primaryColor, width: 1.w)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                  child: GestureDetector(
                    onTap: () async {
                      AppNavigation.navigate(
                        ServiceMenu(
                          roadService: roadService,
                        ),
                      );

                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       scrollable: true,
                      //       title: Center(
                      //         child: Text(
                      //           StringManager.servicesMenu.tr(context),
                      //           style: TextStyle(
                      //               fontSize: 14.sp, fontWeight: FontWeight.w600),
                      //         ),
                      //       ),
                      //       content: SizedBox(
                      //         height: 100.h,
                      //         child: ListView.builder(
                      //           itemCount: roadService.services.length,
                      //             itemBuilder: (context, index) {
                      //               return Text(
                      //                 roadService.services[index],
                      //                 style: TextStyle(
                      //                     fontSize: 12.sp,
                      //                     color: AppColors.black,
                      //                     fontWeight: FontWeight.w600),
                      //               );
                      //             },
                      //         ),
                      //       ),
                      //       actions: [
                      //         TextButton(
                      //           child: Text(
                      //             StringManager.cancel.tr(context),
                      //             style: TextStyle(
                      //                 fontSize: 12.sp,
                      //                 color: AppColors.black,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           onPressed: () => Navigator.pop(context),
                      //         ),
                      //       ],
                      //       //  content: Text(roadService.description),
                      //     );
                      //   },
                      // );
                    },
                    child: Column(
                      children: [
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
            SizedBox(width: 3.w),
            Expanded(
              flex: 5,
              child: Container(
                // height: 90.h,
                decoration: BoxDecoration(
                    color: AppColors.greyColor3,
                    borderRadius: BorderRadius.circular(8.r),
                    border:
                        Border.all(color: AppColors.primaryColor, width: 1.w)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 9.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          image,
                          height: 55.h,
                          width: 30.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.error,
                              color: AppColors.red,
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis)),
                          Text(location,
                              style: TextStyle(
                                  fontSize: 9.sp, fontWeight: FontWeight.w600)),
                          Text(phone,
                              style: TextStyle(
                                  fontSize: 11.sp, fontWeight: FontWeight.w600))
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Container(
                // height: 90.h,
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
                        const Spacer(),
                        SvgPicture.asset(AppAssets.locationIcon, width: 20.w),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
