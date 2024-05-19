import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/maintenance_service/views/screens/maintenance_service_screen.dart';
import 'package:roadapp2/modules/spare_parts/views/screens/spare_parts_screen.dart';

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
                            decoration: BoxDecoration(
                                color: Color(0xFFECECEC),
                            borderRadius: BorderRadius.circular(10.r)
                            ),
                            child: DropdownButton<String>(
                                elevation: 0,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                isExpanded: true,
                                underline: const SizedBox.shrink(),
                                hint: Text(
                                  'اختر الدولة',
                                  style: TextStyle(fontSize: 10.sp,color: const Color(0xffAAAAAA)),
                                ),
                                items: ['الدولة', 'الدولة', 'الدولة']
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: (val) {})),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "نوع المركبة",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        TextFormField(
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "اكتب نوع المركبة",
                          hintStyle: TextStyle(fontSize: 10.sp,color: const Color(0xffAAAAAA)),
                          filled: true,
                          fillColor: const Color(0xFFECECEC),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.r)
                          ),
                        )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "سنة الصنع",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        TextFormField(
                            keyboardType: TextInputType.datetime,
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "اكتب سنة الصنع",
                          hintStyle: TextStyle(fontSize: 10.sp,color: const Color(0xffAAAAAA)),
                          filled: true,
                          fillColor: const Color(0xFFECECEC),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.r)
                          ),
                        )),
                        // Container(
                        //     height: 36.h,
                        //     decoration: BoxDecoration(
                        //         color: AppColors.whiteColor2,
                        //         border: Border.all(color: Colors.black12)),
                        //     child: DropdownButton<String>(
                        //         elevation: 0,
                        //         padding:
                        //             const EdgeInsets.symmetric(horizontal: 5),
                        //         isExpanded: true,
                        //         underline: const SizedBox.shrink(),
                        //         hint: Text(
                        //           'سنة الصنع',
                        //           style: TextStyle(fontSize: 10.sp),
                        //         ),
                        //         items: [
                        //           'السنة',
                        //           'السنة',
                        //           'السنة'
                        //         ]
                        //             .map((e) => DropdownMenuItem(
                        //                   value: e,
                        //                   child: Text(e),
                        //                 ))
                        //             .toList(),
                        //         onChanged: (val) {})),
                        SizedBox(
                          height: 25.h,
                        ),
                        SizedBox(
                            width:
                                (MediaQuery.of(context).size.width / 2) - 25.h,
                            child: buttonHandling("الاكسسوارات",
                                voidCallback: () {})),
                        SizedBox(
                          height: 25.h,
                        ),
                        buttonHandling("قطع الغيار", voidCallback: () {
                          AppNavigation.navigate(const SparePartsScreen());
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
                            decoration: BoxDecoration(
                                color: Color(0xffECECEC),
                                borderRadius: BorderRadius.circular(10.r)
                            ),
                            child: DropdownButton<String>(
                                elevation: 0,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                isExpanded: true,
                                underline: const SizedBox.shrink(),
                                hint: Text(
                                  'اختر المدينة/الحي',
                                  style: TextStyle(fontSize: 10.sp,color: const Color(0xffAAAAAA)),
                                ),
                                items: ['المدينة', 'المدينة', 'المدينة']
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: (val) {})),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "موديل السيارة",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        TextFormField(
                            style: TextStyle(
                              fontSize: 13.sp,
                            ),
                            decoration: InputDecoration(
                              hintText: "اكتب موديل السيارة",
                              hintStyle: TextStyle(fontSize: 10.sp,color: const Color(0xffAAAAAA)),
                              filled: true,
                              fillColor: const Color(0xFFECECEC),
                              contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.r)
                              ),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "نوع الفتيس",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        TextFormField(
                            style: TextStyle(
                              fontSize: 13.sp,
                            ),
                            decoration: InputDecoration(
                              hintText: "اكتب نوع الفتيس",
                              hintStyle: TextStyle(fontSize: 10.sp,color: const Color(0xffAAAAAA)),
                              filled: true,
                              fillColor: const Color(0xFFECECEC),
                              contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.r)
                              ),
                            )),

                        // Container(
                        //     height: 36.h,
                        //     decoration: BoxDecoration(
                        //         color: AppColors.whiteColor2,
                        //         border: Border.all(color: Colors.black12)),
                        //     child: DropdownButton<String>(
                        //         elevation: 0,
                        //         padding:
                        //             const EdgeInsets.symmetric(horizontal: 5),
                        //         isExpanded: true,
                        //         underline: const SizedBox.shrink(),
                        //         hint: Text(
                        //           'نوع الفتيس',
                        //           style: TextStyle(fontSize: 10.sp),
                        //         ),
                        //         items: ['الفتيس', 'الفتيس', 'الفتيس']
                        //             .map((e) => DropdownMenuItem(
                        //                   value: e,
                        //                   child: Text(e),
                        //                 ))
                        //             .toList(),
                        //         onChanged: (val) {})),
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
