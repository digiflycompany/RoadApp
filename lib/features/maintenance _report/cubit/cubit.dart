import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/report_request.dart';
import 'package:share_plus/share_plus.dart';
import '../data/models/list_reports_model.dart';
import '../data/repo/report_repo.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class MaintenanceReportCubit extends Cubit<MaintenanceReportStates> {
  MaintenanceReportCubit(this._reportRepo)
      : super(InitialMaintenanceReportState());
  final ReportRepo _reportRepo;

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

  DateTime startDateTime = DateTime.now();

  void pickStartDate(context, String id) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
    ).then((value) async {
      if (value != null) {
        // Update the date portion of dateTime
        startDateTime = DateTime(
          value.year,
          value.month,
          value.day,
        );
        getReports(vehicleId: id);
        emit(StartDateState());
      }
    });
  }

  ///--------------------- END DATE ---------------------///
  DateTime endDateTime = DateTime.now();
  void pickEndDate(context, String id) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2050),
      builder: (_, child) {
        return Theme(
          data: Theme.of(context),
          child: child!,
        );
      },
    ).then((value) async {
      if (value != null) {
        // Update the date portion of dateTime
        endDateTime = DateTime(
          value.year,
          value.month,
          value.day,
        );
        getReports(vehicleId: id);
        emit(EndDateState());
      }
    });
  }

  String extractDate(String dateTime) {
    final date = DateTime.parse(dateTime);
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }

  String? selectedServiceType;
  ReportResponse? reportsResponses;
  int currentPage = 1;
  int limit = 15;

  Future<void> getReports(
      {bool isLoadMore = false, required String vehicleId}) async {
    if (!isLoadMore) {
      emit(GetReportsLoadingState());
    }

    final response = await _reportRepo.getReports(
      page: currentPage,
      limit: limit,
      parameterValue: vehicleId,
      startDate: extractDate(startDateTime.toString()),
      endDate: extractDate(endDateTime.toString()),
    );

    response.when(success: (reportsResponse) {
      if (isLoadMore) {
        reportsResponses?.data?.reports
            ?.addAll(reportsResponse.data?.reports ?? []);
      } else {
        reportsResponses = reportsResponse;
      }

      debugPrint(reportsResponse.toString());
      emit(GetReportsSuccessState());
    }, failure: (error) {
      debugPrint(error.apiErrorModel.message);
      debugPrint(error.apiErrorModel.errorCode.toString());
      emit(GetReportsErrorState());
    });
  }

  Future<void> loadMoreReports(String vehicleId) async {
    if (state is ReportsLoadingMoreState) return;

    emit(ReportsLoadingMoreState());
    try {
      currentPage++;
      await getReports(isLoadMore: true, vehicleId: vehicleId);
      emit(ReportsSuccessMoreState());
    } catch (ex) {
      debugPrint(ex.toString());
      emit(ReportsErrorMoreState());
    }
  }

  Future<void> postReports(String vehicleId, context) async {
    emit(PostRequestLoadingState());
    final response = await _reportRepo.addReport(ReportRequest(
        vehicleId: vehicleId,
        date: formatDate(DateTime.now().toString()),
        maintenanceCenterName: mcName.text,
        maintenanceCenterLandLine: phoneMc.text,
        services: [
          ServiceReport(
              //name: serviceName.text.trim(),
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
      emit(PostRequestSuccessState());
      Navigator.pop(context);
      selectedServiceType = null;
      mcName.clear();
      phoneMc.clear();
      serviceName.clear();
      servicePrice.clear();
      productName.clear();
      productPrice.clear();
      getReports(vehicleId: vehicleId);
    }, failure: (error) {
      debugPrint(error.apiErrorModel.message);
      debugPrint(error.apiErrorModel.errorCode.toString());
      emit(PostRequestErrorState());
    });
  }

  Future<void> shareReportsAsPdf(List<Report> reports) async {
    try {
      if (reports.isEmpty) {
        debugPrint("No reports to share");
        return;
      }

      // حمّل الخط العربي مرة واحدة قبل ما تبدأ تبني الـ PDF
      final arabicFontData = await rootBundle.load("assets/font/cairo/Cairo-Regular.ttf");
      final arabicFontBoldData = await rootBundle.load("assets/font/cairo/Cairo-Bold.ttf");
      final arabicFont = pw.Font.ttf(arabicFontData);
      final arabicFontBold = pw.Font.ttf(arabicFontBoldData);

      final pdf = pw.Document(
        theme: pw.ThemeData.withFont(
          base: arabicFont,
          bold: arabicFontBold,
        ),
      );

      const itemsPerPage = 4;
      int totalBatches = (reports.length / itemsPerPage).ceil();

      for (int i = 0; i < totalBatches; i++) {
        final startIndex = i * itemsPerPage;
        final endIndex = (i + 1) * itemsPerPage;

        pdf.addPage(pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          // مهم عشان النصوص العربية تتحاذي صح
          textDirection: pw.TextDirection.rtl,
          build: (pw.Context context) {
            return [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: List.generate(
                  (endIndex > reports.length ? reports.length : endIndex) - startIndex,
                      (index) {
                    final report = reports[startIndex + index];
                    return pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Report ${startIndex + index + 1}",
                          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text("Name: ${report.maintenanceCenterName ?? 'N/A'}"),
                        pw.Text("Phone: ${report.maintenanceCenterLandLine ?? 'N/A'}"),
                        pw.Text("Date: ${report.date != null ? DateFormat('yyyy-MM-dd').format(report.date!) : 'N/A'}"),

                        if (report.services != null && report.services!.isNotEmpty)
                          ...report.services!.map((s) => pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text("Service: ${s.name ?? 'N/A'}"),
                              pw.Text("Service Price: ${s.price ?? 'N/A'}"),
                            ],
                          ))
                        else
                          pw.Text("Services: N/A"),

                        if (report.products != null && report.products!.isNotEmpty)
                          ...report.products!.map((p) => pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text("Product: ${p.name ?? 'N/A'}"),
                              pw.Text("Product Price: ${p.price ?? 'N/A'}"),
                            ],
                          ))
                        else
                          pw.Text("Products: N/A"),

                        pw.Text("Total Price: ${report.price ?? 'N/A'}"),
                        pw.SizedBox(height: 10),
                        pw.Divider(),
                      ],
                    );
                  },
                ),
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
      await Share.shareXFiles([XFile(file.path)], text: "Maintenance Reports PDF");
    } catch (e, stackTrace) {
      debugPrint("Error generating PDF: $e");
      debugPrint("Stack trace: $stackTrace");
    }
  }

  Future<void> shareReportsAsExcel(List<Report> reports) async { // يفضل تحديد نوع الـ List
    var excel = Excel.createExcel();

    // 1. إعادة تسمية الشيت الافتراضي بدلاً من إنشاء واحد جديد لتجنب ظهور شيت فارغ
    excel.rename('Sheet1', 'Reports');
    Sheet sheetObject = excel['Reports'];

    // 2. استخدام TextCellValue في العناوين
    sheetObject.appendRow([
      TextCellValue("Report Number"),
      TextCellValue("Maintenance Center"),
      TextCellValue("Phone Number"),
      TextCellValue("Date"),
      TextCellValue("Service Name"),
      TextCellValue("Service Price"),
      TextCellValue("Product Name"),
      TextCellValue("Product Price"),
      TextCellValue("Total Price")
    ]);

    // 3. استخدام TextCellValue في البيانات والتأكد من تحويل الأرقام لنصوص
    for (int i = 0; i < reports.length; i++) {
      var report = reports[i];
      sheetObject.appendRow([
        TextCellValue("Report ${i + 1}"),
        TextCellValue(report.maintenanceCenterName ?? ''), // تم التعديل لتطابق دالة الـ PDF
        TextCellValue(report.maintenanceCenterLandLine ?? ''), // تم التعديل لتطابق دالة الـ PDF
        TextCellValue(report.date != null ? DateFormat('yyyy-MM-dd').format(report.date!) : ''),
        TextCellValue((report.services != null && report.services!.isNotEmpty) ? report.services![0].name ?? '' : ''),
        TextCellValue((report.services != null && report.services!.isNotEmpty) ? report.services![0].price?.toString() ?? '' : ''),
        TextCellValue((report.products != null && report.products!.isNotEmpty) ? report.products![0].name ?? '' : ''),
        TextCellValue((report.products != null && report.products!.isNotEmpty) ? report.products![0].price?.toString() ?? '' : ''),
        TextCellValue(report.price?.toString() ?? '')
      ]);
    }

    // تعيين الشيت ليكون هو الافتراضي عند فتح الملف
    excel.setDefaultSheet('Reports');

    var directory = await getTemporaryDirectory();
    String filePath = "${directory.path}/maintenance_reports.xlsx";
    var fileBytes = excel.encode();
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);

    await Share.shareXFiles([XFile(filePath)],
        text: "Maintenance Reports Excel");
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }
}
