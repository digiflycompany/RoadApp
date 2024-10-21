import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/vehicles/presentation/widgets/add_vehicle_component.dart';

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
                  content:
                      BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
                          builder: (context, state) {
                    return Form(
                        key: cubit.dialogFormKey,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(height: 10.h),
                          AddVehicleComponent(
                              firstText: StringManager.itemCode.tr(context),
                              secondText: StringManager.itemName.tr(context),
                              firstController: cubit.itemCodeController,
                              secondController: cubit.itemNameController),
                          AddVehicleComponent(
                              firstText: StringManager.unit.tr(context),
                              secondText: StringManager.quantity.tr(context),
                              firstController: cubit.unitController,
                              secondController: cubit.quantityController),
                          AddVehicleComponent(
                              firstText: StringManager.price.tr(context),
                              secondText: StringManager.value.tr(context),
                              firstController: cubit.priceController,
                              secondController: cubit.valueController),
                          CustomElevatedButton(
                              onTap: () => cubit.addProduct(context),
                              widget: Text(StringManager.add.tr(context),
                                  style: TextStyle(fontSize: 10.sp)))
                        ]));
                  }));
            },
            child: Container(
                width: 85.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(AppAssets.addIcon, width: 12.w),
                  SizedBox(width: 5.w),
                  Text(StringManager.addProduct.tr(context),
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w600))
                ]))));
  }
}