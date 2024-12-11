import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionPoint extends StatelessWidget {
  const SectionPoint({super.key, required this.point});

  final String point;

  // TextStyle _responsiveTextStyle(BuildContext context) {
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   return TextStyle(
  //     fontSize: screenWidth * 0.04,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          CircleAvatar(backgroundColor: Colors.black, radius: 4.w),
          SizedBox(width: 6.w),
          FittedBox(
            child: SizedBox(
              width: 200.w,
              child: Text(
                point,
                style: TextStyle(fontSize: 14.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
