import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/modules/reserve_appointment/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/modules/reserve_appointment/cubit/reserve_appointment_state.dart';
import 'package:roadapp/modules/work_reports/views/screens/business_model_reports_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class WorkReportsScreen extends StatefulWidget {
  const WorkReportsScreen({super.key});

  @override
  State<WorkReportsScreen> createState() => _WorkReportsScreenState();
}

class _WorkReportsScreenState extends State<WorkReportsScreen> {
  String _operationType = 'sale_invoice';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReserveAppointmentCubit(),
      child: BlocConsumer<ReserveAppointmentCubit, ReserveAppointmentStates>(
        listener: (BuildContext context, ReserveAppointmentStates state) {},
        builder: (BuildContext context, ReserveAppointmentStates state) {
          final cubit = context.read<ReserveAppointmentCubit>();
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: preferredSize,
                child: const CustomAppBar(text: 'تقارير العمل')),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 2),
                            color: Color(0xFFD7D7D7),
                          )
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              cubit.changeReservationType(0, true);
                            },
                            child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: cubit.click
                                      ? AppColors.primaryColor
                                      : AppColors.tertiary,
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "مخزن المنتجات",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.secondColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              cubit.changeReservationType(1, false);
                            },
                            child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: cubit.click
                                      ? AppColors.tertiary
                                      : AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "مخزن الخدمات",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.secondColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      const Text('من:'),
                      SizedBox(width: 5.w,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        child: const Text(
                          ' 2023/01/01 ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w,),
                      const Text('الى:'),
                      SizedBox(width: 5.w,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        child: const Text(
                          ' 2023/01/01 ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(AppAssets.shareIcon,width: 22.w,),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'نوع العملية:',
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing:4.w,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                            value: 'sale_invoice',
                            groupValue: _operationType,
                            onChanged: (value) {
                              setState(() {
                                _operationType = value!;
                              });
                            },
                          ),
                          Text('سند استلام', style: TextStyle(fontSize: 12.sp)),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                            value: 'payment_voucher',
                            groupValue: _operationType,
                            onChanged: (value) {
                              setState(() {
                                _operationType = value!;
                              });
                            },
                          ),
                          Text('سند صرف', style: TextStyle(fontSize: 12.sp)),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                            value: 'receipt_voucher',
                            groupValue: _operationType,
                            onChanged: (value) {
                              setState(() {
                                _operationType = value!;
                              });
                            },
                          ),
                          Text('فاتورة بيع', style: TextStyle(fontSize: 12.sp)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h,),
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
                          DataColumn(label: Text('رقم السند',style: TextStyle(fontSize: 8.sp),)),
                          DataColumn(label: Text('تاريخ السند',style: TextStyle(fontSize: 8.sp),)),
                          DataColumn(label: Text('القيمة',style: TextStyle(fontSize: 8.sp),)),
                        ],
                        rows:  [
                          DataRow(cells: [
                            DataCell(GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: ()=>AppNavigation.navigate(const BusinessModelReportsScreen()),
                                child: Text('1',style: TextStyle(fontSize: 13.sp),))),
                            DataCell(GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: ()=>AppNavigation.navigate(const BusinessModelReportsScreen()),
                                child: Text('5467',style: TextStyle(fontSize: 13.sp),))),
                            DataCell(GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: ()=>AppNavigation.navigate(const BusinessModelReportsScreen()),
                                child: Text('24-2-2014',style: TextStyle(fontSize: 13.sp),))),
                            DataCell(GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: ()=>AppNavigation.navigate(const BusinessModelReportsScreen()),
                                child: Text('3223',style: TextStyle(fontSize: 13.sp),))),
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
                    child: const Text(
                      'الإجمالي',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
