import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/accessories_center_details/view/screens/accessories_center_details_screen.dart';
import 'package:roadapp2/modules/spare_parts_center_details/view/screens/spare_parts_center_details_screen.dart';
import 'package:roadapp2/services/navigation/navigation.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class AccessoriesCentersItem extends StatelessWidget {
  const AccessoriesCentersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color(0xFFD7D7D7), blurRadius: 10, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              AppImages.carServiceWorker,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                Text(
                  "اسم المركز",
                  style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "السعر: 320 جنيه",
                  style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          RatingBarIndicator(
            rating: 5,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 15.r,
            direction: Axis.horizontal,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Row(
              children: [
                Container(
                  width: 5.r,
                  height: 5.r,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "عباس العقاد - مدينة نصر",
                  style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 35.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: AppColors.primaryColor,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5))),
                      ),
                      onPressed: () {
                        AppNavigation.navigate(
                            const AccessoriesCenterDetailsScreen());
                      },
                      child: Text(
                        "للحجز والاستفسار",
                        style: TextStyle(
                            fontSize: 8.sp, color: AppColors.secondColor),
                      )),
                ),
              ),
              Container(
                width: .6.w,
                color: Colors.white,
              ),
              Expanded(
                child: SizedBox(
                  height: 35.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                      )),
                      elevation: 0,
                    ),
                    child: Text(
                      "رقم الهاتف",
                      style: TextStyle(
                          fontSize: 8.sp, color: AppColors.secondColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
