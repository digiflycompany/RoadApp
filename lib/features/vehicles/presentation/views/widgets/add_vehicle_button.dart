import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/app_regex.dart';
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
import '../../../data/models/brands_response.dart';

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
            onComplete: () {
              VehiclesCubit.get(context).clearFields();
            },
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
                    title: StringManager.vehicleAddedSuccessfully.tr(context));
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
                                  child: LottieBuilder.asset(AppAssets.loading,
                                      frameRate: const FrameRate(900))))
                          : Form(
                              key: cubit.addVehicleFormKey,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 10.h),
                                    Column(children: [
                                      VehicleDropdowns(
                                        brands: cubit.brands ?? [],
                                        selectedBrandId: cubit.selectedBrandId,
                                        selectedModelName:
                                            cubit.selectedModelName,
                                        selectedYear: cubit.selectedYear,
                                        onBrandChanged: (brandId) {
                                          cubit.changeSelectedBrand(brandId!);
                                        },
                                        onModelChanged: (modelName) {
                                          cubit.changeSelectedModel(modelName);
                                        },
                                        onYearChanged: (year) {
                                          cubit.changeSelectedYear(year);
                                        },
                                      ),

                                      const SizedBox(
                                        height: 12,
                                      ),

                                      // AddVehicleDropDown(
                                      //   title: StringManager.company.tr(context),
                                      //   items: cubit.brands?.map((brand) {
                                      //     return DropdownMenuItem<String>(
                                      //       value: brand.id, // تأكد أن الـ value هو الـ id
                                      //       child: Text(brand.name ?? ''), // عرض الـ name
                                      //     );
                                      //   }).toList() ?? [],  // إذا كانت القائمة null، اعرض قائمة فارغة
                                      //   onChanged: (String? selectedBrandId) {
                                      //     if (selectedBrandId != null) {
                                      //       cubit.changeSelectedBrand(selectedBrandId);
                                      //     }
                                      //   },
                                      //   hint: cubit.selectedBrand != null
                                      //       ? cubit.brands!
                                      //       .firstWhere((brand) => brand.id == cubit.selectedBrand)
                                      //       .name
                                      //       .toString()
                                      //       : 'Select a brand',
                                      // ),

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
                                      // Spacer(),
                                      //   SingleAddVehicleTextField(
                                      //       title:
                                      //           StringManager.car.tr(context),
                                      //       controller: cubit.carController,
                                      //       keyboardType: TextInputType.name)
                                    ]),

                                    SingleAddVehicleTextField(
                                      hintText: '1234 ABC',
                                      title: StringManager.licensePlateNumber
                                          .tr(context),
                                      controller: cubit.platNumberController,
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (!AppRegex.isPlateNumberValid(
                                            value!)) {
                                          return '6-10 رموز تحتوي على أرقام أو حروف عربية/إنجليزية';
                                        }
                                        return null;
                                      },
                                    ),
                                    // AddVehicleComponent(
                                    //   hintText: 'ABC 123',
                                    //   firstText: StringManager.manufactureYear
                                    //       .tr(context),
                                    //   secondText: StringManager
                                    //       .licensePlateNumber
                                    //       .tr(context),
                                    //   firstController:
                                    //       cubit.manufactureYearController,
                                    //   secondController:
                                    //       cubit.platNumberController,
                                    //   secondKeyboardType: TextInputType.name,
                                    // ),

                                    AddVehicleTwoDropDown(
                                        title: StringManager.transmissionType
                                            .tr(context),
                                        items: cubit.transmissionTypes,
                                        onChanged: (type) {
                                          if (type != null) {
                                            cubit.changeTransmissionType(
                                                type as String);
                                          }
                                        },
                                        hint: cubit.transmissionType ?? ''),

                                    SingleAddVehicleTextField(
                                      hintText: '2000',
                                      title: StringManager.ccsNum.tr(context),
                                      controller: cubit.ccsNumberController,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (!AppRegex.isEngineCapacityValid(
                                            value!)) {
                                          return '500 - 8000 CC';
                                        }
                                        return null;
                                      },
                                    ),
                                    // Row(children: [
                                    //   AddVehicleTwoDropDown(
                                    //       title: StringManager
                                    //           .transmissionType
                                    //           .tr(context),
                                    //       items: cubit.transmissionTypes,
                                    //       onChanged: (type) {
                                    //         if (type != null) {
                                    //           cubit.changeTransmissionType(
                                    //               type as String);
                                    //         }
                                    //       },
                                    //       hint: cubit.transmissionType ?? ''),
                                    //   const Spacer(),
                                    //   SingleAddVehicleTextField(
                                    //       title: StringManager.ccsNum
                                    //           .tr(context),
                                    //       controller:
                                    //           cubit.ccsNumberController,
                                    //       keyboardType: TextInputType.number),
                                    // ]),

                                    SingleAddVehicleTextField(
                                      hintText: '1HGBH41JXMN109186',
                                      title: StringManager.engineNumber
                                          .tr(context),
                                      controller: cubit.enginNumberController,
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (!AppRegex.isEngineNumberValid(
                                            value!)) {
                                          return '10-17 رمزًا يحتوي على حروف وأرقام';
                                        }
                                        return null;
                                      },
                                    ),

                                    SingleAddVehicleTextField(
                                      hintText: '1HGBH41JXMN109186',
                                      title: StringManager.chassisNumber
                                          .tr(context),
                                      controller: cubit.chassisNumberController,
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (!AppRegex.isChassisNumberValid(
                                            value!)) {
                                          return 'يجب أن يكون 17 رمزًا بدون الأحرف I, O, Q';
                                        }
                                        return null;
                                      },
                                    ),
                                    // AddVehicleComponent(
                                    //     firstText: StringManager.engineNumber
                                    //         .tr(context),
                                    //     secondText: StringManager
                                    //         .chassisNumber
                                    //         .tr(context),
                                    //     firstController:
                                    //         cubit.enginNumberController,
                                    //     secondController:
                                    //         cubit.chassisNumberController,
                                    //     firstKeyboardType: TextInputType.name,
                                    //     secondKeyboardType:
                                    //         TextInputType.name),
                                    SingleAddVehicleTextField(
                                        hintText: '100',
                                        title: StringManager.tankCapacity
                                            .tr(context),
                                        controller:
                                            cubit.tankCapacityController),
                                    CustomElevatedButton(
                                        onTap: () =>
                                            cubit.validateToAddVehicle(),
                                        widget: Text(
                                            StringManager.add.tr(context),
                                            style: TextStyle(fontSize: 10.sp)))
                                  ]));
            })),
          );
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

