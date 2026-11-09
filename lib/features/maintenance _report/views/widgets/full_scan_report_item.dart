import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/list_reports_model.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/merged_report.dart';

enum _Level { good, warning, bad }

/// عدّل هنا لو معاني القيم مختلفة
_Level _levelOf(int? v) {
  if (v == 3) return _Level.bad;
  if (v == 2) return _Level.warning;
  return _Level.good;
}

Color _levelColor(_Level l) {
  switch (l) {
    case _Level.good:
      return Colors.green;
    case _Level.warning:
      return Colors.orange;
    case _Level.bad:
      return Colors.red;
  }
}

class _SectionData {
  _SectionData(this.title, List<int?> values)
      : levels = values.whereType<int>().map(_levelOf).toList();

  final String title;
  final List<_Level> levels;

  bool get isEmpty => levels.isEmpty;

  /// أسوأ حالة في القسم
  _Level get worst {
    if (levels.contains(_Level.bad)) return _Level.bad;
    if (levels.contains(_Level.warning)) return _Level.warning;
    return _Level.good;
  }
}

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

  List<_SectionData> _sections(BuildContext context) {
    final c = report.reportContent;
    if (c == null) return [];
    final o = c.outerStructure;
    final ch = c.chassisAndFrame;
    final e = c.engineAndTransmission;
    final s = c.steeringSystem;
    final el = c.electricalGroup;
    final ac = c.airConditioningSystem;
    final b = c.brakesAndSafety;

    return [
      if (o != null)
        _SectionData(StringManager.outerStructure.tr(context), [
          o.carExteriorParts, o.interiorCondition, o.frontAndRearGlass,
          o.roof, o.windows, o.inch,
        ]),
      if (ch != null)
        _SectionData(StringManager.chassisAndFrame.tr(context), [
          ch.fourChassis, ch.frontFrame, ch.roofStructure,
          ch.rearFrame, ch.frontFacade, ch.rearFacade,
        ]),
      if (e != null)
        _SectionData(StringManager.engineAndTransmission.tr(context), [
          e.electronicallyExamineAllSystems, e.examineMainBattery,
          e.electricalEngineAndItsParts, e.electricalConverter,
          e.rechargeSystems, e.coolingSystems,
        ]),
      if (s != null)
        _SectionData(StringManager.steeringSystem.tr(context), [
          s.frontPines, s.rearPines, s.steeringGroupAndItsParts,
          s.frontAndRearAxes, s.wheelHub, s.engineAndTransmissionMounts,
        ]),
      if (el != null)
        _SectionData(StringManager.electricalGroup.tr(context), [
          el.frontLightingSystems, el.rearLightingSystems,
          el.roadsideAssistanceSystems, el.batteryAndChargingSystem,
          el.accessoriesAndFittings,
        ]),
      if (ac != null)
        _SectionData(StringManager.airConditioningSystem.tr(context), [
          ac.airConditioningAndCompressorSystem, ac.heatingSystem,
          ac.engineAndFansCooling, ac.fluidSmuggling,
        ]),
      if (b != null)
        _SectionData(StringManager.brakesAndSafety.tr(context), [
          b.airBags, b.tires, b.brakesAndTheirParts,
          b.seatBelts, b.antiSlipSystems,
        ]),
    ].where((e) => !e.isEmpty).toList();
  }

  @override
  Widget build(BuildContext context) {
    final notes = report.reportContent?.notesSection?.notes?.trim();
    final price = double.tryParse(report.scanPrice ?? '') ?? report.price;
    final sections = _sections(context);

    final all = sections.expand((s) => s.levels).toList();
    final good = all.where((l) => l == _Level.good).length;
    final warn = all.where((l) => l == _Level.warning).length;
    final bad = all.where((l) => l == _Level.bad).length;

    return Card(
      elevation: .5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(color: AppColors.primaryColor, width: 4),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الهيدر: الشارة + التاريخ
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

              // البيانات الأساسية
              if (report.vehicleNumber != null &&
                  report.vehicleNumber!.isNotEmpty)
                _InfoRow(
                  label: StringManager.vehicleNumber.tr(context),
                  value: report.vehicleNumber!,
                ),
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

              // ملخص الحالة العام
              if (all.isNotEmpty) ...[
                const Gap(10),
                Row(
                  children: [
                    _CountChip(count: good, level: _Level.good,
                        label: StringManager.levelGood.tr(context)),
                    const Gap(6),
                    _CountChip(count: warn, level: _Level.warning,
                        label: StringManager.levelWarning.tr(context)),
                    const Gap(6),
                    _CountChip(count: bad, level: _Level.bad,
                        label: StringManager.levelBad.tr(context)),
                  ],
                ),
              ],

              // حالة كل قسم
              if (sections.isNotEmpty) ...[
                const Gap(8),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: sections
                      .map((s) => _SectionChip(title: s.title, level: s.worst))
                      .toList(),
                ),
              ],

              // الملاحظات
              if (notes != null && notes.isNotEmpty) ...[
                const Gap(8),
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

class _CountChip extends StatelessWidget {
  const _CountChip(
      {required this.count, required this.level, required this.label});

  final int count;
  final _Level level;
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = _levelColor(level);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        "$count $label",
        style: Styles.textStyle12.copyWith(fontSize: 10, color: color),
      ),
    );
  }
}

class _SectionChip extends StatelessWidget {
  const _SectionChip({required this.title, required this.level});

  final String title;
  final _Level level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: _levelColor(level),
            shape: BoxShape.circle,
          ),
        ),
        const Gap(4),
        Text(title, style: Styles.textStyle12.copyWith(fontSize: 10)),
        const Gap(4),
      ],
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
          Text("$label  ", style: Styles.textStyle12.copyWith(fontSize: 10)),
          Expanded(
            child: Text(value,
                style: Styles.textStyle12.copyWith(fontSize: 10)),
          ),
        ],
      ),
    );
  }
}