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
import 'package:roadapp/features/calender/presentation/cubit/add_memo_cubit.dart';
import 'package:roadapp/features/calender/presentation/cubit/add_memo_state.dart';
import 'package:roadapp/features/calender/presentation/views/widgets/calendar_custom_text_field.dart';

class AddMemoButton extends StatelessWidget {
  const AddMemoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.sp,
      width: 30.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.primaryColor,
      ),
      child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            showCustomAlertDialog(
                context: context,
                title: StringManager.addMemo.tr(context),
                content: SingleChildScrollView(
                    child: BlocConsumer<AddMemoCubit, AddMemoState>(
                        listener: (context, state) {
                  if (state is NoteAddedState) Navigator.pop(context);
                }, builder: (context, state) {
                  var cubit = AddMemoCubit.get(context);
                  return Form(
                      key: cubit.formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(children: [
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Text(StringManager.importance.tr(context),
                                        style: Styles.textStyle12),
                                    SizedBox(height: 6.h),
                                    CalendarCustomTextField(
                                        validationFunc: (text) {
                                          if (text == null ||
                                              text.trim().isEmpty) {
                                            return StringManager
                                                .importanceIsRequired
                                                .tr(context);
                                          }
                                          return null;
                                        },
                                        borderRadius: 8,
                                        controller: cubit.importanceController,
                                        prefixIcon: Transform.scale(
                                            scale: 0.6,
                                            child: SvgPicture.asset(
                                                AppAssets.importanceIcon)))
                                  ])),
                              const Spacer(),
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Text(
                                        StringManager.reminderTimes.tr(context),
                                        style: Styles.textStyle12, maxLines: 1, overflow: TextOverflow.ellipsis),
                                    SizedBox(height: 6.h),
                                    CalendarCustomTextField(
                                        validationFunc: (text) {
                                          if (text == null ||
                                              text.trim().isEmpty) {
                                            return StringManager
                                                .reminderTimesIsRequired
                                                .tr(context);
                                          }
                                          return null;
                                        },
                                        controller: cubit.timesController,
                                        prefixIcon: Transform.scale(
                                            scale: 0.6,
                                            child: SvgPicture.asset(
                                                AppAssets.timeIcon)))
                                  ]))
                            ]),
                            SizedBox(height: 12.h),
                            Text(StringManager.time.tr(context),
                                style: Styles.textStyle12),
                            SizedBox(height: 6.h),
                            CalendarCustomTextField(
                                validationFunc: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return StringManager.timeIsRequired
                                        .tr(context);
                                  }
                                  return null;
                                },
                                controller: cubit.timeController,
                                prefixIcon: Transform.scale(
                                    scale: 0.6,
                                    child:
                                        SvgPicture.asset(AppAssets.clockIcon))),
                            SizedBox(height: 12.h),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(StringManager.classification.tr(context),
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 6.h),
                                  CalendarCustomTextField(
                                      validationFunc: (text) {
                                        if (text == null ||
                                            text.trim().isEmpty) {
                                          return StringManager
                                              .classificationIsRequired
                                              .tr(context);
                                        }
                                        return null;
                                      },
                                      controller:
                                          cubit.classificationController,
                                      prefixIcon: Transform.scale(
                                          scale: 0.6,
                                          child: SvgPicture.asset(
                                              AppAssets.wireframeIcon)))
                                ]),
                            SizedBox(height: 12.h),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(StringManager.memoTopic.tr(context),
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 6.h),
                                  CalendarCustomTextField(
                                      validationFunc: (text) {
                                        if (text == null ||
                                            text.trim().isEmpty) {
                                          return StringManager
                                              .noteTopicIsRequired
                                              .tr(context);
                                        }
                                        return null;
                                      },
                                      height: 100,
                                      maxLines: 3,
                                      controller: cubit.topicController)
                                ]),
                            Center(
                                child: CustomElevatedButton(
                                    height: 10,
                                    onTap: () => cubit.addNote(),
                                    widget: Text(StringManager.add.tr(context),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10.sp))))
                          ]));
                })));
          },
          icon: const Icon(Icons.add)),
    );
  }
}