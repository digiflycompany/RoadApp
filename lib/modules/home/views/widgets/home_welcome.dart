import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/app_strings.dart';

class HomeWelcome extends StatelessWidget {
  const HomeWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('مرحبا',style: TextStyle(
                        fontSize: 16.sp,
                      ),),
                      SizedBox(
                        width: 3.w,
                      ),
                      SvgPicture.asset(AppAssets.wave)
                    ],
                  ),
                  Text('احمد جلال الدين, طريقك امان',style: TextStyle(
                    fontSize: 14.sp,
                  ),),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_pin),
                  Text(
                    'مصر -القاهرة',
                    style: TextStyle(
                        fontFamily: AppStrings.fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
