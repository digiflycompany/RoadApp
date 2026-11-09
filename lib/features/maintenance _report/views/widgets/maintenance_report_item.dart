import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/list_reports_model.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/merged_report.dart';

class MaintenanceReportItem extends StatelessWidget {
  const MaintenanceReportItem({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.date,
    required this.services,
    required this.products,
    required this.totalPrice,
    required this.verified,
  });

  final String? name;
  final String? phoneNumber;
  final String? date;
  final List<Service> services;
  final List<Product> products;
  final String? totalPrice;
  final bool? verified;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                StringManager.regularReport.tr(context),
                style: Styles.textStyle12.copyWith(fontSize: 10),
              ),
            ),
            const Gap(8),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.27),
                borderRadius: BorderRadius.circular(4.r),
              ),
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 24),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 5,
                children: [
                  if (verified == true)
                    Text(
                      "${StringManager.serviceCenter.tr(context)} $name",
                      style: Styles.textStyle12.copyWith(fontSize: 10),
                    ),
                  if (verified == true)
                    Text(
                      '${StringManager.phoneNumber.tr(context)} $phoneNumber',
                      style: Styles.textStyle12.copyWith(fontSize: 10),
                    ),
                  Text(
                    "${StringManager.date.tr(context)} $date",
                    style: Styles.textStyle12.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  if (name != null)
                    Text(
                      "${StringManager.maintenanceCenters.tr(context)}: $name",
                      style: Styles.textStyle12.copyWith(fontSize: 10),
                    ),
                  if (phoneNumber != null)
                    Text(
                      "${StringManager.phoneNumber.tr(context)}: $phoneNumber",
                      style: Styles.textStyle12.copyWith(fontSize: 10),
                    ),
                  for (final s in services)
                    _LineRow(
                      label:
                      "${StringManager.serviceType.tr(context)}  ${s.name ?? '-'}${_qty(s.quantity)}",
                      price: "${StringManager.price.tr(context)} ${formatAmount(s.price)}",
                    ),
                  for (final p in products)
                    _LineRow(
                      label:
                      "${StringManager.productType.tr(context)}  ${p.name ?? '-'}${_qty(p.quantity)}",
                      price: "${StringManager.price.tr(context)} ${formatAmount(p.price)}",
                    ),
                ],
              ),
            ),
            const Divider(thickness: .08, color: AppColors.black, height: .1),
            const Gap(10),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 15),
              child: Text(
                '${StringManager.total.tr(context)} ${totalPrice ?? '-'}',
                style: Styles.textStyle12.copyWith(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _qty(int? quantity) =>
      (quantity != null && quantity > 1) ? '  ×$quantity' : '';
}

class _LineRow extends StatelessWidget {
  const _LineRow({required this.label, required this.price});

  final String label;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: Styles.textStyle12.copyWith(fontSize: 10),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            price,
            style: Styles.textStyle12.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}