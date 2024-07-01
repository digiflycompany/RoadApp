import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';

class GeneralInventoryMovementScreen extends StatelessWidget {
  const GeneralInventoryMovementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'حركة المخزون العام')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text('تاريخ العملية:',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('من:',
                style: TextStyle(
                  fontSize: 12.sp
                ),
                ),
                SizedBox(width: 5.w,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Text(
                    ' 2023/01/01 ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11.sp,
                    ),
                  ),
                ),
                SizedBox(width: 16.w,),
                Text('الى:',style: TextStyle(
                  fontSize: 12.sp
                ),),
                SizedBox(width: 5.w,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Text(
                    ' 2023/12/31 ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(AppImages.shareIcon,width: 22.w,),
                SizedBox(width: 14.w,),
                SvgPicture.asset(AppImages.settingIcon,width: 27.w,),
              ],
            ),
            SizedBox(height: 25.h,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                child: DataTable(
                  columnSpacing: 13.w,
                  headingRowHeight: 40.h,
                  dataRowHeight: 40.h,
                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black),
                  headingTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  columns: [
                    DataColumn(label: Text('م',style: TextStyle(fontSize: 8.sp),)),
                    DataColumn(label: Text('اسم الصنف',style: TextStyle(fontSize: 8.sp),)),
                    DataColumn(label: Text('المورد',style: TextStyle(fontSize: 8.sp),)),
                    DataColumn(label: Text('رصيد أول',style: TextStyle(fontSize: 8.sp),)),
                    DataColumn(label: Text('وارد',style: TextStyle(fontSize: 8.sp),)),
                    DataColumn(label: Text('منصرف',style: TextStyle(fontSize: 8.sp),)),
                    DataColumn(label: Text('رصيد آخر',style: TextStyle(fontSize: 8.sp),)),
                  ],
                  rows:  [
                    DataRow(cells: [
                      DataCell(Text('1',style: TextStyle(fontSize: 12.sp),)),
                      DataCell(Text('أحمد نبيل',style: TextStyle(fontSize: 11.sp),)),
                      DataCell(Text('100',style: TextStyle(fontSize: 12.sp),)),
                      DataCell(Text('100',style: TextStyle(fontSize: 12.sp),)),
                      DataCell(Text('100',style: TextStyle(fontSize: 12.sp),)),
                      DataCell(Text('100',style: TextStyle(fontSize: 12.sp),)),
                      DataCell(Text('100',style: TextStyle(fontSize: 12.sp),)),
                    ], color: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          return Colors.amber[100]; // Use the color you need
                        }),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'الأرصدة حتى تاريخ البيان',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),
              ),
            ),
            SizedBox(height: 25.h,),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r), // Rounded edges
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 7.h), // Button padding
                ),
                onPressed: () {
                  // Define your onPressed action here
                },
                child: Text(
                  'اضف',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35.h,),
          ],
        ),
      ),
    );
  }
}
