// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_cubit.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_state.dart';

class InventoryFilterButton extends StatelessWidget {
  const InventoryFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showCustomAlertDialog(
              context: context,
              title: StringManager.filterBy.tr(context),
              content: BlocProvider.value(
                value: context.read<InventoryCubit>()..getAllProducts(),
                child: BlocBuilder<InventoryCubit, InventoryState>(
                    builder: (context, state) {
                      var cubit = InventoryCubit.get(context);
                      return SizedBox(
                        height: 300.h, // Set a fixed height for the content
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            state is GetProductLoadingState
                                ? const Expanded(child: CustomLoadingIndicator())
                                : (state is GetProductSuccessState &&
                                state.products != null &&
                                state.products!.isNotEmpty)
                                ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: CheckboxListTile(
                                    title: Text(
                                        StringManager.allClasses
                                            .tr(context),
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600)),
                                    controlAffinity:
                                    ListTileControlAffinity.leading,
                                    checkColor: Colors.black,
                                    fillColor: WidgetStateProperty.all(
                                        AppColors.whiteColor),
                                    contentPadding: EdgeInsets.zero,
                                    value: cubit.selectedProducts.isEmpty,
                                    onChanged: (isSelected) {
                                      if (isSelected!) {
                                        cubit.clearSelectedProducts();
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                      const AlwaysScrollableScrollPhysics(), // Enables scrolling
                                      itemBuilder: (context, index) {
                                        final product =
                                        state.products![index];
                                        print(
                                            'Selected Products: ${cubit.selectedProducts}');
                                        print(
                                            "current state ::::::>>>> $state");
                                        print(
                                            'Products: ${state.products}');
                                        return CheckboxListTile(
                                          title: Text(product.name!,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight:
                                                  FontWeight.w600)),
                                          controlAffinity:
                                          ListTileControlAffinity
                                              .leading,
                                          checkColor: Colors.black,
                                          fillColor:
                                          WidgetStateProperty.all(
                                              AppColors.whiteColor),
                                          contentPadding: EdgeInsets.zero,
                                          value: cubit.selectedProducts
                                              .contains(
                                              product.id.toString()),
                                          onChanged: (isSelected) {
                                            if (isSelected!) {
                                              // عند اختيار منتج معين، يتم إلغاء "كل الأصناف" وكل الاختيارات
                                              cubit.deselectAllClasses();
                                              cubit
                                                  .clearSelectedProducts();
                                              cubit
                                                  .toggleProductSelection(
                                                  product.id
                                                      .toString(),
                                                  isSelected);
                                            } else {
                                              cubit
                                                  .toggleProductSelection(
                                                  product.id
                                                      .toString(),
                                                  isSelected);
                                            }
                                            // cubit.toggleProductSelection(
                                            //     product.id.toString(),
                                            //     isSelected!);
                                          },
                                        );
                                      },
                                      separatorBuilder:
                                          (context, index) =>
                                      const SizedBox(height: 0),
                                      itemCount: state.products!.length),
                                )
                              ],
                            )
                                : (state is GetProductSuccessState &&
                                state.products != null &&
                                state.products!.isNotEmpty)
                                ? Center(
                              child: Text(
                                StringManager.youHaveNoProductsYet
                                    .tr(context),
                              ),
                            )
                                : state is GetProductErrorState
                                ? Center(
                              child: Text(
                                state.error,
                                style: Styles.textStyle16,
                              ),
                            )
                                : const SizedBox(width: 10),
                            CustomElevatedButton(
                              onTap: () {
                                // Log the selected products for debugging
                                print(
                                    'Selected Product IDs: ${cubit.selectedProducts}');

                                if (cubit.selectedProducts.isNotEmpty) {
                                  cubit
                                      .getInventoryRecord(
                                      productId:
                                      cubit.selectedProducts.join(','))
                                      .then((_) {
                                    Navigator.pop(context);
                                  });
                                } else {
                                  cubit.getInventoryRecord().then((_) {
                                    Navigator.pop(context);
                                  });
                                }
                              },
                              widget: Text(
                                StringManager.select.tr(context),
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ));
        },
        child: SvgPicture.asset(AppAssets.settingIcon, width: 27.w));
  }
}

