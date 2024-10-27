import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/Localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/custom_elevated_button_two.dart';
import 'package:roadapp/features/vehicles/presentation/widgets/add_vehicle_component.dart';
import 'package:roadapp/features/vehicles/presentation/widgets/single_add_vehicle_text_field.dart';

class AddVehicleButton extends StatelessWidget {
  const AddVehicleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonTwo(
        onTap: () {
          showCustomAlertDialog(
              context: context,
              title: StringManager.addVehicle.tr(context),
              content: SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(height: 10.h),
                AddVehicleComponent(
                    firstText: StringManager.company.tr(context),
                    secondText: StringManager.car.tr(context),
                    firstController: TextEditingController(),
                    secondController: TextEditingController()),
                AddVehicleComponent(
                    firstText: StringManager.manufactureYear.tr(context),
                    secondText: StringManager.licensePlateNumber.tr(context),
                    firstController: TextEditingController(),
                    secondController: TextEditingController()),
                AddVehicleComponent(
                    firstText: StringManager.transmissionType.tr(context),
                    secondText: StringManager.ccsNum.tr(context),
                    firstController: TextEditingController(),
                    secondController: TextEditingController()),
                AddVehicleComponent(
                    firstText: StringManager.engineNumber.tr(context),
                    secondText: StringManager.chassisNumber.tr(context),
                    required: false,
                    firstController: TextEditingController(),
                    secondController: TextEditingController()),
                const SingleAddVehicleTextField(),
                CustomElevatedButton(
                    onTap: () {},
                    widget: Text(StringManager.add.tr(context),
                        style: TextStyle(fontSize: 10.sp)))
              ])));
        },
        widget: Row(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.add, color: Colors.black),
          Text(StringManager.addVehicle.tr(context),
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600))
        ]));
  }
}