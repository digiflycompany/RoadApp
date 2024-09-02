import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';

class BusinessModelReportsScreen extends StatefulWidget {
  const BusinessModelReportsScreen({super.key});

  @override
  State<BusinessModelReportsScreen> createState() => _BusinessModelReportsScreenState();
}

class _BusinessModelReportsScreenState extends State<BusinessModelReportsScreen> {
  final String _operationType = 'sale_invoice';
  bool _checked = false;
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  TextEditingController fifthController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fifthController.text='122';
    secondController.text='محمد علاء';
    thirdController.text='استلام';
    fourthController.text='122';
    fifthController.text='122';
  }

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
                                  style: TextStyle(fontSize: 12.sp),
                                  controller: fifthController,
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
                                  style: TextStyle(fontSize: 12.sp),
                                  controller: secondController,
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
                                  style: TextStyle(fontSize: 12.sp),
                                  controller: thirdController,
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
                                  style: TextStyle(fontSize: 12.sp),
                                  controller: fourthController,
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
                                  style: TextStyle(fontSize: 12.sp),
                                  controller: fifthController,
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
              SizedBox(height: 20.h,),
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

