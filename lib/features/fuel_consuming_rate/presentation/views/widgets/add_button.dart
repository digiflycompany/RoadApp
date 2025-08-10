import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
import 'package:roadapp/core/helpers/functions/show_default_loading_indicator.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/repos/fuel_rates_repo.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/cubit.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/states.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/add_fuel_component.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/single_add_fuel_text_field.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FuelConsumingRateCubit.get(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.primaryColor,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.add),
            onPressed: () {
              showCustomAlertDialog(
                context: context,
                title: StringManager.calcFuelAverage.tr(context),
                content: SingleChildScrollView(
                  child: BlocConsumer<FuelConsumingRateCubit,
                      FuelConsumingRateStates>(
                    bloc: cubit, // استخدام الـ Cubit الحالي
                    listener: (context, state) {
                      if (state is AddRateLoadingState) {
                        showDefaultLoadingIndicator(context, cancelable: false);
                      }
                      if (state is AddRateErrorState) {
                        Navigator.pop(context); // إغلاق الـ Loading
                        showDefaultDialog(
                          context,
                          type: NotificationType.error,
                          description: state.errorMessage,
                          title: StringManager.errorAddingFuelRate.tr(context),
                        );
                      }
                      // if (state is RateAddedState && context.mounted) {
                      //   Navigator.pop(context); // إغلاق Dialog الإضافة
                      //   showToast(
                      //     message: StringManager.fuelReportAddedSuccessfully.tr(context),
                      //     state: ToastStates.success,
                      //   );
                      //   cubit.fetchFuelRates(); // استدعاء واحد فقط
                      // }
                    },
                    builder: (context, state) {
                      return Form(
                        key: cubit.formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButton<Vehicle>(
                              value: cubit.selectedVehicle,
                              hint: Text(
                                'اختر العربية',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              items: cubit.vehicles?.map((vehicle) {
                                return DropdownMenuItem<Vehicle>(
                                  value: vehicle,
                                  child: Text(
                                      "${vehicle.brandId!.name} ${vehicle.model}"),
                                );
                              }).toList(),
                              onChanged: (vehicle) {
                                cubit.changeSelectedVehicle(
                                    vehicle, vehicle!.id);
                              },
                            ),
                            const SizedBox(height: 10),
                            AddFuelComponent(
                              readOnlyTwo: true,
                              firstText: StringManager.fuelMeterBeforeAddingFuel
                                  .tr(context),
                              secondText: StringManager.kms.tr(context),
                              controller1: cubit.odometerController,
                              controller2: cubit.kmsController,
                              onChanged: (_) => cubit.calculateDerivedValues(),
                            ),
                            const SizedBox(height: 5),
                            AddFuelComponent(
                              readOnlyOne: true,
                              readOnlyTwo: true,
                              firstText: StringManager.kmGm.tr(context),
                              secondText: StringManager.kmLiter.tr(context),
                              controller1: cubit.kmGmController,
                              controller2: cubit.kmLiterController,
                            ),
                            const SizedBox(height: 5),
                            AddFuelComponent(
                              firstText: StringManager.liters.tr(context),
                              secondText: StringManager.literPrice.tr(context),
                              controller1: cubit.litersController,
                              controller2: cubit.literPriceController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return StringManager.thisFieldIsRequired
                                      .tr(context);
                                }
                                if (value == "0" || value == "0.0") {
                                  return StringManager.thisFieldCanNotBeZero
                                      .tr(context);
                                }
                                return null;
                              },
                              onChanged: (_) => cubit.calculateFullTankPrice(),
                            ),
                            const SizedBox(height: 5),
                            SingleAddFuelTextField(
                              readOnly: true,
                              controller: cubit.fullTankPriceController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return StringManager.thisFieldIsRequired
                                      .tr(context);
                                }
                                if (value == "0" || value == "0.0") {
                                  return StringManager.thisFieldCanNotBeZero
                                      .tr(context);
                                }
                                return null;
                              },
                            ),
                            Center(
                              child: CustomElevatedButton(
                                onTap: () => cubit.validateToAddRate(context),
                                widget: Text(
                                  StringManager.add.tr(context),
                                  style: const TextStyle(fontSize: 12),
                                ),
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
          ),
        ),
      ],
    );
  }
}

// class AddButton extends StatelessWidget {
//   const AddButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//       Container(
//           height: 30.sp,
//           width: 30.sp,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               color: AppColors.primaryColor),
//           child: IconButton(
//               padding: EdgeInsets.zero,
//               icon: const Icon(Icons.add),
//               onPressed: () {
//                 showCustomAlertDialog(
//                     context: context,
//                     title: StringManager.calcFuelAverage.tr(context),
//                     content: BlocProvider(
//                         create: (context) =>
//                             FuelConsumingRateCubit(getIt.get<FuelRatesRepo>()),
//                         child: SingleChildScrollView(child: BlocConsumer<
//                             FuelConsumingRateCubit,
//                             FuelConsumingRateStates>(
//                             listener: (context, state) {
//
//                               if(state is AddRateLoadingState) showDefaultLoadingIndicator(context, cancelable: false);
//                               if(state is AddRateErrorState) {
//                                 Navigator.pop(context);
//                                 showDefaultDialog(context, type: NotificationType.error, description: state.errorMessage, title: StringManager.errorAddingFuelRate.tr(context));
//                               }
//                               if(state is RateAddedState) {
//                                 Navigator.pop(context);
//                                 Navigator.pop(context);
//                                 showToast(message: StringManager.fuelReportAddedSuccessfully.tr(context), state: ToastStates.success);
//                               }
//
//                             },
//                             builder: (context, state) {
//                               var cubit = FuelConsumingRateCubit.get(context);
//                               return Form(
//                                   key: cubit.formKey,
//                                   child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(height: 10.h),
//                                         AddFuelComponent(
//                                             firstText: StringManager
//                                                 .fuelMeterBeforeAddingFuel
//                                                 .tr(context),
//                                             secondText:
//                                             StringManager.kms.tr(context),
//                                             required: false,
//                                             controller1: cubit
//                                                 .odometerController,
//                                             controller2: cubit.kmsController),
//                                         SizedBox(height: 5.h),
//                                         AddFuelComponent(
//                                             firstText:
//                                             StringManager.kmGm.tr(context),
//                                             secondText:
//                                             StringManager.kmLiter.tr(context),
//                                             required: false,
//                                             controller1: cubit.kmGmController,
//                                             controller2: cubit.kmLiterController),
//                                         SizedBox(height: 5.h),
//                                         AddFuelComponent(
//                                             firstText:
//                                             StringManager.liters.tr(context),
//                                             secondText: StringManager.literPrice
//                                                 .tr(context),
//                                             required: false,
//                                             controller1: cubit.litersController,
//                                             controller2:
//                                             cubit.literPriceController),
//                                         SizedBox(height: 5.h),
//                                         SingleAddFuelTextField(
//                                             controller:
//                                             cubit.fullTankPriceController),
//                                         Center(
//                                             child: CustomElevatedButton(
//                                                 onTap: () => cubit
//                                                     .validateToAddRate(context),
//                                                 widget: Text(
//                                                     StringManager.add.tr(context),
//                                                     style: TextStyle(
//                                                         fontSize: 10.sp))))
//                                       ]));
//                             }))));
//               }))
//     ]);
//   }
// }
