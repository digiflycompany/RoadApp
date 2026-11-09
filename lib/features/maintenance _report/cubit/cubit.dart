import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/report_request.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/merged_report.dart';
import 'package:share_plus/share_plus.dart';
import '../data/models/list_reports_model.dart';
import '../data/repo/report_repo.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

/// حالة كل مصدر (regular / fullScan) لوحده: اللي اتحمّل منه + رقم آخر صفحة + فيه كمان ولا لأ.
class _ReportsSource {
  _ReportsSource(this.kind);

  final ReportKind kind;
  final List<MergedReport> items = [];
  final Set<String> _ids = {};
  int page = 0;
  bool hasMore = true;

  void reset() {
    items.clear();
    _ids.clear();
    page = 0;
    hasMore = true;
  }

  void addPage(
      List<MergedReport> fetched, {
        required int page,
        required int pageSize,
      }) {
    for (final item in fetched) {
      final id = item.report.id;
      if (id != null && !_ids.add(id)) continue; // تجاهل التكرار
      items.add(item);
    }
    this.page = page;
    // لو الصفحة رجعت أقل من الحجم المطلوب يبقى مفيش بعدها حاجة.
    hasMore = fetched.length >= pageSize;
  }

  /// أقدم تقرير اتحمّل من المصدر ده.
  DateTime? get oldestLoaded {
    if (items.isEmpty) return null;
    return items
        .map((e) => e.sortDate)
        .reduce((a, b) => a.isBefore(b) ? a : b);
  }
}

class MaintenanceReportCubit extends Cubit<MaintenanceReportStates> {
  MaintenanceReportCubit(
      this._reportRepo, {
        required this.vehicleId,
        required this.vehicleNumber,
      }) : super(InitialMaintenanceReportState());

  final ReportRepo _reportRepo;

  /// بيُستخدم مع endpoint التقارير العادية.
  final String vehicleId;

  /// بيُستخدم مع endpoint الفحص الشامل.
  final String vehicleNumber;

  static MaintenanceReportCubit get(context) => BlocProvider.of(context);

  final TextEditingController serviceName = TextEditingController();
  final TextEditingController servicePrice = TextEditingController();
  final TextEditingController productName = TextEditingController();
  final TextEditingController productPrice = TextEditingController();
  final TextEditingController mcName = TextEditingController();
  final TextEditingController phoneMc = TextEditingController();

  final reportFormKey = GlobalKey<FormState>();

  bool checkBoxDate = false;
  bool checkBoxService = false;
  bool checkBoxPrice = false;
  bool checkBoxCenter = false;
  bool checkBoxProduct = false;
  bool selectPrice = false;

  bool jan = false;
  bool feb = false;
  bool mar = false;
  bool apr = false;
  bool may = false;
  bool jun = false;
  bool jul = false;
  bool aug = false;
  bool sep = false;
  bool oct = false;
  bool nov = false;
  bool dec = false;

  bool excel = true;
  bool pdf = false;

  setExcel() {
    if (excel) {
      return;
    } else {
      excel = true;
      pdf = false;
      emit(ExcelChosenState());
    }
  }

  setPDF() {
    if (pdf) {
      return;
    } else {
      pdf = true;
      excel = false;
      emit(PDFChosenState());
    }
  }

  togglePrice() {
    selectPrice = !selectPrice;
    emit(PriceToggledState());
  }

  toggleFilterCheck(String boxTitle, BuildContext context) {
    boxTitle == StringManager.date.tr(context)
        ? checkBoxDate = !checkBoxDate
        : boxTitle == StringManager.service.tr(context)
        ? checkBoxService = !checkBoxService
        : boxTitle == StringManager.price.tr(context)
        ? checkBoxPrice = !checkBoxPrice
        : boxTitle == StringManager.center.tr(context)
        ? checkBoxCenter = !checkBoxCenter
        : boxTitle == StringManager.product.tr(context)
        ? checkBoxProduct = !checkBoxProduct
        : null;
    emit(FilterToggledState());
  }

  // ───────────────────────── Date range ─────────────────────────

  DateTime startDateTime = DateTime.now().subtract(const Duration(days: 365));
  DateTime endDateTime = DateTime.now();

