import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/modules/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp2/modules/maintenance%20_report/cubit/states.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';
import 'package:roadapp2/shared/widgets/custom_alert_dialog.dart';
import 'package:roadapp2/shared/widgets/custom_button.dart';
import 'package:roadapp2/shared/widgets/custom_text_field.dart';

class MaintenanceReportItem extends StatelessWidget {
  const MaintenanceReportItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaintenanceReportCubit, MaintenanceReportStates>(
      listener: (BuildContext context, MaintenanceReportStates state) {  },
      builder: (BuildContext context, MaintenanceReportStates state) {
        var cubit = MaintenanceReportCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.60,
              padding: EdgeInsets.all(5.w),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.tertiary)),
                  // SizedBox(
                  //   width: 10.w,
                  // ),
                  Text("تويوتا",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.tertiary)),
                  // SizedBox(
                  //   width: 10.w,
                  // ),
                  Text("كورولا",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.tertiary)),
                  // SizedBox(
                  //   width: 10.w,
                  // ),
                  Text("2015",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.tertiary)),
                  // SizedBox(
                  //   width: 10.w,
                  // ),
                  Text("أ ب هـ",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.tertiary)),
                  // SizedBox(
                  //   width: 10.w,
                  // ),
                  Text("2 3 4 6",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.tertiary)),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primaryColor,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    showCustomAlertDialog(
                        context: context,
                        title: "إضافة تقرير",
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextField(
                                  fillColor: AppColors.whiteColor2,
                                  hintText: "اسم المركز",
                                  controller: TextEditingController(),
                                  width: 100.w,
                                ),
                                SizedBox(width: 10.w),
                                CustomTextField(
                                    fillColor: AppColors.whiteColor2,
                                    hintText: "رقم الهاتف",
                                    controller: TextEditingController(),
                                    width: 100.w),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextField(
                                  fillColor: AppColors.whiteColor2,
                                  hintText: "نوع الخدمة",
                                  controller: TextEditingController(),
                                  width: 100.w,
                                ),
                                SizedBox(width: 10.w),
                                CustomTextField(
                                    fillColor: AppColors.whiteColor2,
                                    hintText: "السعر",
                                    controller: TextEditingController(),
                                    width: 100.w),
                              ],
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(
                                  vertical: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomTextField(
                                    fillColor: AppColors.whiteColor2,
                                    hintText: "نوع المنتج",
                                    controller: TextEditingController(),
                                    width: 100.w,
                                  ),
                                  SizedBox(width: 10.w),
                                  CustomTextField(
                                      fillColor: AppColors
                                          .whiteColor2,
                                      hintText: "السعر",
                                      controller: TextEditingController(),
                                      width: 100.w),
                                ],
                              ),
                            ),
                            CustomElevatedButton(
                                onTap: () {},
                                widget: const Text('   أضف   '))
                          ],
                        ));
                  },
                )),
            IconButton(
                onPressed: () {
                  showCustomAlertDialog(
                      context: context,
                      title: "مشاركة",
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                SvgPicture.asset(AppImages.whatsappIcon),
                                SizedBox(width: 5.w,),
                                  Text(
                                    'واتسآب',
                                    style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(AppImages.gmailIcon),
                                  SizedBox(width: 5.w,),
                                  Text(
                                    'جيميل',
                                    style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(AppImages.messagesIcon),
                                  SizedBox(width: 5.w,),
                                  Text(
                                    'عبر الرسائل',
                                    style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(AppImages.downloadIcon),
                                  SizedBox(width: 5.w,),
                                  Text(
                                    'تنزيل',
                                    style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: CheckboxListTile(
                                value: cubit.selectPrice,
                                onChanged: (val) {
                                  cubit.selectPrice = val!;
                                },
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                title: Text(
                                  'ارسل بالسعر',
                                  style: TextStyle(fontSize: 10.sp),
                                )),
                          ),
                          CustomElevatedButton(
                              onTap: () {},
                              widget: Text(
                                'اختر',
                                style: TextStyle(fontSize: 10.sp),
                              )),
                        ],
                      ));
                },
                icon: const Icon(Icons.share),
                constraints: const BoxConstraints(),
                style: const ButtonStyle(
                  // iconSize: MaterialStateProperty.all(20.r),
                )),
            IconButton(
              onPressed: () {
                showCustomAlertDialog(
                    context: context,
                    title: "الظهور حسب",
                    content: StatefulBuilder(
                        builder: (ctxx, setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: CheckboxListTile(
                                        title: Text(
                                          'التاريخ',
                                          style: TextStyle(
                                              fontSize: 10.sp),
                                        ),
                                        controlAffinity:
                                        ListTileControlAffinity
                                            .leading,
                                        checkColor: Colors.black,
                                        fillColor: const MaterialStatePropertyAll(
                                            AppColors.primaryColor),
                                        contentPadding: EdgeInsets
                                            .zero,
                                        value: cubit.checkBoxDate,
                                        onChanged: (val) {
                                          cubit.checkBoxDate = val!;
                                          setState(() {});
                                        }),
                                  ),
                                  Flexible(
                                    child: CheckboxListTile(
                                        title: Text(
                                          'الخدمة',
                                          style: TextStyle(
                                              fontSize: 10.sp),
                                        ),
                                        controlAffinity:
                                        ListTileControlAffinity
                                            .leading,
                                        checkColor: Colors.black,
                                        fillColor: const MaterialStatePropertyAll(
                                            AppColors.primaryColor),
                                        contentPadding: EdgeInsets
                                            .zero,
                                        value: cubit.checkBoxService,
                                        onChanged: (val) {
                                          cubit.checkBoxService =
                                          val!;
                                          setState(() {});
                                        }),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: CheckboxListTile(
                                        title: Text(
                                          'السعر',
                                          style: TextStyle(
                                              fontSize: 10.sp),
                                        ),
                                        controlAffinity:
                                        ListTileControlAffinity
                                            .leading,
                                        checkColor: Colors.black,
                                        fillColor: const MaterialStatePropertyAll(
                                            AppColors.primaryColor),
                                        contentPadding: EdgeInsets
                                            .zero,
                                        value: cubit.checkBoxPrice,
                                        onChanged: (val) {
                                          cubit.checkBoxPrice = val!;
                                          setState(() {});
                                        }),
                                  ),
                                  Flexible(
                                    child: CheckboxListTile(
                                        title: Text(
                                          'المركز',
                                          style: TextStyle(
                                              fontSize: 10.sp),
                                        ),
                                        controlAffinity:
                                        ListTileControlAffinity
                                            .leading,
                                        checkColor: Colors.black,
                                        fillColor: const MaterialStatePropertyAll(
                                            AppColors.primaryColor),
                                        contentPadding: EdgeInsets
                                            .zero,
                                        value: cubit.checkBoxCenter,
                                        onChanged: (val) {
                                          cubit.checkBoxCenter = val!;
                                          setState(() {});
                                        }),
                                  ),
                                ],
                              ),
                              Flexible(
                                child: CheckboxListTile(
                                    title: Text(
                                      'المنتج',
                                      style: TextStyle(
                                          fontSize: 10.sp),
                                    ),
                                    controlAffinity:
                                    ListTileControlAffinity.leading,
                                    checkColor: Colors.black,
                                    fillColor: const MaterialStatePropertyAll(
                                        AppColors.primaryColor),
                                    contentPadding: EdgeInsets.zero,
                                    value: cubit.checkBoxProduct,
                                    onChanged: (val) {
                                      cubit.checkBoxProduct = val!;
                                      setState(() {});
                                    }),
                              ),
                              CustomElevatedButton(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  widget: Text(
                                    'اختر',
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                    ),
                                  ))
                            ],
                          );
                        }));
              },
              icon: const Icon(EvaIcons.options2Outline),
              constraints: const BoxConstraints(),
            )
          ],
        );

      },
    );
  }
}
