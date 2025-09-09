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
        final cubit = context.read<InventoryCubit>();
        cubit.getAllProducts(); // ✅ fetch once when opening

        showCustomAlertDialog(
          context: context,
          title: StringManager.filterBy.tr(context),
          content: BlocProvider.value(
            value: cubit,
            child: const _InventoryFilterDialogContent(),
          ),
        );
      },
      child: SvgPicture.asset(AppAssets.settingIcon, width: 27.w),
    );
  }
}

class _InventoryFilterDialogContent extends StatelessWidget {
  const _InventoryFilterDialogContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (context, state) {
        var cubit = InventoryCubit.get(context);

        Widget body;

        if (state is GetProductLoadingState) {
          body = const CustomLoadingIndicator();
        } else if (state is GetProductErrorState) {
          body = Center(
            child: Text(
              state.error,
              style: Styles.textStyle16,
            ),
          );
        } else if (cubit.productList != null &&
            cubit.productList!.isNotEmpty) {
          body = ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 400.h),
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                // ✅ "All Classes" checkbox
                CheckboxListTile(
                  title: Text(
                    StringManager.allClasses.tr(context),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.black,
                  fillColor:
                      WidgetStateProperty.all(AppColors.whiteColor),
                  contentPadding: EdgeInsets.zero,
                  value: cubit.selectedProducts.isEmpty,
                  onChanged: (isSelected) {
                    if (isSelected!) {
                      cubit.clearSelectedProducts();
                    }
                  },
                ),

                // ✅ product list
                ...cubit.productList!.map((product) {
                  return CheckboxListTile(
                    title: Text(
                      product.name ?? '',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    checkColor: Colors.black,
                    fillColor:
                        WidgetStateProperty.all(AppColors.whiteColor),
                    contentPadding: EdgeInsets.zero,
                    value: cubit.selectedProducts
                        .contains(product.id.toString()),
                    onChanged: (isSelected) {
                      if (isSelected!) {
                        cubit.deselectAllClasses();
                        cubit.clearSelectedProducts();
                        cubit.toggleProductSelection(
                          product.id.toString(),
                          true,
                        );
                      } else {
                        cubit.toggleProductSelection(
                          product.id.toString(),
                          false,
                        );
                      }
                    },
                  );
                }),
              ],
            ),
          );
        } else {
          // ✅ only if we really have no products at all
          body = Center(
            child: Text(
              StringManager.youHaveNoProductsYet.tr(context),
            ),
          );
        }

        return SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              body,
              const SizedBox(height: 12),
              CustomElevatedButton(
                onTap: () {
                  if (cubit.selectedProducts.isNotEmpty) {
                    cubit
                        .getInventoryRecord(
                          productId: cubit.selectedProducts.join(','),
                        )
                        .then((_) => Navigator.pop(context));
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
      },
    );
  }
}
