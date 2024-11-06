import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
import 'package:roadapp/core/helpers/functions/show_default_loading_indicator.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_cubit.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_state.dart';
import 'package:roadapp/features/calendar/presentation/cubit/cubit.dart';
import 'package:roadapp/features/calendar/presentation/views/screens/calender_screen.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/calendar_custom_text_field.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/memo_dropdown.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/pic_memo_date_time.dart';

class AddMemoButton extends StatelessWidget {
  const AddMemoButton({super.key});

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
                      child: BlocConsumer<AddMemoCubit, AddMemoState>(
                          listener: (context, state) {
                    if (state is AddingMemoLoadingState) {
                      showDefaultLoadingIndicator(context);
                    }
                    if (state is AddMemoErrorState) {
                      Navigator.pop(context);
                      showDefaultDialog(context,
                          type: NotificationType.error,
                          description: state.error,
                          title: StringManager.errorAddingMemo.tr(context));
                    }
                    if (state is NoteAddedState) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      showToast(
                          message:
                              StringManager.memoAddedSuccessfully.tr(context),
                          state: ToastStates.success, gravity: ToastGravity.BOTTOM);
                      AppNavigation.navigateReplacement(const CalenderScreen());
                    }
                  }, builder: (context, state) {
                    var cubit = AddMemoCubit.get(context);
                    return Form(
                        key: cubit.formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MemoDropdown(
                                  title: StringManager.importance.tr(context),
                                  iconPath: AppAssets.importanceIcon,
                                  hint: StringManager.selectImportance
                                      .tr(context),
                                  value: cubit.selectedImportance,
                                  list: cubit.importanceList,
                                  onChanged: (String? newValue) =>
                                      cubit.changeImportance(newValue!)),
                              SizedBox(height: 12.h),
                              Text(StringManager.time.tr(context),
                                  style: Styles.textStyle12),
                              const PicMemoDateTime(),
                              SizedBox(height: 12.h),
                              MemoDropdown(
                                  title:
                                      StringManager.classification.tr(context),
                                  iconPath: AppAssets.wireframeIcon,
                                  hint: StringManager.selectClassification
                                      .tr(context),
                                  value: cubit.selectedClassification,
                                  list: cubit.classificationsList,
                                  onChanged: (String? newValue) =>
                                      cubit.changeClassification(newValue!)),
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
                                      height: 20,
                                      onTap: () => cubit.validateToAddMemo(),
                                      widget: Text(
                                          StringManager.add.tr(context),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.sp))))
                            ]));
                  })));
            },
            icon: const Icon(Icons.add)));
  }
}
