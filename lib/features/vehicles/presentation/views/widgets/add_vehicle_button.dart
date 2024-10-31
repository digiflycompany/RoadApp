import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
import 'package:roadapp/core/helpers/functions/show_default_loading_indicator.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/custom_elevated_button_two.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_cubit.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_state.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_component.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/single_add_vehicle_text_field.dart';

class AddVehicleButton extends StatelessWidget {
  const AddVehicleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonTwo(
        onTap: () {
          VehiclesCubit.get(context).fetchBrands();
          showCustomAlertDialog(
              context: context,
              title: StringManager.addVehicle.tr(context),
              content: SingleChildScrollView(
                  child: BlocConsumer<VehiclesCubit, VehiclesState>(
                      listener: (context, state) {
                if (State is AddVehicleLoadingState) {
                  showDefaultLoadingIndicator(context, cancelable: false);
                }
                if (state is AddVehicleErrorState) {
                  Navigator.pop(context);
                  showDefaultDialog(context,
                      type: NotificationType.error, description: state.error);
                }
                if (state is AddVehicleSuccessState) {
                  Navigator.pop(context);
                  showDefaultDialog(context,
                      type: NotificationType.success,
                      description:
                          StringManager.vehicleAddedSuccessfully.tr(context));
                  VehiclesCubit.get(context).fetchVehicles();
                }
              }, builder: (context, state) {
                var cubit = VehiclesCubit.get(context);
                return state is FetchingBrandsLoadingState? const CustomLoadingIndicator(height: 250): state is BrandsErrorState? Text(
                  state.error, style: Styles.textStyle16
                ): Form(
                    key: cubit.addVehicleFormKey,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(height: 10.h),
                      AddVehicleComponent(
                          firstText: StringManager.company.tr(context),
                          secondText: StringManager.car.tr(context),
                          firstController: cubit.companyController,
                          secondController: cubit.carController,
                          firstKeyboardType: TextInputType.name,
                          secondKeyboardType: TextInputType.name),
                      AddVehicleComponent(
                          firstText: StringManager.manufactureYear.tr(context),
                          secondText:
                              StringManager.licensePlateNumber.tr(context),
                          firstController: cubit.manufactureYearController,
                          secondController: cubit.platNumberController,
                          secondKeyboardType: TextInputType.name),
                      AddVehicleComponent(
                          firstText: StringManager.transmissionType.tr(context),
                          secondText: StringManager.ccsNum.tr(context),
                          firstController: cubit.gearShiftController,
                          secondController: cubit.ccsNumberController,
                          firstKeyboardType: TextInputType.name),
                      AddVehicleComponent(
                          firstText: StringManager.engineNumber.tr(context),
                          secondText: StringManager.chassisNumber.tr(context),
                          firstController: cubit.enginNumberController,
                          secondController: cubit.chassisNumberController,
                          firstKeyboardType: TextInputType.name,
                          secondKeyboardType: TextInputType.name),
                      const SingleAddVehicleTextField(),
                      CustomElevatedButton(
                          onTap: () => cubit.validateToAddVehicle(),
                          widget: Text(StringManager.add.tr(context),
                              style: TextStyle(fontSize: 10.sp)))
                    ]));
              })));
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
