import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/modules/vehicles/widgets/add_vehicle_component.dart';
import 'package:roadapp/services/navigation/navigation.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/resources/colors.dart';
import 'package:roadapp/shared/widgets/custom_alert_dialog.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';
import 'package:roadapp/shared/widgets/custom_button.dart';

class DebenturesBusinessModelsScreen extends StatefulWidget {
  const DebenturesBusinessModelsScreen({super.key});

  @override
  State<DebenturesBusinessModelsScreen> createState() => _DebenturesBusinessModelsScreenState();
}

class _DebenturesBusinessModelsScreenState extends State<DebenturesBusinessModelsScreen> {
  String _operationType = 'receipt';
  bool _checked = false;

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
                              Text(_operationType=='receipt_voucher'?'رقم الفاتورة: ':'رقم السند: ',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),),
                              SizedBox(height: 13.h,),
                              Text(_operationType=='sale_invoice'?'اسم المورد: ':'اسم العميل: ',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),),
                              SizedBox(height: 20.h,),
                              Text(_operationType=='receipt_voucher'?'نوع الفاتورة: ':'نوع السند: ',style: TextStyle(
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
                              Text(_operationType=='receipt_voucher'?'تاريخ الفاتورة: ':'تاريخ السند: ',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),),
                              SizedBox(height: 13.h,),
                              Text(_operationType=='sale_invoice'?'كود المورد: ':'كود العميل: ',style: TextStyle(
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
                child: GestureDetector(
                  onTap: (){
                    showCustomAlertDialog(
                        context: context,
                        title: 'إضافة مركبة',
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10.h,),
                            const AddVehicleComponent(firstText: 'كود الصنف', secondText: 'اسم الصنف',),
                            const AddVehicleComponent(firstText: 'الوحدة', secondText: 'الكمية',),
                            const AddVehicleComponent(firstText: 'السعر', secondText: 'القيمة',),
                            CustomElevatedButton(
                                onTap: () {
                                  AppNavigation.back();
                                }, widget:  Text('   أضف   ',style: TextStyle(
                              fontSize: 10.sp,
                            ),))
                          ],
                        ));
                  },
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
                        SvgPicture.asset(AppImages.addIcon,width: 12.w,),
                        SizedBox(width: 5.w,),
                        Text('اضافة منتج',style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600
                        ),)
                      ],
                    ) ,
                   ),
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
                    headingTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                child: const Text(
                  'الإجمالي',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'الملاحظات',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.all(10.w),
                    child:  TextField(
                      maxLines: 3,
                      decoration: InputDecoration.collapsed(
                        hintText: 'اضف ملاحظاتك',
                        hintStyle: TextStyle(
                          fontSize: 12.sp
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: _checked,
                        onChanged: (bool? value) {
                          setState(() {
                            _checked = value!;
                          });
                        },
                      ),
                      Text(
                        'يرجى التأكد من مراجعة البيانات قبل الحفظ',
                        style: TextStyle(color: Colors.grey,fontSize: 11.sp),
                      ),
                    ],
                  ),
                ],
              ),
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
      ),
    );
  }
}

