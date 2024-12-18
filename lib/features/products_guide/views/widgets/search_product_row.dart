// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
// import 'package:roadapp/core/helpers/functions/toast.dart';
// import 'package:roadapp/core/helpers/localization/app_localization.dart';
// import 'package:roadapp/core/Theming/colors.dart';
// import 'package:roadapp/core/helpers/functions/general_functions.dart';
// import 'package:roadapp/core/helpers/navigation/navigation.dart';
// import 'package:roadapp/core/helpers/app_assets.dart';
// import 'package:roadapp/core/helpers/string_manager.dart';
// import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
// import 'package:roadapp/core/widgets/custom_button.dart';
// import 'package:roadapp/core/widgets/custom_text_field.dart';
// import 'package:roadapp/features/services_guide/views/widgets/car_brand_drop_down.dart';
// import 'package:roadapp/features/services_guide/views/widgets/select_service_process_type.dart';
// import 'package:roadapp/features/services_guide/views/widgets/service_type_drop_down.dart';
//
// import '../../../../core/Theming/styles.dart';
// import '../cubit/product_basket_cubit.dart';
//
// class SearchProductRow extends StatelessWidget {
//   const SearchProductRow({super.key, this.onChanged});
//
//   final void Function(String)? onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//               height: 43,
//               decoration: BoxDecoration(
//                   color: AppColors.greyColor2.withOpacity(0.05),
//                   borderRadius: BorderRadius.circular(10.r)),
//               child: TextField(
//                   style: Styles.textStyle12,
//                   //onChanged: onChanged,
//                   onSubmitted: onChanged,
//                   onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
//                   decoration: InputDecoration(
//                       contentPadding:
//                           const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                       hintText: StringManager.search.tr(context),
//                       hintStyle: TextStyle(
//                           fontSize: 12.sp,
//                           color: const Color(0xFFAAAAAA).withOpacity(0.5)),
//                       border: InputBorder.none,
//                       prefixIcon: const Icon(CupertinoIcons.search,
//                           color: Colors.grey, size: 17.5)))),
//         ),
//
//         SizedBox(
//           width: 10.w,
//         ),
//
//         BlocBuilder<ProductBasketCubit,
//             ProductBasketState>(
//           builder: (context, state) {
//             var cubit = ProductBasketCubit.get(context);
//             return GestureDetector(
//               onTap: () {
//                 // cubitVendor.fetchCarBrand();
//                 // cubitVendor.fetchMaintenanceServiceTypeDropDown();
//                 buildShowCustomAlertDialog(context);
//               },
//               child: Container(
//                 height: 40.h,
//                 width: 35.w,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: AppColors.primaryColor),
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
//                   child: SvgPicture.asset(
//                     AppAssets.addIcon,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//
//       ],
//     );
//   }
//
//   void buildShowCustomAlertDialog(BuildContext context) {
//     return showCustomAlertDialog(
//       context: context,
//       title: StringManager.addService.tr(context),
//       content: BlocConsumer<ProductBasketCubit,
//           ProductBasketState>(
//         listener: (context, state) {
//           var cubit = ProductBasketCubit.get(context);
//           if (state is AddServicesErrorState) {
//             AppNavigation.back();
//             cubit.costTextEditingController.clear();
//             cubit.nameTextEditingController.clear();
//
//              showDefaultDialog(
//               context,
//               title: 'Error',
//               type: NotificationType.error,
//               description: state.error,
//             );
//           }
//           else if (state is AddServicesSuccessState) {
//             AppNavigation.back();
//             cubit.costTextEditingController.clear();
//             cubit.nameTextEditingController.clear();
//           showToast(message: 'Success', state: ToastStates.success);
//           }else if (state is AddServicesSuggestionSuccessState) {
//             AppNavigation.back();
//             cubit.nameTextEditingController.clear();
//             showToast(message: 'Success', state: ToastStates.success);
//           }else if (state is AddServicesSuggestionErrorState) {
//             AppNavigation.back();
//             cubit.nameTextEditingController.clear();
//
//             showDefaultDialog(
//               context,
//               title: 'Error',
//               type: NotificationType.error,
//               description: state.error,
//             );
//           }
//         },
//         builder: (context, state) {
//           var cubit = MaintenanceServiceTypeVendorCubit.get(context);
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SelectServiceProcessType(),
//                 SizedBox(height: 10.h),
//                 cubit.selectedRadio == 1
//                     ? AddServicesWidget(cubit: cubit,state: state,)
//                     : ServiceRequestWidget(cubit: cubit,state: state,),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
// class ServiceRequestWidget extends StatelessWidget {
//   const ServiceRequestWidget({
//     super.key,
//     required this.cubit,
//     required this.state,
//   });
//
//   final MaintenanceServiceTypeVendorCubit cubit;
//   final MaintenanceServiceTypeVendorState state;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: [
//           Text(
//             StringManager.pleaseEnterServiceTitle.tr(context),
//             style: TextStyle(fontSize: 12.sp),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10.r)),
//             padding: EdgeInsets.all(10.w),
//             child: TextField(
//               controller: cubit.nameTextEditingController,
//               maxLines: 3,
//               decoration: InputDecoration.collapsed(
//                 hintText: StringManager.yourMessage.tr(context),
//                 hintStyle: TextStyle(
//                   fontSize: 12.sp,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           state is AddServicesSuggestionLoadingState
//               ? const Center(child: CircularProgressIndicator())
//               : Center(
//                   child: CustomElevatedButton(
//                       onTap: () {
//                         if (cubit.nameTextEditingController.text.isEmpty) {
//                           showToast(
//                               message:
//                                   'Please Select Name',
//                               state: ToastStates.error);
//                         } else {
//                           cubit.servicesSuggestion();
//                         }
//                         //AppNavigation.back();
//                       },
//                       widget: Text(
//                           StringManager.add.tr(context),
//                           style: TextStyle(fontSize: 10.sp))),
//                 )
//         ],
//       );
//   }
// }
//
// class AddServicesWidget extends StatelessWidget {
//   const AddServicesWidget({
//     super.key,
//     required this.cubit,
//     required this.state,
//   });
//
//   final MaintenanceServiceTypeVendorCubit cubit;
//   final MaintenanceServiceTypeVendorState state;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(StringManager.name.tr(context),
//               style: TextStyle(fontSize: 12.sp),
//               textAlign: TextAlign.center),
//           SizedBox(
//             height: 5.h,
//           ),
//           CustomTextField(
//             height: 40.h,
//             fillColor: const Color(0xFFF9F9F9),
//             borderColor: Colors.transparent,
//             hintText: StringManager.name.tr(context),
//             controller: cubit.nameTextEditingController,
//           ),
//           Text(StringManager.serviceType.tr(context),
//               style: TextStyle(fontSize: 12.sp),
//               textAlign: TextAlign.center),
//           SizedBox(
//             height: 10.h,
//           ),
//           ServiceTypeDropDown(
//             hint: StringManager.serviceType.tr(context),
//           ),
//           SizedBox(height: 10.h),
//           Text(StringManager.carModel.tr(context),
//               style: TextStyle(fontSize: 12.sp),
//               textAlign: TextAlign.center),
//           SizedBox(
//             height: 10.h,
//           ),
//           CarBrandDropDown(
//             hint: StringManager.carModel.tr(context),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Text(StringManager.cost.tr(context),
//               style: TextStyle(fontSize: 12.sp),
//               textAlign: TextAlign.center),
//           SizedBox(
//             height: 10.h,
//           ),
//           CustomTextField(
//             height: 40.h,
//             fillColor: const Color(0xFFF9F9F9),
//             borderColor: Colors.transparent,
//             hintText: StringManager.cost.tr(context),
//             textInputType: TextInputType.number,
//             controller: cubit.costTextEditingController,
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           state is AddServicesLoadingState
//               ? const Center(child: CircularProgressIndicator())
//               : Center(
//                   child: CustomElevatedButton(
//                       onTap: () {
//                         if (cubit.selectedCarBrandName ==
//                             null) {
//                           showToast(
//                               message:
//                                   'Please Select Car Brand',
//                               state: ToastStates.error);
//                         } else if (cubit
//                                 .selectedServiceTypeName ==
//                             null) {
//                           showToast(
//                               message:
//                                   'Please Select Service Type',
//                               state: ToastStates.error);
//                         } else if (cubit
//                             .costTextEditingController
//                             .text
//                             .isEmpty) {
//                           showToast(
//                               message: 'Please Enter Cost',
//                               state: ToastStates.error);
//                         } else {
//                           cubit.createServices();
//                         }
//                         //AppNavigation.back();
//                       },
//                       widget: Text(
//                           StringManager.add.tr(context),
//                           style: TextStyle(fontSize: 10.sp))),
//                 )
//         ],
//       );
//   }
// }
