import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/shared/extensions/context_extension.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class CalenderListItem extends StatelessWidget {
  const CalenderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          width: 250.w,
          decoration: BoxDecoration(
              color: AppColors.whiteColor2,
              borderRadius: BorderRadius.circular(5)),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("الأهمية : ",
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w400)),
                    Text("3",
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("مرات التذكير : ",
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w400)),
                    Text("3",
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  children: [
                    Text("التصنيف : ",
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w400)),
                    Text("كورولا",
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("موضوع المذكرة : ",
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.w400)),
                  Text("انتهاء رخصة القيادة",
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          left: context.isCurrentEnglish ? 5 : 0,
          right: context.isCurrentEnglish ? 0 : 5,
          child: Align(
              alignment: !context.isCurrentEnglish
                  ? Alignment.topLeft
                  : Alignment.topRight,
              child: const Icon(
                Icons.more_vert,
                color: Colors.black26,
              )),
        ),
      ],
    );
  }
}
