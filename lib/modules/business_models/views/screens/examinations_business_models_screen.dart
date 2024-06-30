import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/modules/business_models/views/widgets/expansion_tile_example.dart';
import 'package:roadapp/modules/business_models/views/widgets/notes_expansion_tile.dart';
import 'package:roadapp/modules/vehicles/widgets/add_vehicle_component.dart';
import 'package:roadapp/services/navigation/navigation.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/resources/colors.dart';
import 'package:roadapp/shared/widgets/custom_alert_dialog.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';
import 'package:roadapp/shared/widgets/custom_button.dart';

class ExaminationsBusinessModelsScreen extends StatefulWidget {
  const ExaminationsBusinessModelsScreen({super.key});

  @override
  State<ExaminationsBusinessModelsScreen> createState() => _ExaminationsBusinessModelsScreenState();
}

class _ExaminationsBusinessModelsScreenState extends State<ExaminationsBusinessModelsScreen> {
  String _operationType = 'sale_invoice';
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
                      Text('طلب فحص', style: TextStyle(fontSize: 11.sp)),
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
                      Text('طلب صيانة', style: TextStyle(fontSize: 11.sp)),
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
                      Text('فاتورة خدمات', style: TextStyle(fontSize: 11.sp)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              if(_operationType=='sale_invoice')...[
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('رقم لوحة العربية'),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: 150.w,
                                height: 44.h,
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
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('نوع الفحص'),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: 150.w,
                                height: 44.h,
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
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('تاريخ الفحص'),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: 150.w,
                                height: 44.h,
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
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('السعر'),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: 150.w,
                                height: 44.h,
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
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.h,),
                const ExpansionTileExample(
                  title: 'الهيكل الخارجي',
                  point1: 'أجزاء السيارة الخارجية',
                  point2: 'حالة المقصورة الداخلية',
                  point3: 'الزجاج الأمامي والخلفي',
                  point4: 'السقف',
                  point5: 'الشبابيك',
                  point6: 'الشبر',
                ),
                SizedBox(height: 20.h,),
                const ExpansionTileExample(
                  title: 'الشاصي والهيكل',
                  point1: 'الشاصيات الأربعة',
                  point2: 'الهيكل الأمامي',
                  point3: 'هيكل السقف',
                  point4: 'الهيكل الخلفي',
                  point5: 'الواجهة الأمامية',
                  point6: 'الواجهة الخلفية',
                ),
                SizedBox(height: 20.h,),
                const ExpansionTileExample(
                  title: 'المحرك وناقل الحركة',
                  point1: 'فحص جميع الأنظمة الكترونيا',
                  point2: 'فحص البطارية الرئيسية',
                  point3: 'المحرك الكهربائي و اجزاءه',
                  point4: 'المحول الكهربائي',
                  point5: 'أنظمة الشحن',
                  point6: 'أنظمة التبريد',
                ),
                SizedBox(height: 20.h,),
                const ExpansionTileExample(
                  title: 'نظام التوجيه',
                  point1: 'الصنوبرصات الأمامية',
                  point2: 'الصنوبرصات الخلفية',
                  point3: 'مجموعة الستيرنج و اجزاءها',
                  point4: 'الأكسات الأمامية و الخلفية',
                  point5: 'بيل العجلات',
                  point6: 'قواعد المحرك و الجير',
                ),
                SizedBox(height: 20.h,),
                const ExpansionTileExample(
                  title: 'المجموعة الكهربائية',
                  point1: 'أنظمة الانارة الأمامية',
                  point2: 'أنظمة الانارة الخلفية',
                  point3: 'أنظمة المساعدة على الطريق',
                  point4: 'البطارية و نظام الشحن',
                  point5: 'الاكسسوارات و التجهزيات',
                  point6: 'الاكسسوارات و التجهزيات',
                ),
                SizedBox(height: 20.h,),
                const ExpansionTileExample(
                  title: 'نظام التكييف',
                  point1: 'نظام التكييف و الكمبرسر',
                  point2: 'نظام التدفئة',
                  point3: 'تبريد المحرك و المراوح',
                  point4: 'تهريب السوائل',
                  point5: 'تهريب السوائل',
                  point6: 'تهريب السوائل',
                ),
                SizedBox(height: 20.h,),
                const ExpansionTileExample(
                  title: 'المكابح والسلامة',
                  point1: 'الاكياس الهوائية',
                  point2: 'الإطارات',
                  point3: 'البريكات و اجزائها',
                  point4: 'احزمة الأمان',
                  point5: 'أنظمة منع الإنزلاق',
                  point6: 'أنظمة منع الإنزلاق',
                ),
                SizedBox(height: 20.h,),
                const NotesExpansionTile(),
              ],
              if(_operationType=='payment_voucher' || _operationType=='receipt_voucher')...[
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
                                Text('رقم الفاتورة: ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),),
                                SizedBox(height: 13.h,),
                                Text('اسم العميل: ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),),
                                SizedBox(height: 20.h,),
                                Text('نوع الفاتورة: ',style: TextStyle(
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
                                Text('تاريخ الفاتورة: ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),),
                                SizedBox(height: 13.h,),
                                Text('كود العميل: ',style: TextStyle(
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
              ],
              SizedBox(height: 35.h,),
            ],
          ),
        ),
      ),
    );
  }
}
