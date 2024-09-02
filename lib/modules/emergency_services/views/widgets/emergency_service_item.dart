import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class EmergencyServiceItem extends StatelessWidget {
  const EmergencyServiceItem({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppAssets.roadServicesBackground),
        Row(
          children: [
            SizedBox(
              width: 80.w,
              height: 80.h,
              child: SvgPicture.asset(
                image,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              width: 50.w,
            ),
            Text(title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
