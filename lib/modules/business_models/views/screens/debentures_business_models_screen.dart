import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/resources/colors.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';

class DebenturesBusinessModelsScreen extends StatefulWidget {
  const DebenturesBusinessModelsScreen({super.key});

  @override
  State<DebenturesBusinessModelsScreen> createState() => _DebenturesBusinessModelsScreenState();
}

class _DebenturesBusinessModelsScreenState extends State<DebenturesBusinessModelsScreen> {
  String _operationType = 'receipt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'نماذج العمل')),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 20.h,),
               Text(
                'نوع العملية:',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                      const Text('سند استلام'),
                    ],
                  ),
                  Row(
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
                      const Text('سند صرف'),
                    ],
                  ),
                  Row(
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
                      const Text('فاتورة بيع'),
                    ],
                  ),
                ],
              ),
               SizedBox(height: 20.h,),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('رقم السند: ',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),),
                              SizedBox(height: 13.h,),
                              Text('اسم المورد: ',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),),
                              SizedBox(height: 20.h,),
                              Text('نوع السند: ',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),),
                            ],
                          ),
                          SizedBox(width: 6.w,),
                          Column(
                            children: [
                              SizedBox(
                                width: 86.w,
                                height: 32.h,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding:  EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              SizedBox(
                                width: 86.w,
                                height: 32.h,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding:  EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              SizedBox(
                                width: 86.w,
                                height: 32.h,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding:  EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('تاريخ السند: ',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),),
                              SizedBox(height: 13.h,),
                              Text('كود المورد: ',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),),
                            ],
                          ),
                          SizedBox(width: 6.w,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 86.w,
                                height: 32.h,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding:  EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              SizedBox(
                                width: 86.w,
                                height: 32.h,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding:  EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                   width: 85.w,
                   height: 40.h,
                   decoration: BoxDecoration(
                     color: AppColors.primaryColor,
                     borderRadius: BorderRadius.circular(5.r),
                   ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.addIcon,width: 10.w,),
                      SizedBox(width: 5.w,),
                      Text('اضافة منتج',style: TextStyle(
                        fontSize: 9.sp
                      ),)
                    ],
                  ) ,
                 ),
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
                    headingTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    columns: [
                      DataColumn(label: Text('م',style: TextStyle(fontSize: 8.sp),)),
                      DataColumn(label: Text('كود صنف',style: TextStyle(fontSize: 8.sp),)),
                      DataColumn(label: Text('اسم الصنف',style: TextStyle(fontSize: 8.sp),)),
                      DataColumn(label: Text('الوحدة',style: TextStyle(fontSize: 8.sp),)),
                      DataColumn(label: Text('الكمية',style: TextStyle(fontSize: 8.sp),)),
                      DataColumn(label: Text('السعر',style: TextStyle(fontSize: 8.sp),)),
                      DataColumn(label: Text('القيمة',style: TextStyle(fontSize: 8.sp),)),
                    ],
                    rows:  [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('أحمد نبيل')),
                        DataCell(Text('100')),
                        DataCell(Text('100')),
                        DataCell(Text('100')),
                        DataCell(Text('100')),
                        DataCell(Text('100')),
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
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'الإجمالي',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 100.h,),
            ],
          ),
        ),
      ),
    );
  }
}