  void pickStartDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: startDateTime,
      firstDate: DateTime(2024),
      lastDate: DateTime(2050),
      builder: (_, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 12.sp)),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value == null || isClosed) return;
      startDateTime = DateTime(value.year, value.month, value.day);
      // لو البداية بعد النهاية نخلي النهاية = البداية بدل ما القائمة تفضى.
      if (startDateTime.isAfter(endDateTime)) endDateTime = startDateTime;
      emit(StartDateState());
      getReports();
    });
  }

  void pickEndDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: endDateTime,
      firstDate: DateTime(2024),
      lastDate: DateTime(2050),
      builder: (_, child) {
        return Theme(
          data: Theme.of(context),
          child: child!,
        );
      },
    ).then((value) {
      if (value == null || isClosed) return;
      endDateTime = DateTime(value.year, value.month, value.day);
      if (endDateTime.isBefore(startDateTime)) startDateTime = endDateTime;
      emit(EndDateState());
      getReports();
    });
  }

  String extractDate(String dateTime) {
    final date = DateTime.parse(dateTime);
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // ─────────────────── Reports (regular + full scan) ───────────────────

  String? selectedServiceType;

  final int limit = 10;

  final _ReportsSource _regular = _ReportsSource(ReportKind.regular);
  final _ReportsSource _fullScan = _ReportsSource(ReportKind.fullScan);

  /// القائمة المدموجة اللي بتتعرض في الشاشة (بعد الفلتر، مرتبة من الأحدث للأقدم).
  List<MergedReport> reports = [];

  /// نفس القائمة قبل الفلتر (بتتستخدم للعدّادات).
  List<MergedReport> _visibleAll = [];

  ReportFilter filter = ReportFilter.all;

  int countOf(ReportKind kind) =>
      _visibleAll.where((r) => r.kind == kind).length;

  int get totalCount => _visibleAll.length;

  void setFilter(ReportFilter value) {
    if (filter == value) return;
    filter = value;
    reports = _applyFilter(_visibleAll);
    _emitSafe(FilterToggledState());
  }

  List<MergedReport> _applyFilter(List<MergedReport> list) {
    switch (filter) {
      case ReportFilter.all:
        return list;
      case ReportFilter.regular:
        return list.where((r) => !r.isFullScan).toList();
      case ReportFilter.fullScan:
        return list.where((r) => r.isFullScan).toList();
    }
  }

  /// أول تحميل / إعادة تحميل (بعد تغيير التاريخ أو إضافة تقرير).
  bool isLoading = false;

  /// الاتنين فشلوا في التحميل الأول.
  bool refreshFailed = false;

  /// واحد بس من الاتنين فشل → بنعرض اللي وصل مع تنبيه + Retry.
  bool partialError = false;

  bool isLoadingMore = false;
  bool loadMoreFailed = false;

  /// بيزيد مع كل refresh؛ أي رد متأخر من refresh قديم بيتتجاهل.
  int _requestId = 0;

  bool get hasMore => _regular.hasMore || _fullScan.hasMore;

  void _emitSafe(MaintenanceReportStates newState) {
    if (!isClosed) emit(newState);
  }

  Future<void> getReports() async {
    final requestId = ++_requestId;

    _regular.reset();
    _fullScan.reset();
    reports = [];
    _visibleAll = [];
    isLoading = true;
    refreshFailed = false;
    partialError = false;
    isLoadingMore = false;
    loadMoreFailed = false;
    _emitSafe(GetReportsLoadingState());

    final results = await Future.wait([
      _fetchNextPage(_regular, requestId),
      _fetchNextPage(_fullScan, requestId),
    ]);

    if (isClosed || requestId != _requestId) return; // رد قديم

    final regularOk = results[0];
    final fullScanOk = results[1];
    isLoading = false;

    if (!regularOk && !fullScanOk) {
      refreshFailed = true;
      _emitSafe(GetReportsErrorState());
      return;
    }

    // المصدر اللي فشل ما لازم يعطّل دمج المصدر التاني.
    if (!regularOk) {
      _regular.hasMore = false;
      partialError = true;
    }
    if (!fullScanOk) {
      _fullScan.hasMore = false;
      partialError = true;
    }

    _rebuildVisible();
    _emitSafe(GetReportsSuccessState());
  }

  /// تحميل صفحة إضافية (Infinite scroll).
  Future<void> loadMoreReports() async {
    if (isLoading || isLoadingMore || loadMoreFailed || !hasMore) return;

    final requestId = _requestId;
    isLoadingMore = true;
    _emitSafe(ReportsLoadingMoreState());

    // ممكن صفحة واحدة ما تزودش حاجة ظاهرة (مثلاً كلها أقدم من الحد)،
    // فبنكرر لحد 4 مرات لحد ما القائمة تكبر.
    var attempts = 0;
    while (hasMore && attempts < 4) {
      attempts++;
      final source = _nextSourceToFetch();
      if (source == null) break;

      final before = reports.length;
      final ok = await _fetchNextPage(source, requestId);
      if (isClosed || requestId != _requestId) return;

      if (!ok) {
        loadMoreFailed = true;
        isLoadingMore = false;
        _emitSafe(ReportsErrorMoreState());
        return;
      }

      _rebuildVisible();
      if (reports.length > before) break;
    }

    isLoadingMore = false;
    _emitSafe(ReportsSuccessMoreState());
  }

  void retryLoadMore() {
    loadMoreFailed = false;
    loadMoreReports();
  }

  /// بيجيب الصفحة اللي بعد كده من مصدر واحد. بيرجع true لو نجح.
  /// لو الرد قديم (refresh حصل في النص) بيرجع false من غير ما يلمس الحالة،
  /// والـ caller لازم يتأكد من requestId قبل ما يفسّر النتيجة.
  Future<bool> _fetchNextPage(_ReportsSource source, int requestId) async {
    final nextPage = source.page + 1;
    final startDate = extractDate(startDateTime.toString());
    final endDate = extractDate(endDateTime.toString());

    final ApiResult<ReportResponse> result = source.kind == ReportKind.regular
        ? await _reportRepo.getRegularReports(
      vehicleId: vehicleId,
      startDate: startDate,
      endDate: endDate,
      page: nextPage,
      limit: limit,
    )
        : await _reportRepo.getFullScanReports(
      vehicleNumber: vehicleNumber,
      startDate: startDate,
      endDate: endDate,
      page: nextPage,
      limit: limit,
    );

    if (requestId != _requestId) return false;

    var success = false;
    result.when(success: (response) {
      final fetched = (response.data?.reports ?? const <Report>[])
          .map((r) => MergedReport(r, source.kind))
          .toList();
      debugPrint('[${source.kind.name}] page=$nextPage fetched=${fetched.length}');
      source.addPage(
        fetched,
        page: nextPage,
        pageSize: response.data?.options?.limit ?? limit,
      );
      success = true;
    }, failure: (error) {
      debugPrint('[${source.kind.name}] ${error.apiErrorModel.message}');
      debugPrint(error.apiErrorModel.errorCode.toString());
    });
    return success;
  }

  /// أنهي مصدر نحمّل منه بعد كده؟
  /// المصدر اللي أقدم تقرير حمّلناه منه هو الأحدث بين المصادر اللي لسه فيها
  /// صفحات هو "عنق الزجاجة" — لحد ما نحمّل منه مش هنقدر نعرض حاجة أقدم بأمان.
  _ReportsSource? _nextSourceToFetch() {
    _ReportsSource? best;
    for (final source in [_regular, _fullScan]) {
      if (!source.hasMore) continue;
      final oldest = source.oldestLoaded;
      final bestOldest = best?.oldestLoaded;
      if (best == null ||
          (oldest != null &&
              (bestOldest == null || oldest.isAfter(bestOldest)))) {
        best = source;
      }
    }
    return best;
  }

  /// بيدمج المصدرين ويرتّب بالأحدث، ويعرض بس اللي نقدر نضمن ترتيبه.
  ///
  /// لو مصدر لسه عنده صفحات، ممكن يكون فيه تقارير أقدم من آخر واحد حمّلناه،
  /// فأي تقرير أقدم من "أحدث أقدم-تقرير" بين المصادر دي بنخبّيه لحد ما
  /// نحمّل صفحة تانية. كده الترتيب عمره ما بيتلخبط بين الصفحات.
  void _rebuildVisible() {
    final all = [..._regular.items, ..._fullScan.items]
      ..sort((a, b) => b.sortDate.compareTo(a.sortDate));

    DateTime? threshold;
    for (final source in [_regular, _fullScan]) {
      final oldest = source.oldestLoaded;
      if (!source.hasMore || oldest == null) continue;
      if (threshold == null || oldest.isAfter(threshold)) threshold = oldest;
    }

    final limitDate = threshold;
    _visibleAll = limitDate == null
        ? all
        : all.where((r) => !r.sortDate.isBefore(limitDate)).toList();
    reports = _applyFilter(_visibleAll);
    debugPrint('[reports] regular=${_regular.items.length}(more:${_regular.hasMore}) '
        'fullScan=${_fullScan.items.length}(more:${_fullScan.hasMore}) '
        'visible=${_visibleAll.length}');
  }

  // ───────────────────────── Add report ─────────────────────────

  Future<void> postReports(BuildContext context) async {
    emit(PostRequestLoadingState());
    final response = await _reportRepo.addReport(ReportRequest(
        vehicleId: vehicleId,
        date: formatDate(DateTime.now().toString()),
        maintenanceCenterName: mcName.text,
        maintenanceCenterLandLine: phoneMc.text,
        services: [
          ServiceReport(
              name: selectedServiceType,
              price: double.parse(servicePrice.text.trim()))
        ],
        products: [
          ProductReport(
              name: productName.text.trim(),
              price: double.parse(productPrice.text.trim()),
              quantity: 1)
        ]));

    response.when(success: (reportsResponse) {
      debugPrint(reportsResponse.toString());
      _emitSafe(PostRequestSuccessState());
      if (context.mounted) Navigator.pop(context);
      selectedServiceType = null;
      mcName.clear();
      phoneMc.clear();
      serviceName.clear();
      servicePrice.clear();
      productName.clear();
      productPrice.clear();
      getReports();
    }, failure: (error) {
      debugPrint(error.apiErrorModel.message);
      debugPrint(error.apiErrorModel.errorCode.toString());
      _emitSafe(PostRequestErrorState());
    });
  }

  // ───────────────────────── Export (PDF / Excel) ─────────────────────────
  // ملاحظة: التصدير بيشمل التقارير اللي ظاهرة في الشاشة حالياً (اللي اتحمّلت).

  String _fmtDate(DateTime? d) =>
      d == null ? 'N/A' : DateFormat('yyyy-MM-dd').format(d);

  List<pw.Widget> _pdfServices(Report r) {
    final services = r.services ?? const <Service>[];
    if (services.isEmpty) return [pw.Text('Services: N/A')];
    return [
      for (final s in services) ...[
        pw.Text('Service: ${s.name ?? 'N/A'}'),
        pw.Text('Service Price: ${formatAmount(s.price)}'),
      ],
    ];
  }

  List<pw.Widget> _pdfProducts(Report r) {
    final products = r.products ?? const <Product>[];
    if (products.isEmpty) return [pw.Text('Products: N/A')];
    return [
      for (final p in products) ...[
        pw.Text('Product: ${p.name ?? 'N/A'}'),
        pw.Text('Product Price: ${formatAmount(p.price)}'),
      ],
    ];
  }

  pw.Widget _pdfReportBlock(int number, MergedReport item) {
    final r = item.report;
    final notes = r.reportContent?.notesSection?.notes?.trim();

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Report $number - ${item.isFullScan ? 'Full Scan' : 'Maintenance'}',
          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 4),
        pw.Text('Date: ${_fmtDate(item.displayDate)}'),
        if (item.isFullScan) ...[
          pw.Text('Scan Type: ${r.scanType ?? 'N/A'}'),
          pw.Text('Scan Price: ${formatAmount(item.totalPrice)}'),
          if (notes != null && notes.isNotEmpty) pw.Text('Notes: $notes'),
        ] else ...[
          pw.Text('Name: ${r.maintenanceCenterName ?? 'N/A'}'),
          pw.Text('Phone: ${r.maintenanceCenterLandLine ?? 'N/A'}'),
          ..._pdfServices(r),
          ..._pdfProducts(r),
          pw.Text('Total Price: ${formatAmount(item.totalPrice)}'),
        ],
        pw.SizedBox(height: 10),
        pw.Divider(),
      ],
    );
  }

  Future<void> shareReportsAsPdf(List<MergedReport> reports) async {
    try {
      if (reports.isEmpty) {
        debugPrint("No reports to share");
        return;
      }

      // حمّل الخط العربي مرة واحدة قبل ما تبدأ تبني الـ PDF
      final arabicFontData =
      await rootBundle.load("assets/font/cairo/Cairo-Regular.ttf");
      final arabicFontBoldData =
      await rootBundle.load("assets/font/cairo/Cairo-Bold.ttf");
      final arabicFont = pw.Font.ttf(arabicFontData);
      final arabicFontBold = pw.Font.ttf(arabicFontBoldData);

      final pdf = pw.Document(
        theme: pw.ThemeData.withFont(
          base: arabicFont,
          bold: arabicFontBold,
        ),
      );

      const itemsPerPage = 4;
      for (var start = 0; start < reports.length; start += itemsPerPage) {
        final end = start + itemsPerPage > reports.length
            ? reports.length
            : start + itemsPerPage;
        final batch = reports.sublist(start, end);

        pdf.addPage(pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          // مهم عشان النصوص العربية تتحاذي صح
          textDirection: pw.TextDirection.rtl,
          build: (pw.Context context) {
            return [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < batch.length; i++)
                    _pdfReportBlock(start + i + 1, batch[i]),
                ],
              ),
            ];
          },
        ));
      }

      final output = await getTemporaryDirectory();
      final file = File("${output.path}/maintenance_reports.pdf");
      final bytes = await pdf.save();

      if (bytes.isEmpty) {
        debugPrint("PDF generation failed - empty bytes");
        return;
      }

      await file.writeAsBytes(bytes);
      await SharePlus.instance.share(ShareParams(
          files: [XFile(file.path)], text: "Maintenance Reports PDF"));
    } catch (e, stackTrace) {
      debugPrint("Error generating PDF: $e");
      debugPrint("Stack trace: $stackTrace");
    }
  }

  String _join(Iterable<String?>? values) => (values ?? const <String?>[])
      .whereType<String>()
      .where((v) => v.isNotEmpty)
      .join(', ');

  Future<void> shareReportsAsExcel(List<MergedReport> reports) async {
    var excel = Excel.createExcel();

    // إعادة تسمية الشيت الافتراضي بدل ما نعمل واحد جديد ويفضل فاضي
    excel.rename('Sheet1', 'Reports');
    Sheet sheetObject = excel['Reports'];

    sheetObject.appendRow([
      TextCellValue("Report Number"),
      TextCellValue("Type"),
      TextCellValue("Maintenance Center"),
      TextCellValue("Phone Number"),
      TextCellValue("Date"),
      TextCellValue("Service Name"),
      TextCellValue("Service Price"),
      TextCellValue("Product Name"),
      TextCellValue("Product Price"),
      TextCellValue("Total Price")
    ]);

    for (int i = 0; i < reports.length; i++) {
      final item = reports[i];
      final r = item.report;
      final isScan = item.isFullScan;

      sheetObject.appendRow([
        TextCellValue("Report ${i + 1}"),
        TextCellValue(isScan ? 'Full Scan' : 'Maintenance'),
        TextCellValue(isScan ? '' : r.maintenanceCenterName ?? ''),
        TextCellValue(isScan ? '' : r.maintenanceCenterLandLine ?? ''),
        TextCellValue(item.displayDate == null ? '' : _fmtDate(item.displayDate)),
        // في الفحص الشامل بنحط نوع الفحص مكان اسم الخدمة
        TextCellValue(isScan ? r.scanType ?? '' : _join(r.services?.map((s) => s.name))),
        TextCellValue(isScan
            ? ''
            : _join(r.services?.map((s) => s.price == null ? null : formatAmount(s.price)))),
        TextCellValue(isScan ? '' : _join(r.products?.map((p) => p.name))),
        TextCellValue(isScan
            ? ''
            : _join(r.products?.map((p) => p.price == null ? null : formatAmount(p.price)))),
        TextCellValue(item.totalPrice == null ? '' : formatAmount(item.totalPrice)),
      ]);
    }

    excel.setDefaultSheet('Reports');

    var directory = await getTemporaryDirectory();
    String filePath = "${directory.path}/maintenance_reports.xlsx";
    var fileBytes = excel.encode();
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);

    await SharePlus.instance.share(ShareParams(
        files: [XFile(filePath)], text: "Maintenance Reports Excel"));
  }

  /// للعرض في الكروت.
  String formatDisplayDate(DateTime? date) =>
      date == null ? '-' : DateFormat('yyyy-MM-dd').format(date);

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }
}