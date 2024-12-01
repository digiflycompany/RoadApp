import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/name_product_id_drop_down.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_component.dart';
import 'name_product_drop_down.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BusinessModelsCubit.get(context);
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: GestureDetector(
        onTap: () {
          cubit.clearControllers();
          showCustomAlertDialog(
            context: context,
            title: StringManager.addVehicle.tr(context),
            content: BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
              builder: (context, state) {
                return Form(
                  key: cubit.dialogFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10.h),
                      // AddVehicleComponent(
                      //     firstText: StringManager.itemName.tr(context),
                      //     secondText: StringManager.quantity.tr(context),
                      //     firstController: cubit.itemNameController,
                      //     secondController: cubit.quantityController,
                      // ),

                      state is GetProductLoading
                          ? const Center(child: CircularProgressIndicator())
                          : cubit.selectedRadio == 1
                          ? NameProductDropDown(
                              label: StringManager.itemName.tr(context),
                              hint: StringManager.itemName.tr(context),
                            )
                          :NameProductIdDropDown(
                                  label: StringManager.itemName.tr(context),
                                  hint: StringManager.itemName.tr(context),
                                ),

                      SizedBox(height: 10.h),

                      // AddVehicleComponent(
                      //     firstText: StringManager.unit.tr(context),
                      //     secondText: StringManager.quantity.tr(context),
                      //     firstController: cubit.unitController,
                      //     secondController: cubit.quantityController),
                      AddVehicleComponent(
                          firstText: StringManager.quantity.tr(context),
                          secondText: StringManager.price.tr(context),
                          firstController: cubit.quantityController,
                          secondController: cubit.priceController),
                      SizedBox(height: 10.h),

                      Center(
                        child: CustomElevatedButton(
                            onTap: () {
                              if (cubit.selectedNameProduct == null) {
                                showToast(
                                    message: 'Enter Name Product',
                                    state: ToastStates.error);
                              } else {
                                return cubit.addProduct(context);
                              }
                            },
                            widget: Text(StringManager.add.tr(context),
                                style: TextStyle(fontSize: 10.sp))),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
        child: Container(
          width: 85.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.addIcon, width: 12.w),
              SizedBox(width: 5.w),
              Text(StringManager.addProduct.tr(context),
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
