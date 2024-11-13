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

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
          height: 30.sp,
          width: 30.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.primaryColor),
          child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add),
              onPressed: () {
                showCustomAlertDialog(
                    context: context,
                    title: StringManager.calcFuelAverage.tr(context),
                    content: BlocProvider(
                        create: (context) =>
                            FuelConsumingRateCubit(getIt.get<FuelRatesRepo>()),
                        child: SingleChildScrollView(child: BlocConsumer<
                            FuelConsumingRateCubit,
                            FuelConsumingRateStates>(
                            listener: (context, state) {
                              if(state is AddRateLoadingState) showDefaultLoadingIndicator(context, cancelable: false);
                              if(state is AddRateErrorState) {
                                Navigator.pop(context);
                                showDefaultDialog(context, type: NotificationType.error, description: state.errorMessage, title: StringManager.errorAddingFuelRate.tr(context));
                              }
                              if(state is RateAddedState) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                showToast(message: StringManager.fuelReportAddedSuccessfully.tr(context), state: ToastStates.success);
                              }
                            },
                            builder: (context, state) {
                              var cubit = FuelConsumingRateCubit.get(context);
                              return Form(
                                  key: cubit.formKey,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.h),
                                        AddFuelComponent(
                                            firstText: StringManager
                                                .fuelMeterBeforeAddingFuel
                                                .tr(context),
                                            secondText:
                                            StringManager.kms.tr(context),
                                            required: false,
                                            controller1: cubit
                                                .fuelMeterBeforeAddingFuelController,
                                            controller2: cubit.odometerController),
                                        SizedBox(height: 5.h),
                                        AddFuelComponent(
                                            firstText:
                                            StringManager.kmLE.tr(context),
                                            secondText:
                                            StringManager.kmLiter.tr(context),
                                            required: false,
                                            controller1: cubit.kmGmController,
                                            controller2: cubit.kmLiterController),
                                        SizedBox(height: 5.h),
                                        AddFuelComponent(
                                            firstText:
                                            StringManager.liters.tr(context),
                                            secondText: StringManager.literPrice
                                                .tr(context),
                                            required: false,
                                            controller1: cubit.litersController,
                                            controller2:
                                            cubit.literPriceController),
                                        SizedBox(height: 5.h),
                                        SingleAddFuelTextField(
                                            controller:
                                            cubit.fullTankPriceController),
                                        Center(
                                            child: CustomElevatedButton(
                                                onTap: () => cubit
                                                    .validateToAddRate(context),
                                                widget: Text(
                                                    StringManager.add.tr(context),
                                                    style: TextStyle(
                                                        fontSize: 10.sp))))
                                      ]));
                            }))));
              }))
    ]);
  }
}