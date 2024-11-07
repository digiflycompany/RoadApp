import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_component.dart';
import '../../../../core/helpers/functions/show_default_loading_indicator.dart';
import '../../cubit/cubit.dart';

class AddReportIcon extends StatelessWidget {
  const AddReportIcon({super.key, required this.vehicleId, required this.cubit});

  final MaintenanceReportCubit cubit;
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
            showCustomAlertDialog(
              context: context,
              title: StringManager.addReport.tr(context),
              content: Form(
                key: cubit.reportFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // AddVehicleComponent(
                    //   firstKeyboardType: TextInputType.text,
                    //   firstText: StringManager.centerName.tr(context),
                    //   secondText: StringManager.phoneNumber.tr(context),
                    //   required: false,
                    //   firstController: TextEditingController(),
                    //   secondController: TextEditingController(),
                    // ),
                    AddVehicleComponent(
                      firstKeyboardType: TextInputType.text,
                      firstText: StringManager.serviceType.tr(context),
                      secondText: StringManager.price.tr(context),
                      required: false,
                      firstController: cubit.serviceName,
                      secondController: cubit.servicePrice,
                    ),
                    AddVehicleComponent(
                      firstKeyboardType: TextInputType.text,
                      firstText: StringManager.productType.tr(context),
                      secondText: StringManager.price.tr(context),
                      required: false,
                      firstController: cubit.productName,
                      secondController: cubit.productPrice,
                    ),
                     CustomElevatedButton(
                      onTap: () async {
                        if (cubit.reportFormKey.currentState!.validate()) {
                          await cubit.postReports(vehicleId);
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
              );
          },
        ),
      ),
    );
  }
}
