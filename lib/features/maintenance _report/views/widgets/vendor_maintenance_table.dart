import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class VendorMaintenanceTable extends StatelessWidget {
  const VendorMaintenanceTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: DataTable(
            columnSpacing: 13.w,
            headingRowHeight: 40.h,
            dataRowHeight: 40.h,
            columns:  [
              DataColumn(
                label: Text('JO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
              ),
              DataColumn(
                label: Text('التاريخ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
              ),
              DataColumn(
                label: Text('نوع الخدمة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
              ),
              DataColumn(
                label: Text('نوع المنتج', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
              ),
              DataColumn(
                label: Text('السعر', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('01', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('15/01/2023', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('غيار زيت ماتور', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('شل 05W40', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('1200', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                ],
                color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return Colors.white; // Use the color you need
                    }),
              ),
              DataRow(
                cells: [
                  DataCell(Text('02', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('15/03/2023', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('تربيط عفشة', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('مسمار عجل', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('150', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                ],
                color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return Colors.white; // Use the color you need
                    }),
              ),
              DataRow(
                cells: [
                  DataCell(Text('03', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('23/04/2023', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('تنظيف بوابة', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('بخاخ تنظيف', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                  DataCell(Text('75', style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500))),
                ],
                color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return Colors.white; // Use the color you need
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}