import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/list_reports_model.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/report_request.dart';
import 'package:roadapp/features/work_reports/data/repo/work_reports_repo.dart';

import '../../work_reports/data/models/full_scan_report_response.dart';
import '../data/repo/report_repo.dart';

class MaintenanceReportCubit extends Cubit<MaintenanceReportStates> {
  MaintenanceReportCubit(this._reportRepo, this._workReportsRepo)
      : super(InitialMaintenanceReportState());

  final ReportRepo _reportRepo;
  final WorkReportsRepo _workReportsRepo;

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

  void setExcel() {
    if (excel) return;
    excel = true;
    pdf = false;
    emit(ExcelChosenState());
  }

  void setPDF() {
    if (pdf) return;
    pdf = true;
    excel = false;
    emit(PDFChosenState());
  }

  void togglePrice() {
    selectPrice = !selectPrice;
    emit(PriceToggledState());
  }

  void toggleFilterCheck(String boxTitle, BuildContext context) {
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

  void pickStartDate(context, String id, String vehicleNumber) {
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
        startDateTime = DateTime(value.year, value.month, value.day);
        getReports(vehicleId: id);
        fetchFullScanReport(vehicleNumber: vehicleNumber);
        emit(StartDateState());
      }
    });
  }

  DateTime endDateTime = DateTime.now();

  void pickEndDate(context, String id, String vehicleNumber) {
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
        endDateTime = DateTime(value.year, value.month, value.day);
        getReports(vehicleId: id);
        fetchFullScanReport(vehicleNumber: vehicleNumber);
        emit(EndDateState());
      }
    });
  }

  String extractDate(String dateTime) {
    final date = DateTime.parse(dateTime);
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String? selectedServiceType;
  String? selectedProductType;

  ReportResponse? reportsResponses;

  int currentPage = 1;
  int limit = 15;

  Future<void> getReports({bool isLoadMore = false, required String vehicleId}) async {
    if (!isLoadMore) emit(GetReportsLoadingState());

    final response = await _reportRepo.getReports(
      page: currentPage,
      limit: limit,
      parameterValue: vehicleId,
      startDate: extractDate(startDateTime.toString()),
      endDate: extractDate(endDateTime.toString()),
    );

    response.when(
      success: (reportsResponse) {
        if (isLoadMore) {
          reportsResponses?.data?.reports?.addAll(reportsResponse.data?.reports ?? []);
        } else {
          reportsResponses = reportsResponse;
        }
        emit(GetReportsSuccessState());
      },
      failure: (_) => emit(GetReportsErrorState()),
    );
  }

  Future<void> loadMoreReports(String vehicleId) async {
    if (state is ReportsLoadingMoreState) return;

    emit(ReportsLoadingMoreState());
    try {
      currentPage++;
      await getReports(isLoadMore: true, vehicleId: vehicleId);
      emit(ReportsSuccessMoreState());
    } catch (_) {
      emit(ReportsErrorMoreState());
    }
  }

  Future<void> postReports(String vehicleId, context) async {
    emit(PostRequestLoadingState());

    final response = await _reportRepo.addReport(
      ReportRequest(
        vehicleId: vehicleId,
        date: formatDate(DateTime.now().toString()),
        maintenanceCenterName: mcName.text,
        maintenanceCenterLandLine: phoneMc.text,
        services: [
          ServiceReport(
            name: selectedServiceType,
            price: double.parse(servicePrice.text.trim()),
          )
        ],
        products: [
          ProductReport(
            name: selectedProductType,
            price: double.parse(productPrice.text.trim()),
            quantity: 1,
          )
        ],
      ),
    );

    response.when(
      success: (_) {
        emit(PostRequestSuccessState());
        Navigator.pop(context);

        selectedServiceType = null;
        selectedProductType = null;

        mcName.clear();
        phoneMc.clear();
        serviceName.clear();
        servicePrice.clear();
        productName.clear();
        productPrice.clear();

        getReports(vehicleId: vehicleId);
      },
      failure: (_) => emit(PostRequestErrorState()),
    );
  }

  // **************************************************************
  // SHARE PDF  ✅ share_plus: shareXFiles (no shareFiles)
  // **************************************************************
  Future<void> shareReportsAsPdf(List reports) async {
    final pdf = pw.Document();

    const itemsPerPage = 4;
    final totalBatches = (reports.length / itemsPerPage).ceil();

    for (int i = 0; i < totalBatches; i++) {
      final startIndex = i * itemsPerPage;
      final endIndex = (i + 1) * itemsPerPage;

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: List.generate(
                  (endIndex > reports.length ? reports.length : endIndex) - startIndex,
                      (index) {
                    final report = reports[startIndex + index];

                    final hasServices = report.services != null && report.services!.isNotEmpty;
                    final hasProducts = report.products != null && report.products!.isNotEmpty;

                    return pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Report ${startIndex + index + 1}",
                          style: const pw.TextStyle(fontSize: 16),
                        ),
                        pw.Text("Name: ${report.maintenanceCenterName ?? ''}"),
                        pw.Text("Phone: ${report.maintenanceCenterLandLine ?? ''}"),
                        pw.Text("Date: ${report.date ?? ''}"),
                        pw.Text("Service: ${hasServices ? (report.services![0].name ?? '') : ''}"),
                        pw.Text("Service Price: ${hasServices ? (report.services![0].price ?? '') : ''}"),
                        pw.Text("Product: ${hasProducts ? (report.products![0].name ?? '') : ''}"),
                        pw.Text("Product Price: ${hasProducts ? (report.products![0].price ?? '') : ''}"),
                        pw.Text("Total Price: ${report.price ?? ''}"),
                        pw.SizedBox(height: 10),
                        pw.Divider(),
                      ],
                    );
                  },
                ),
              ),
            ];
          },
        ),
      );
    }

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/maintenance_reports.pdf");
    await file.writeAsBytes(await pdf.save());

    await Share.shareXFiles(
      [XFile(file.path)],
      text: "Maintenance Reports PDF",
    );
  }

  // **************************************************************
  // SHARE EXCEL ✅ excel v4+: appendRow expects List<CellValue?>
  // **************************************************************
  Future<void> shareReportsAsExcel(List reports) async {
    final excelFile = Excel.createExcel();
    final Sheet sheetObject = excelFile['Reports'];

    TextCellValue t(dynamic v) => TextCellValue(v?.toString() ?? '');

    sheetObject.appendRow([
      t("Report Number"),
      t("Maintenance Center"),
      t("Phone Number"),
      t("Date"),
      t("Service Name"),
      t("Service Price"),
      t("Product Name"),
      t("Product Price"),
      t("Total Price"),
    ]);

    for (int i = 0; i < reports.length; i++) {
      final report = reports[i];

      final hasServices = report.services != null && report.services!.isNotEmpty;
      final hasProducts = report.products != null && report.products!.isNotEmpty;

      sheetObject.appendRow([
        t("Report ${i + 1}"),
        t(report.maintenanceCenterId?.name ?? ''),
        t(report.maintenanceCenterId?.landline ?? ''),
        t(report.date ?? ''),
        t(hasServices ? (report.services![0].name ?? '') : ''),
        t(hasServices ? (report.services![0].price ?? '') : ''),
        t(hasProducts ? (report.products![0].name ?? '') : ''),
        t(hasProducts ? (report.products![0].price ?? '') : ''),
        t(report.price ?? ''),
      ]);
    }

    final directory = await getTemporaryDirectory();
    final filePath = "${directory.path}/maintenance_reports.xlsx";

    final fileBytes = excelFile.encode();
    if (fileBytes == null) {
      emit(GetReportsErrorState());
      return;
    }

    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes);

    await Share.shareXFiles(
      [XFile(filePath)],
      text: "Maintenance Reports Excel",
    );
  }

  String formatDate(String dateString) {
    final dateTime = DateTime.parse(dateString);
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }

  int selectedReportType = 1;

  Future<void> changeReportTypeRadio(int reportNumber) async {
    selectedReportType = reportNumber;
    emit(SelectReportTypeState());
  }

  int selectedFullScanRadio = 1;

  Future<void> changeFullRadio(int processNumber, String vehicleNumber) async {
    selectedFullScanRadio = processNumber;
    await fetchFullScanReport(vehicleNumber: vehicleNumber);
    emit(SelectProcessTypeState());
  }

  String selectFullScanType() {
    if (selectedFullScanRadio == 1) return 'INSPECTION';
    if (selectedFullScanRadio == 2) return 'MAINTENANCE';
    return 'SALES_PURCHASE';
  }

  int servicesReportsPage = 1;
  List<FullScanReport>? servicesReports = [];

  Future<void> fetchFullScanReport({
    int page = 1,
    int limit = 10,
    bool? more,
    required String vehicleNumber,
  }) async {
    if (more == true) {
      emit(FetchFullScanReportsLoadingMoreState());
    } else {
      emit(FetchFullScanReportsLoadingState());
    }

    final response = await _workReportsRepo.fetchFullScanReport(
      startDate: extractDate(startDateTime.toString()),
      endDate: extractDate(endDateTime.toString()),
      scanType: selectFullScanType(),
      page: page,
      limit: limit,
      vehicleNumber: vehicleNumber,
    );

    response.when(
      success: (workResponse) async {
        if (more != true) {
          servicesReports = workResponse.data.reports ?? [];
          servicesReportsPage = 1;
        } else {
          servicesReports?.addAll(workResponse.data.reports ?? []);
          servicesReportsPage++;
        }
        emit(FetchFullScanReportsSuccessState(servicesReports));
      },
      failure: (error) {
        emit(FetchFullScanReportsErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!',
        ));
      },
    );
  }
}