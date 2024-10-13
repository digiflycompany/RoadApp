import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/calender/cubit/add_memo_cubit.dart';
import 'package:roadapp/features/calender/cubit/add_memo_state.dart';
import 'package:roadapp/features/calender/views/widgets/calendar_custom_text_field.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30.sp,
        width: 30.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.primaryColor),
        child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              showCustomAlertDialog(
                  context: context,
                  title: StringManager.addMemo.tr(context),
                  content: SingleChildScrollView(
                    child: BlocBuilder<AddMemoCubit, AddMemoState>(
                      builder: (context, state) {
                        var cubit = AddMemoCubit.get(context);
                        return Form(
                          key: cubit.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            StringManager.importance
                                                .tr(context),
                                            style: Styles.textStyle12),
                                        SizedBox(height: 6.h),
                                        CalendarCustomTextField(
                                            validationFunc: (text) {
                                              if (text?.trim() == null ||
                                                  text!.trim().isEmpty) {
                                                return StringManager
                                                    .importanceIsRequired
                                                    .tr(context);
                                              }
                                              return null;
                                            },
                                            width: 100.w,
                                            borderRadius: 8,
                                            controller:
                                                cubit.importanceController,
                                            prefixIcon: Transform.scale(
                                                scale: 0.6,
                                                child: SvgPicture.asset(
                                                    AppAssets.importanceIcon)))
                                      ]),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        StringManager.reminderTimes.tr(context),
                                        style: Styles.textStyle12
                                      ),
                                      SizedBox(
                                        height: 6.h
                                      ),
                                      CalendarCustomTextField(
                                          validationFunc: (text) {
                                            if (text?.trim() == null ||
                                                text!.trim().isEmpty) {
                                              return StringManager
                                                  .reminderTimesIsRequired
                                                  .tr(context);
                                            }
                                            return null;
                                          },
                                          width: 100.w,
                                          controller: cubit.timesController,
                                          prefixIcon: Transform.scale(
                                              scale: 0.6,
                                              child: SvgPicture.asset(
                                                  AppAssets.timeIcon)))
                                    ]
                                  )
                                ]
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                StringManager.time.tr(context),
                                style: Styles.textStyle12
                              ),
                              SizedBox(
                                height: 6.h
                              ),
                              CalendarCustomTextField(
                                  controller: TextEditingController(),
                                  prefixIcon: Transform.scale(
                                      scale: 0.6,
                                      child: SvgPicture.asset(
                                          AppAssets.clockIcon))),
                              SizedBox(height: 12.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'التصنيف',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  CalendarCustomTextField(
                                      height: 42.h,
                                      borderRadius: 10.r,
                                      fillColor: AppColors.greyColor3,
                                      borderColor: AppColors.greyColor3,
                                      controller: TextEditingController(),
                                      prefixIcon: Transform.scale(
                                          scale: 0.6,
                                          child: SvgPicture.asset(
                                              AppAssets.wireframeIcon))),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'موضوع المذكرة',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  CalendarCustomTextField(
                                    height: 150.h,
                                    maxLines: 3,
                                    borderRadius: 10.r,
                                    fillColor: AppColors.greyColor3,
                                    borderColor: AppColors.greyColor3,
                                    controller: TextEditingController(),
                                  ),
                                ],
                              ),
                              // CustomTextField(
                              //   fillColor:
                              //       AppColors.whiteColor2,
                              //   hintText: "موضوع المذكرة",
                              //   controller:
                              //       TextEditingController(),
                              //   height: 150,
                              //   maxLines: 3,
                              // ),
                              CustomElevatedButton(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  widget: Text(
                                    '   أضف   ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp),
                                  ))
                            ],
                          ),
                        );
                      },
                    ),
                  ));
            },
            icon: const Icon(Icons.add)));
  }
}
