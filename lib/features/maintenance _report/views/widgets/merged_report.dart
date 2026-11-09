import 'package:roadapp/features/maintenance%20_report/data/models/list_reports_model.dart';

enum ReportKind { regular, fullScan }

/// فلتر العرض في الشاشة.
enum ReportFilter { all, regular, fullScan }

/// Wrapper بيجمع النوعين في قائمة واحدة بدون ما نغيّر الـ `Report` model الأصلي.
/// النوع بيتحدد من الـ endpoint اللي جِه منه التقرير، مش من تخمين الحقول.
class MergedReport {
  const MergedReport(this.report, this.kind);

  final Report report;
  final ReportKind kind;

  bool get isFullScan => kind == ReportKind.fullScan;

  /// المفتاح المستخدم في الدمج والترتيب.
  /// الـ backend بيرتّب بـ createdAt تنازلي، فلازم نستخدم نفس الحقل
  /// عشان منطق الـ pagination المدموج يفضل صح.
  DateTime get sortDate =>
      report.createdAt ??
          (isFullScan
              ? (report.scanDate ?? report.date)
              : (report.date ?? report.scanDate)) ??
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

  /// التاريخ اللي بيظهر للمستخدم في الكارت.
  DateTime? get displayDate => isFullScan
      ? (report.scanDate ?? report.date ?? report.createdAt)
      : (report.date ?? report.createdAt);

  double? get totalPrice => isFullScan
      ? (double.tryParse(report.scanPrice ?? '') ?? report.price)
      : report.price;
}

/// 345.0 -> "345" , 12.5 -> "12.50" , null -> "-"
String formatAmount(num? value) {
  if (value == null) return '-';
  return value == value.roundToDouble()
      ? value.toInt().toString()
      : value.toStringAsFixed(2);
}