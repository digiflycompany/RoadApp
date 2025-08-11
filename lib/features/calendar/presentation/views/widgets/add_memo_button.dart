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
import 'package:roadapp/features/calendar/presentation/views/screens/calender_screen.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/calendar_custom_text_field.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/memo_dropdown.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/pic_memo_date_time.dart';

import '../../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

// class AddMemoButton extends StatelessWidget {
//   const AddMemoButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 30.sp,
//         width: 30.sp,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: AppColors.primaryColor),
//         child: IconButton(
//             padding: EdgeInsets.zero,
//             onPressed: () {
//               var cubit = AddMemoCubit.get(context);
//               cubit.fetchVehiclesDropDown(); // جلب قائمة السيارات قبل عرض الـ dialog
//
//               showCustomAlertDialog(
//                 context: context,
//                 title: StringManager.addMemo.tr(context),
//                 content: SingleChildScrollView(
//                   child: BlocConsumer<AddMemoCubit, AddMemoState>(
//                     listener: (context, state) {
//                       if (state is AddingMemoLoadingState) {
//                         showDefaultLoadingIndicator(context);
//                       }
//                       if (state is AddMemoErrorState) {
//                         Navigator.pop(context);
//                         showDefaultDialog(
//                           context,
//                           type: NotificationType.error,
//                           description: state.error,
//                           title: StringManager.errorAddingMemo.tr(context),
//                         );
//                       }
//                       if (state is NoteAddedState) {
//                         Navigator.pop(context);
//                         Navigator.pop(context);
//                         showToast(
//                           message: StringManager.memoAddedSuccessfully.tr(context),
//                           state: ToastStates.success,
//                           gravity: ToastGravity.BOTTOM,
//                         );
//                         AppNavigation.navigateReplacement(const CalenderScreen());
//                       }
//                     },
//                     builder: (context, state) {
//                       var cubit = AddMemoCubit.get(context);
//
//
//                       return Form(
//                         key: cubit.formKey,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//
//                             VehiclesDropdown(),
//
//                             SizedBox(height: 12.h),
//                             MemoDropdown(
//                               title: StringManager.importance.tr(context),
//                               iconPath: AppAssets.importanceIcon,
//                               hint: StringManager.selectImportance.tr(context),
//                               value: cubit.selectedImportance,
//                               list: cubit.importanceList,
//                               onChanged: (String? newValue) =>
//                                   cubit.changeImportance(newValue!),
//                             ),
//                             SizedBox(height: 12.h),
//                             Text(StringManager.time.tr(context),
//                                 style: Styles.textStyle12),
//                             const PicMemoDateTime(),
//                             SizedBox(height: 12.h),
//                             MemoDropdown(
//                               title: StringManager.classification.tr(context),
//                               iconPath: AppAssets.wireframeIcon,
//                               hint: StringManager.selectClassification.tr(context),
//                               value: cubit.selectedClassification,
//                               list: cubit.classificationsList,
//                               onChanged: (String? newValue) =>
//                                   cubit.changeClassification(newValue!),
//                             ),
//                             SizedBox(height: 12.h),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(StringManager.memoTopic.tr(context),
//                                     style: TextStyle(
//                                         fontSize: 10.sp,
//                                         fontWeight: FontWeight.w600)),
//                                 SizedBox(height: 6.h),
//                                 CalendarCustomTextField(
//                                     validationFunc: (text) {
//                                       if (text == null || text.trim().isEmpty) {
//                                         return StringManager.noteTopicIsRequired
//                                             .tr(context);
//                                       }
//                                       return null;
//                                     },
//                                     height: 100,
//                                     maxLines: 3,
//                                     controller: cubit.topicController)
//                               ],
//                             ),
//                             Center(
//                               child: CustomElevatedButton(
//                                 height: 35,
//                                 onTap: () => cubit.validateToAddMemo(),
//                                 widget: Text(
//                                   StringManager.add.tr(context),
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10.sp),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             },
//
//             icon: const Icon(Icons.add)));
//   }
// }

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
        onPressed: () async{
          var cubit = AddMemoCubit.get(context);

          //cubit.isVendor = await CacheHelper().getData('CLIENT');
          cubit.checkUserType(); // التأكد مما إذا كان المستخدم Vendor
         // cubit.fetchVehiclesDropDown();

          //cubit.fetchCustomerReports();

          showCustomAlertDialog(
            context: context,
            title: "إضافة مذكرة",
            content: SingleChildScrollView(
              child: BlocConsumer<AddMemoCubit, AddMemoState>(
                listener: (context, state) {
                  if (state is AddingMemoLoadingState) {
                    showDefaultLoadingIndicator(context);
                  }
                  if (state is AddMemoErrorState) {
                    Navigator.pop(context);
                    showDefaultDialog(
                      context,
                      type: NotificationType.error,
                      description: state.error,
                      title: "خطأ في إضافة المذكرة",
                    );
                  }
                  if (state is NoteAddedState) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    showToast(
                      message: StringManager.success.tr(context),
                      state: ToastStates.success,
                      gravity: ToastGravity.BOTTOM,
                    );
                    AppNavigation.navigateReplacement(const CalenderScreen());
                  }
                },
                builder: (context, state) {
                  var cubit = AddMemoCubit.get(context);

                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      cubit.isVendor == 'CLIENT' ? const ClientsDropdown() :
                      const VehiclesDropdown(),
                        const SizedBox(height: 12),
                        MemoDropdown(
                          title: "الأهمية",
                          iconPath: AppAssets.importanceIcon,
                          hint: "حدد الأهمية",
                          value: cubit.selectedImportance,
                          list: cubit.importanceList,
                          onChanged: (String? newValue) => cubit.changeImportance(newValue!),
                        ),
                        const SizedBox(height: 12),
                        const PicMemoDateTime(),
                        const SizedBox(height: 12),
                        MemoDropdown(
                          title: "التصنيف",
                          iconPath: AppAssets.wireframeIcon,
                          hint: "حدد التصنيف",
                          value: cubit.selectedClassification,
                          list: cubit.classificationsList,
                          onChanged: (String? newValue) => cubit.changeClassification(newValue!),
                        ),
                        const SizedBox(height: 12),
                        CalendarCustomTextField(
                          validationFunc: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "يجب إدخال موضوع المذكرة";
                            }
                            return null;
                          },
                          height: 100,
                          maxLines: 3,
                          controller: cubit.topicController,
                        ),
                        Center(
                          child: CustomElevatedButton(
                            height: 35,
                            onTap: () => cubit.validateToAddMemo(),
                            widget: const Text("إضافة"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}



class ClientsDropdown extends StatelessWidget {
  const ClientsDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMemoCubit, AddMemoState>(
      builder: (context, state) {
        var cubit = AddMemoCubit.get(context);

        if (cubit.isVendor =='PROVIDER' || cubit.customerReportList == null || cubit.selectedClassification == "GENERAL") {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("اختر العميل",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: cubit.selectedClient,
              hint: const Text("اختر عميل"),
              items: cubit.customerReportList!.map((client) {
                return DropdownMenuItem<String>(
                  value: client.id,
                  child: Text(client.fullName),
                );
              }).toList(),
              onChanged: (value) => cubit.changeClient(value!),
              validator: (value) {
                if (cubit.selectedClassification == "SPECIFIC" &&
                    (value == null || value.isEmpty)) {
                  return "يجب اختيار عميل عند تحديد التصنيف 'SPECIFIC'";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
          ],
        );
      },
    );
  }
}

class VehiclesDropdown extends StatelessWidget {
  const VehiclesDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMemoCubit, AddMemoState>(
      builder: (context, state) {
        var cubit = AddMemoCubit.get(context);

        // إخفاء القائمة إذا كان التصنيف عام (GENERAL)
        if (cubit.selectedClassification == "GENERAL") {
          return const SizedBox.shrink(); // يخفي الودجت تمامًا
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.car.tr(context),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: cubit.selectedVehicle,
              hint: Text(StringManager.select.tr(context)),
              items: cubit.vehiclesList.map((vehicle) {
                return DropdownMenuItem<String>(
                  value: vehicle.id,
                  child: Text(
                    "${vehicle.model} - ${vehicle.plateNumber}",
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }).toList(),
              onChanged: (value) => cubit.changeVehicle(value!),
              validator: (value) {
                if (cubit.selectedClassification == "SPECIFIC" && (value == null || value.isEmpty)) {
                  return "يجب اختيار سيارة عند تحديد التصنيف 'SPECIFIC'";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),

          ],
        );
      },
    );
  }
}

// class VehiclesDropdown extends StatelessWidget {
//   const VehiclesDropdown({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AddMemoCubit, AddMemoState>(
//       builder: (context, state) {
//         var cubit = AddMemoCubit.get(context);
//
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//                 StringManager.car.tr(context),
//                 style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             DropdownButtonFormField<String>(
//               value: cubit.selectedVehicle,
//               hint: Text(StringManager.select.tr(context)),
//               items: cubit.vehiclesList.map((vehicle) {
//                 return DropdownMenuItem<String>(
//                   value: vehicle.id,
//                   child: Text(
//                       "${vehicle.model} - ${vehicle.plateNumber}" ?? "",
//                     style:  const TextStyle(fontSize: 12),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (value) => cubit.changeVehicle(value!), // استدعاء الدالة الصحيحة
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
