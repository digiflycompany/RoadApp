import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/maintenance_service/views/screens/maintenance_service_screen.dart';

import '../../../../services/navigation/navigation.dart';
import '../../../../shared/resources/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    color: AppColors.whiteColor2),
                child: const Row(
                  children: [
                    Text("الخاص بمركباتي"),
                    Spacer(),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h),
                child: Text("البحث العام",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10.sp)),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "الدولة",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor2,
                                border: Border.all(color: Colors.black12)),
                            child: DropdownButton<String>(
                                elevation: 0,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                isExpanded: true,
                                underline: const SizedBox.shrink(),
                                hint: Text(
                                  'اختر الدولة',
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                items: [
                                  'تجربة سيارة',
                                  'تجربة سيارة',
                                  'تجربة سيارة'
                                ]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: (val) {})),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "سنة الصنع",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor2,
                                border: Border.all(color: Colors.black12)),
                            child: DropdownButton<String>(
                                elevation: 0,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                isExpanded: true,
                                underline: const SizedBox.shrink(),
                                hint: Text(
                                  'سنة الصنع',
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                items: [
                                  'تجربة سيارة',
                                  'تجربة سيارة',
                                  'تجربة سيارة'
                                ]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: (val) {})),
                        SizedBox(
                          height: 25.h,
                        ),
                        buttonHandling("اصلاح فني", voidCallback: () {}),
                        SizedBox(
                          height: 25.h,
                        ),
                        buttonHandling("قطع الغيار", voidCallback: () {
                          // AppNavigation.navigate(SparePartsScreen());
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "المدينة/الحي",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor2,
                                border: Border.all(color: Colors.black12)),
                            child: DropdownButton<String>(
                                elevation: 0,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                isExpanded: true,
                                underline: const SizedBox.shrink(),
                                hint: Text(
                                  'المدينة الحي',
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                items: [
                                  'تجربة سيارة',
                                  'تجربة سيارة',
                                  'تجربة سيارة'
                                ]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: (val) {})),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "نوع الفتيس",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor2,
                                border: Border.all(color: Colors.black12)),
                            child: DropdownButton<String>(
                                elevation: 0,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                isExpanded: true,
                                underline: const SizedBox.shrink(),
                                hint: Text(
                                  'نوع الفتيس',
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                items: [
                                  'تجربة سيارة',
                                  'تجربة سيارة',
                                  'تجربة سيارة'
                                ]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: (val) {})),
                        SizedBox(
                          height: 25.h,
                        ),
                        buttonHandling("خدمات صيانة", voidCallback: () {
                          AppNavigation.navigate(
                              const MaintenanceServiceScreen());
                        }, context: context),
                        SizedBox(height: 25.h),
                        buttonHandling("الزيوت والمستهلكات",
                            voidCallback: () {}),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 25.h,
                  child: buttonHandling("الاكسسوارات", voidCallback: () {})),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonHandling(String text, {VoidCallback? voidCallback, context}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: Size(double.infinity, 50.h),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      ),
      onPressed: voidCallback,
      child: Text(
        text,
        style: TextStyle(color: AppColors.secondColor, fontSize: 10.sp),
      ),
    );
  }
}
