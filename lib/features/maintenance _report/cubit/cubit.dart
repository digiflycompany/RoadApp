import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/report_request.dart';

import '../data/models/list_reports_model.dart';
import '../data/repo/report_repo.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class MaintenanceReportCubit extends Cubit<MaintenanceReportStates> {
  MaintenanceReportCubit(this._reportRepo)
      : super(InitialMaintenanceReportState());
  final ReportRepo _reportRepo;

  static MaintenanceReportCubit get(context) => BlocProvider.of(context);

  final TextEditingController serviceName = TextEditingController();
  final TextEditingController servicePrice = TextEditingController();
  final TextEditingController productName = TextEditingController();
  final TextEditingController productPrice = TextEditingController();

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
    );

    response.when(
      success: (reportsResponse) {
        if (isLoadMore) {
          reportsResponses?.data?.reports
              ?.addAll(reportsResponse.data?.reports ?? []);
        } else {
          reportsResponses = reportsResponse;
        }

        debugPrint(reportsResponse.toString());
        emit(GetReportsSuccessState());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetReportsErrorState());
      },
    );
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



  Future<void> postReports(String vehicleId) async {
    emit(PostRequestLoadingState());
    final response = await _reportRepo.addReport(
      ReportRequest(
        vehicleId: vehicleId,
        date: formatDate(DateTime.now().toString()),
        services: [
          ServiceReport(
            name: serviceName.text.trim(),
            price: double.parse(servicePrice.text.trim()),
          ),
        ],
        products: [
          ProductReport(
            name: productName.text.trim(),
            price: double.parse(productPrice.text.trim()),
            quantity: 1,
          ),
        ],
      ),
    );

    response.when(
      success: (reportsResponse) {
        debugPrint(reportsResponse.toString());
        emit(PostRequestSuccessState());
        getReports(vehicleId: vehicleId);
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(PostRequestErrorState());
      },
    );
  }

  Future<void> shareReportsAsPdf(List reports) async {
    final pdf = pw.Document();

    const itemsPerPage = 4;
    int totalBatches = (reports.length / itemsPerPage).ceil();

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
                  (endIndex > reports.length ? reports.length : endIndex) -
                      startIndex,
                  (index) {
                    final report = reports[startIndex + index];
                    return pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Report ${startIndex + index + 1}",
                            style: pw.TextStyle(fontSize: 16)),
                        pw.Text(
                            "Name: ${report.maintenanceCenterId?.name ?? ''}"),
                        pw.Text(
                            "Phone: ${report.maintenanceCenterId?.landline ?? ''}"),
                        pw.Text("Date: ${report.date ?? ''}"),
                        pw.Text("Service: ${report.services![0].name ?? ''}"),
                        pw.Text(
                            "Service Price: ${report.services![0].price ?? ''}"),
                        pw.Text("Product: ${report.products![0].name ?? ''}"),
                        pw.Text(
                            "Product Price: ${report.products![0].price ?? ''}"),
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

    await Share.shareFiles([file.path], text: "Maintenance Reports PDF");
  }

  Future<void> shareReportsAsExcel(List reports) async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Reports'];

    sheetObject.appendRow([
      "Report Number",
      "Maintenance Center",
      "Phone Number",
      "Date",
      "Service Name",
      "Service Price",
      "Product Name",
      "Product Price",
      "Total Price",
    ]);

    for (int i = 0; i < reports.length; i++) {
      var report = reports[i];
      sheetObject.appendRow([
        "Report ${i + 1}",
        report.maintenanceCenterId?.name ?? '',
        report.maintenanceCenterId?.landline ?? '',
        report.date ?? '',
        report.services![0].name ?? '',
        report.services![0].price ?? '',
        report.products![0].name ?? '',
        report.products![0].price ?? '',
        report.price ?? '',
      ]);
    }

    var directory = await getTemporaryDirectory();
    String filePath = "${directory.path}/maintenance_reports.xlsx";
    var fileBytes = excel.encode();
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);

    await Share.shareFiles([filePath], text: "Maintenance Reports Excel");
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }
}
