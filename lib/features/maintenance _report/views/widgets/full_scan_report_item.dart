import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/list_reports_model.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/merged_report.dart';

/// كارت تقرير الفحص الشامل. شكله مختلف عن تقرير الصيانة العادي
/// (شريط ملوّن على الجنب + شارة "Full scan") عشان المستخدم يفرّق بينهم بسرعة.
///
/// لو عندك شاشة تفاصيل لتقرير الفحص الشامل (في feature الـ work_reports)
/// مرّر `onTap` وهيظهر سهم صغير والكارت يبقى قابل للضغط.
class FullScanReportItem extends StatelessWidget {
  const FullScanReportItem({
    super.key,
    required this.report,
    required this.date,
    this.onTap,
  });

  final Report report;
  final String date;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final notes = report.reportContent?.notesSection?.notes?.trim();
    final price = double.tryParse(report.scanPrice ?? '') ?? report.price;

    return Card(
      elevation: .5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(color: AppColors.primaryColor, width: 4),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.27),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      StringManager.fullScanReport.tr(context),
                      style: Styles.textStyle12.copyWith(fontSize: 10),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${StringManager.date.tr(context)} $date",
                    style: Styles.textStyle12.copyWith(fontSize: 10),
                  ),
                ],
              ),
              const Gap(10),
              if (report.scanType != null && report.scanType!.isNotEmpty)
                _InfoRow(
                  label: StringManager.scanType.tr(context),
                  value: report.scanType!,
                ),
              if (price != null)
                _InfoRow(
                  label: StringManager.price.tr(context),
                  value: formatAmount(price),
                ),
              if (notes != null && notes.isNotEmpty) ...[
                const Gap(6),
                Text(
                  "${StringManager.notes.tr(context)}: $notes",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle12.copyWith(fontSize: 10),
                ),
              ],
              if (onTap != null)
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(Icons.chevron_right, size: 18.sp),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label  ",
            style: Styles.textStyle12.copyWith(fontSize: 10),
          ),
          Expanded(
            child: Text(
              value,
              style: Styles.textStyle12.copyWith(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
