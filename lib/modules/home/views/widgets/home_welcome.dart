import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/const/app_strings.dart';

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
                      const Text('مرحبا'),
                      SizedBox(
                        width: 3.w,
                      ),
                      SvgPicture.asset(AppImages.wave)
                    ],
                  ),
                  const Text('احمد جلال الدين, طريقك امان'),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.location_pin),
                  Text(
                    'مصر -القاهرة',
                    style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.w500),
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
