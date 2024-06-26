import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/shared/resources/colors.dart';

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

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
            'الهيكل الخارجي',
            style: TextStyle(
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
            padding: EdgeInsets.only(right: 16.w,left: 8.w,bottom: 16.h),
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'يغطي هذا القسم النقاط التالية',
                  style: TextStyle(color: Colors.grey,fontSize: 14.sp),
                ),
                SizedBox(height: 10.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.blackColor,radius: 4.w,
                            ),
                            SizedBox(width: 6.w,),
                            Text('أجزاء السيارة الخارجية',style: TextStyle(
                              fontSize: 13.sp),maxLines: 2,),

                          ],
                        ),
                        SizedBox(height: 10.w,),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.blackColor,radius: 4.w,
                            ),
                            SizedBox(width: 6.w,),
                            Text('أجزاء السيارة الخارجية',style: TextStyle(
                                fontSize: 13.sp),maxLines: 2,),

                          ],
                        ),
                        SizedBox(height: 10.w,),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.blackColor,radius: 4.w,
                            ),
                            SizedBox(width: 6.w,),
                            Text('أجزاء السيارة الخارجية',style: TextStyle(
                                fontSize: 13.sp),maxLines: 2,),

                          ],
                        ),
                        SizedBox(height: 10.w,),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.blackColor,radius: 4.w,
                            ),
                            SizedBox(width: 6.w,),
                            Text('أجزاء السيارة الخارجية',style: TextStyle(
                                fontSize: 13.sp),maxLines: 2,),

                          ],
                        ),
                        SizedBox(height: 10.w,),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.blackColor,radius: 4.w,
                            ),
                            SizedBox(width: 6.w,),
                            Text('أجزاء السيارة الخارجية',style: TextStyle(
                                fontSize: 13.sp),maxLines: 2,),

                          ],
                        ),
                        SizedBox(height: 10.w,),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.blackColor,radius: 4.w,
                            ),
                            SizedBox(width: 6.w,),
                            Text('أجزاء السيارة الخارجية',style: TextStyle(
                                fontSize: 13.sp),maxLines: 2,),

                          ],
                        ),
                        SizedBox(height: 10.w,),
                      ],
                    ),
                    SizedBox(width: 65.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.3.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10.w,
                              child: Center(child: Icon(Icons.check,color: Colors.white,size: 13.w,)),
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.yellowAccent,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.greenAccent ,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                          ],
                        ),
                        SizedBox(height: 15.3.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10.w,
                              child: Center(child: Icon(Icons.check,color: Colors.white,size: 13.w,)),
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.yellowAccent,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.greenAccent ,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                          ],
                        ),
                        SizedBox(height: 15.3.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10.w,
                              child: Center(child: Icon(Icons.check,color: Colors.white,size: 13.w,)),
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.yellowAccent,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.greenAccent ,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                          ],
                        ),
                        SizedBox(height: 15.3.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10.w,
                              child: Center(child: Icon(Icons.check,color: Colors.white,size: 13.w,)),
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.yellowAccent,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.greenAccent ,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                          ],
                        ),
                        SizedBox(height: 15.3.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10.w,
                              child: Center(child: Icon(Icons.check,color: Colors.white,size: 13.w,)),
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.yellowAccent,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.greenAccent ,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                          ],
                        ),
                        SizedBox(height: 15.3.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10.w,
                              child: Center(child: Icon(Icons.check,color: Colors.white,size: 13.w,)),
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.yellowAccent,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                            CircleAvatar(
                              backgroundColor: Colors.greenAccent ,
                              radius: 10.w,
                            ),
                            SizedBox(width: 8.w,),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(String title, bool isChecked) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isChecked ? Colors.green : Colors.red,
          child: Icon(
            isChecked ? Icons.check : Icons.close,
            color: Colors.white,
          ),
        ),
        title: Text(title),
        trailing: Icon(Icons.circle, size: 10),
      ),
    );
  }
}
