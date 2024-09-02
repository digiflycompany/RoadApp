import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class ExpansionTileExample extends StatefulWidget {
  final String title;
  final String point1;
  final String point2;
  final String point3;
  final String point4;
  final String point5;
  final String point6;

  const ExpansionTileExample({
    super.key,
    required this.title,
    required this.point1,
    required this.point2,
    required this.point3,
    required this.point4,
    required this.point5,
    required this.point6,
  });

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _isExpanded ? Colors.white : AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
        childrenPadding: EdgeInsets.zero,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        trailing: Icon(
          _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [
          Container(
            padding: EdgeInsets.only(right: 16.w, left: 8.w, bottom: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'يغطي هذا القسم النقاط التالية',
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(height: 10.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildPoint(widget.point1),
                        SizedBox(height: 10.h),
                        buildPoint(widget.point2),
                        SizedBox(height: 10.h),
                        buildPoint(widget.point3),
                        SizedBox(height: 10.h),
                        buildPoint(widget.point4),
                        SizedBox(height: 10.h),
                        buildPoint(widget.point5),
                        SizedBox(height: 10.h),
                        buildPoint(widget.point6),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildStatusRow(),
                        SizedBox(height: 15.3.h,),
                        buildStatusRow(),
                        SizedBox(height: 15.3.h,),
                        buildStatusRow(),
                        SizedBox(height: 15.3.h,),
                        buildStatusRow(),
                        SizedBox(height: 15.3.h,),
                        buildStatusRow(),
                        SizedBox(height: 15.3.h,),
                        buildStatusRow(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPoint(String point) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.blackColor,
          radius: 4.w,
        ),
        SizedBox(width: 6.w,),
        Text(
          point,
          style: TextStyle(fontSize: 13.sp),
          maxLines: 2,
        ),
      ],
    );
  }

  Widget buildStatusRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 10.w,
          child: Center(child: Icon(Icons.check, color: Colors.white, size: 13.w,)),
        ),
        SizedBox(width: 8.w,),
        CircleAvatar(
          backgroundColor: Colors.yellowAccent,
          radius: 10.w,
        ),
        SizedBox(width: 8.w,),
        CircleAvatar(
          backgroundColor: Colors.greenAccent,
          radius: 10.w,
        ),
        SizedBox(width: 8.w,),
      ],
    );
  }
}
