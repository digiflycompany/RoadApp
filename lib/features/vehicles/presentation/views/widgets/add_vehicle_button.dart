import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/custom_elevated_button_two.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_cubit.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_state.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_component.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_drop_down.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/single_add_vehicle_text_field.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../search/data/models/car_brand_model.dart';

class AddVehicleButton extends StatelessWidget {
  const AddVehicleButton({super.key, required this.vehiclesContext});
  final BuildContext vehiclesContext;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonTwo(
        onTap: () {
          if (VehiclesCubit.get(context).brands == null ||
              VehiclesCubit.get(context).brands!.isEmpty) {
            VehiclesCubit.get(context).fetchBrands();
          }
          showCustomAlertDialog(
              context: context,
              title: StringManager.addVehicle.tr(context),
              content: SingleChildScrollView(
                  child: BlocConsumer<VehiclesCubit, VehiclesState>(
                      listener: (context, state) {
                if (state is AddVehicleErrorState) {
                  Navigator.pop(context);
                  showDefaultDialog(context,
                      type: NotificationType.error,
                      description: state.error,
                      title: StringManager.errorAddingVehicle.tr(context));
                }
                if (state is AddVehicleSuccessState) {
                  Navigator.pop(context);
                  showDefaultDialog(vehiclesContext,
                      type: NotificationType.success,
                      description:
                          StringManager.vehicleAddedSuccessfully.tr(context),
                      title:
                          StringManager.vehicleAddedSuccessfully.tr(context));
                  VehiclesCubit.get(context).fetchVehicles();
                }
              }, builder: (context, state) {
                var cubit = VehiclesCubit.get(context);
                return state is FetchingBrandsLoadingState
                    ? const CustomLoadingIndicator(height: 250)
                    : state is BrandsErrorState
                        ? Text(state.error, style: Styles.textStyle16)
                        : state is AddVehicleLoadingState
                            ? Center(
                                child: SizedBox(
                                    width: 150.w,
                                    height: 150.w,
                                    child: LottieBuilder.asset(
                                        AppAssets.loading,
                                        frameRate: const FrameRate(900))))
                            : Form(
                                key: cubit.addVehicleFormKey,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 10.h),
                                      Row(children: [
                                        AddVehicleDropDown(
                                          title: StringManager.company.tr(context),
                                          items: cubit.brands?.map((brand) {
                                            return DropdownMenuItem<String>(
                                              value: brand.id, // تأكد أن الـ value هو الـ id
                                              child: Text(brand.name ?? ''), // عرض الـ name
                                            );
                                          }).toList() ?? [],  // إذا كانت القائمة null، اعرض قائمة فارغة
                                          onChanged: (String? selectedBrandId) {
                                            if (selectedBrandId != null) {
                                              cubit.changeSelectedBrand(selectedBrandId);
                                            }
                                          },
                                          hint: cubit.selectedBrand != null
                                              ? cubit.brands!
                                              .firstWhere((brand) => brand.id == cubit.selectedBrand)
                                              .name
                                              .toString()
                                              : 'Select a brand',
                                        ),



                                        // AddVehicleDropDown(
                                        //     title: StringManager.company
                                        //         .tr(context),
                                        //     items: cubit.brands
                                        //             ?.map((brand) => brand.name)
                                        //             .toList() ??
                                        //         [],
                                        //     onChanged: (selectedBrand) {
                                        //       if (selectedBrand != null) {
                                        //         cubit.changeSelectedBrand(
                                        //             selectedBrand as String);
                                        //       }
                                        //     },
                                        //     hint: cubit.selectedBrand ?? ''),
                                        const Spacer(),
                                        SingleAddVehicleTextField(
                                            title:
                                                StringManager.car.tr(context),
                                            controller: cubit.carController,
                                            keyboardType: TextInputType.name)
                                      ]),
                                      AddVehicleComponent(
                                          firstText: StringManager
                                              .manufactureYear
                                              .tr(context),
                                          secondText: StringManager
                                              .licensePlateNumber
                                              .tr(context),
                                          firstController:
                                              cubit.manufactureYearController,
                                          secondController:
                                              cubit.platNumberController,
                                          secondKeyboardType:
                                              TextInputType.name),
                                      Row(children: [
                                        AddVehicleTwoDropDown(
                                            title: StringManager
                                                .transmissionType
                                                .tr(context),
                                            items: cubit.transmissionTypes,
                                            onChanged: (type) {
                                              if (type != null) {
                                                cubit.changeTransmissionType(
                                                    type as String);
                                              }
                                            },
                                            hint: cubit.transmissionType ?? ''),
                                        const Spacer(),
                                        SingleAddVehicleTextField(
                                            title: StringManager.ccsNum
                                                .tr(context),
                                            controller:
                                                cubit.ccsNumberController,
                                            keyboardType: TextInputType.number)
                                      ]),
                                      AddVehicleComponent(
                                          firstText: StringManager.engineNumber
                                              .tr(context),
                                          secondText: StringManager
                                              .chassisNumber
                                              .tr(context),
                                          firstController:
                                              cubit.enginNumberController,
                                          secondController:
                                              cubit.chassisNumberController,
                                          firstKeyboardType: TextInputType.name,
                                          secondKeyboardType:
                                              TextInputType.name),
                                      SingleAddVehicleTextField(
                                          title: StringManager.tankCapacity
                                              .tr(context),
                                          controller:
                                              cubit.tankCapacityController),
                                      CustomElevatedButton(
                                          onTap: () =>
                                              cubit.validateToAddVehicle(),
                                          widget: Text(
                                              StringManager.add.tr(context),
                                              style:
                                                  TextStyle(fontSize: 10.sp)))
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
