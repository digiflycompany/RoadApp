import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/share_button.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_cubit.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_state.dart';
import 'package:roadapp/features/general_inventory/presentation/views/widgets/share_pdf_and_excel_general_stock_widget.dart';

class ProcessDate extends StatelessWidget {
  const ProcessDate({super.key, this.filterButton});

  final Widget? filterButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (context, state) {
        var cubit = InventoryCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              StringManager.processDate.tr(context),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),

            // Date Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // "From" Label
                  Text(
                    '${StringManager.from.tr(context)}: ',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(width: 5.w),

                  // Start Date
                  DateWidget(
                    title:
                        "${cubit.startDateTime.year} / ${cubit.startDateTime.month} / ${cubit.startDateTime.day}",
                    onTap: () => cubit.pickStartDate(context),
                  ),
                  SizedBox(width: 10.w),

                  // "To" Label
                  Text(
                    '${StringManager.to.tr(context)}: ',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(width: 5.w),

                  // End Date
                  DateWidget(
                    title:
                        "${cubit.endDateTime.year} / ${cubit.endDateTime.month} / ${cubit.endDateTime.day}",
                    onTap: () => cubit.pickEndDate(context),
                  ),

                  // Spacer to push buttons to the end
                  //const Spacer(),

                  SizedBox(width: 8.w),
                  // // Share Button
                  // const ShareButton(),

                  state is GetShareGeneralStockLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : ShareButton(
                    onTap: () async {
                      await cubit.getShareGeneralStock();
                      showCustomAlertDialog(
                        // ignore: use_build_context_synchronously
                        context: context,
                        // ignore: use_build_context_synchronously
                        title: StringManager.share.tr(context),
                        content:
                        SharePdfAndExcelGeneralStockWidget(cubit: cubit),
                      );
                    },
                  ),

                  // Filter Button (if provided)
                  if (filterButton != null) ...[const Gap(10), filterButton!],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    this.onTap,
    required this.title,
  });

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 90.w,
      height: 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: const Color(0xFFF9F9F9),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFAAAAAA),
            ),
          ),
        ),
      ),
    );
  }
}
