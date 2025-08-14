import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_component.dart';
import '../../../maintenance_service/cubit/maintenance_service_type_cubit.dart';
import '../../../vehicles/presentation/views/widgets/add_vehicle_text_field.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class AddReportIcon extends StatelessWidget {
  const AddReportIcon(
      {super.key,
      required this.vehicleId,
      required this.cubit,
      required this.state});

  final MaintenanceReportCubit cubit;
  final MaintenanceReportStates state;
  final String vehicleId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 35.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: SvgPicture.asset(AppAssets.addIcon),
          onTap: () {
            var serviceTypeCubit = context.read<MaintenanceServiceTypeCubit>();
            serviceTypeCubit.getServiceType();
            serviceTypeCubit
                .getProductsType(); // 🔹 جلب البيانات قبل عرض النافذة
            showCustomAlertDialog(
              onComplete: () {
                cubit.selectedServiceType = null;
                cubit.mcName.clear();
                cubit.phoneMc.clear();
                cubit.serviceName.clear();
                cubit.servicePrice.clear();
                cubit.selectedProductType = null;
                cubit.productName.clear();
                cubit.productPrice.clear();
              },
              context: context,
              title: StringManager.addReport.tr(context),
              content: Form(
                key: cubit.reportFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AddVehicleComponent(
                        firstKeyboardType: TextInputType.text,
                        secondKeyboardType: TextInputType.phone,
                        firstText: StringManager.maintenanceCenters.tr(context),
                        secondText: StringManager.phoneNumber.tr(context),
                        required: false,
                        firstController: cubit.mcName,
                        secondController: cubit.phoneMc,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringManager.serviceType.tr(context),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                BlocBuilder<MaintenanceServiceTypeCubit,
                                    MaintenanceServiceTypeState>(
                                  builder: (context, state) {
                                    var cubitType =
                                        MaintenanceServiceTypeCubit.get(
                                            context);

                                    if (state is GetServiceTypeLoading) {
                                      return const Row(
                                        children: [
                                          CircularProgressIndicator(),
                                          Spacer(),
                                        ],
                                      );
                                    }

                                    return SizedBox(
                                      height: 48,
                                      child: DropdownButtonFormField<String>(
                                        isExpanded: true,
                                        value: cubit.selectedServiceType,
                                        items: cubitType.serviceTypeResponse
                                                ?.data.serviceTypes
                                                .map((service) {
                                              return DropdownMenuItem<String>(
                                                value: service.name,
                                                child: Text(
                                                  service.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              );
                                            }).toList() ??
                                            [],
                                        onChanged: (value) {
                                          cubit.selectedServiceType = value;
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringManager.price.tr(context),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(
                                width: 100.w,
                                child: AddVehicleTextField(
                                  controller: cubit.servicePrice,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringManager.productType.tr(context),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                BlocBuilder<MaintenanceServiceTypeCubit,
                                    MaintenanceServiceTypeState>(
                                  builder: (context, state) {
                                    var cubitType =
                                        MaintenanceServiceTypeCubit.get(
                                            context);

                                    if (state is FetchProductTypeLoading) {
                                      return const Row(
                                        children: [
                                          CircularProgressIndicator(),
                                          Spacer(),
                                        ],
                                      );
                                    }

                                    return SizedBox(
                                      height: 48,
                                      child: DropdownButtonFormField<String>(
                                        isExpanded: true,
                                        value: cubit.selectedProductType,
                                        items: (cubitType.productTypes ?? [])
                                            .map((productType) {
                                          return DropdownMenuItem<String>(
                                            value:
                                                productType.name, // اسم المنتج
                                            child: Text(
                                              productType.name!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          cubit.selectedProductType = value;
                                        },
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringManager.price.tr(context),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(
                                width: 100.w,
                                child: AddVehicleTextField(
                                  controller: cubit.productPrice,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // AddVehicleComponent(
                      //   firstKeyboardType: TextInputType.text,
                      //   firstText: StringManager.productType.tr(context),
                      //   secondText: StringManager.price.tr(context),
                      //   required: false,
                      //   firstController: cubit.productName,
                      //   secondController: cubit.productPrice,
                      // ),
                      CustomElevatedButton(
                        onTap: () async {
                          if (cubit.selectedServiceType == null) {
                            showToast(
                                message:
                                    StringManager.selectServiceType.tr(context),
                                state: ToastStates.error);
                          }
                          if (cubit.selectedProductType == null) {
                            showToast(
                                message: StringManager.thisFieldIsRequired
                                    .tr(context),
                                state: ToastStates.error);
                          } else {
                            if (cubit.reportFormKey.currentState!.validate()) {
                              await cubit.postReports(vehicleId, context);
                            }
                          }
                        },
                        widget: Text(
                          StringManager.add.tr(context),
                          style: TextStyle(fontSize: 11.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