class VehicleDropdowns extends StatelessWidget {
  final List<BrandRes> brands;
  final String? selectedBrandId;
  final String? selectedModelName;
  final int? selectedYear;
  final Function(String?) onBrandChanged;
  final Function(String?) onModelChanged;
  final Function(int?) onYearChanged;

  const VehicleDropdowns({
    super.key,
    required this.brands,
    this.selectedBrandId,
    this.selectedModelName,
    this.selectedYear,
    required this.onBrandChanged,
    required this.onModelChanged,
    required this.onYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selectedBrand = brands.firstWhere(
      (brand) => brand.id == selectedBrandId,
      orElse: () => BrandRes(),
    );

    // هنا بنشيل التكرارات من قائمة الموديلات حسب الاسم
    final allModels = selectedBrand.models ?? [];
    final uniqueModels = {
      for (var model in allModels) model.name: model // بيفضل آخر نسخة من كل اسم
    }.values.toList();

    final selectedModel = uniqueModels.firstWhere(
      (model) => model.name == selectedModelName,
      orElse: () => ModelRes(),
    );

    final years = selectedModel.years ?? [];

    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 1. Brand Dropdown
          Text(
            StringManager.company.tr(context),
            style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          DropdownButton<String>(
            value: brands.any((b) => b.id == selectedBrandId)
                ? selectedBrandId
                : null,
            hint: Text(
              'اختر نوع العربية',
              style: TextStyle(
                color: Colors.black,
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            items: brands.map((brand) {
              return DropdownMenuItem<String>(
                value: brand.id,
                child: Text(brand.name ?? ''),
              );
            }).toList(),
            onChanged: (value) {
              onBrandChanged(value);
              onModelChanged(null); // Reset model when brand changes
              onYearChanged(null); // Reset year when brand changes
            },
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              // 2. Model Dropdown
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringManager.car.tr(context),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  DropdownButton<String>(
                    value: uniqueModels.any((m) => m.name == selectedModelName)
                        ? selectedModelName
                        : null,
                    hint: Text(
                      'اختر الموديل',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    items: uniqueModels.map((model) {
                      return DropdownMenuItem<String>(
                        value: model.name,
                        child: Text(model.name ?? ''),
                      );
                    }).toList(),
                    onChanged: selectedBrandId != null
                        ? (value) {
                            onModelChanged(value);
                            onYearChanged(
                                null); // Reset year when model changes
                          }
                        : null,
                  ),
                ],
              ),

              const Spacer(),

              // 3. Year Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringManager.manufactureYear.tr(context),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  DropdownButton<int>(
                    value: years.contains(selectedYear) ? selectedYear : null,
                    hint: Text(
                      'اختر سنة الصنع',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    items: years.map((year) {
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text(year.toString()),
                      );
                    }).toList(),
                    onChanged: selectedModelName != null ? onYearChanged : null,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
