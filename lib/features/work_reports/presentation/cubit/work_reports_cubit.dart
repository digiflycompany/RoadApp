import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:roadapp/features/work_reports/data/repo/work_reports_repo.dart';
import 'package:share/share.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../data/models/full_scan_report_response.dart';
import '../../data/models/work_reports_response.dart';

import 'dart:io';
import 'package:excel/excel.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

part 'work_reports_state.dart';



class WorkReportsCubit extends Cubit<WorkReportsState> {
  WorkReportsCubit(this._workReportsRepo) : super(WorkReportsInitial());

  final WorkReportsRepo _workReportsRepo;

  static WorkReportsCubit get(context) => BlocProvider.of(context);

  //**************************************************
  //*********        Selected Radio            *******
  //**************************************************
  int selectedRadio = 1;
  changeRadio(int processNumber) async{
    selectedRadio = processNumber;

    await fetchWorkReports();

    emit(SelectProcessTypeState());
  }

  int selectedFullScanRadio = 1;
  changeFullRadio(int processNumber) async{
    selectedFullScanRadio = processNumber;

    await fetchFullScanReport();

    emit(SelectProcessTypeState());
  }

  //**************************************************
  //*********        Date Time            ************
  //**************************************************

  DateTime startDateTime = DateTime.now();

  void pickupStartDate(context) {
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
    ).then((value) async{
      if (value != null) {
        // Update the date portion of dateTime
        startDateTime = DateTime(
          value.year,
          value.month,
          value.day,
        );
      }
      await fetchWorkReports();
      emit(StartDateTimeState());
    });

  }

  DateTime endDateTime = DateTime.now();

  void pickupEndDate(context) {
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
    ).then((value) async{
      if (value != null) {
        // Update the date portion of dateTime
        endDateTime = DateTime(
          value.year,
          value.month,
          value.day,
        );
      }
      await fetchWorkReports();
      emit(EndDateTimeState());
    });

    fetchWorkReports();
  }

  String extractDate(String dateTime) {
    final date = DateTime.parse(dateTime);
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }

  //******************************************************
  //*********        Gat All Work Reports     ************
  //******************************************************

  int workReportsPage = 1;
  List<DocumentWorkReports>? workReports;


  String selectType(){

    String selectedValue;
    if(selectedRadio == 1){
      selectedValue = 'receipt';
    }else if(selectedRadio == 2){
      selectedValue =  'pay';
    }else{
      selectedValue = 'sell';

    }
    return selectedValue;
  }

  String? maintenanceCenterProfileIdKey ;
  fetchWorkReports({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      emit(FetchWorkReportsLoadingMoreState());
    } else {
      emit(FetchWorkReportsLoadingState());
    }

    maintenanceCenterProfileIdKey =
    await CacheHelper().getData('MaintenanceCenterProfileIdKey');


    debugPrint("ID USER ====>>> : $maintenanceCenterProfileIdKey");
    final token = await CacheHelper().getData(CacheVars.accessToken);
    debugPrint('Token ====> : $token');

    final response = await _workReportsRepo.fetchWorkReports(
      status: null,
      startDate: extractDate(startDateTime.toString()),
      endDate: extractDate(endDateTime.toString()),
      type: selectType(),
      page: page,
      limit: limit,
    );


    // Add Full Scan Report
    response.when(success: (workResponse) async {
      if (more != true) {
        workReports = workResponse.data?.documents ?? [];
        workReportsPage = 1;
      } else {
        workReports?.addAll(workResponse.data?.documents ?? []);
        workReportsPage++;
      }

      emit(FetchWorkReportsSuccessState(workReports));
    }, failure: (error) {
      emit(FetchWorkReportsErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }



  //*************************** Full Scan Reports ***************************

  DateTime startDateTimeFullScan = DateTime.now();

  void pickupStartDateFullScan(context) {
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
    ).then((value) async{
      if (value != null) {
        // Update the date portion of dateTime
        startDateTimeFullScan = DateTime(
          value.year,
          value.month,
          value.day,
        );
      }
      await fetchFullScanReport();
      emit(EndDateTimeFullScanState());
    });

  }

  DateTime endDateTimeFullScan = DateTime.now();

  void pickupEndDateFullScan(context) {
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
    ).then((value) async{
      if (value != null) {
        // Update the date portion of dateTime
        endDateTimeFullScan = DateTime(
          value.year,
          value.month,
          value.day,
        );
      }
      await fetchFullScanReport();
      emit(EndDateTimeFullScanState());
    });

    //fetchFullScanReport();
  }


  String selectFullScanType(){

    // ['INSPECTION', 'MAINTENANCE', 'SALES_PURCHASE']
    String selectedValue;
    if(selectedFullScanRadio == 1){
      selectedValue = 'INSPECTION';
    }else if(selectedFullScanRadio == 2){
      selectedValue =  'MAINTENANCE';
    }else{
      selectedValue = 'SALES_PURCHASE';

    }
    return selectedValue;
  }
  int servicesReportsPage = 1;

  List<Report>? servicesReports = [];
  fetchFullScanReport({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      emit(FetchFullScanReportsLoadingMoreState());
    } else {
      emit(FetchFullScanReportsLoadingState());
    }

    final response = await _workReportsRepo.fetchFullScanReport(
      startDate: extractDate(startDateTimeFullScan.toString()),
      endDate: extractDate(endDateTimeFullScan.toString()),
      scanType: selectFullScanType(),
      page: page,
      limit: limit,
    );
    response.when(success: (workResponse) async {
      if (more != true) {
        servicesReports = workResponse.data.reports ?? [];
        servicesReportsPage = 1;
      } else {
        servicesReports?.addAll(workResponse.data.reports ?? []);
        servicesReportsPage++;
      }

      emit(FetchFullScanReportsSuccessState(servicesReports));
    }, failure: (error) {
      emit(FetchFullScanReportsErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
  //*****************************************************************


  Map<String, bool> loadingItemsApprove = {};

  approveWorkReport({required String id})async{
    loadingItemsApprove[id] = true;
    // loading
    emit(ApproveWorkReportsLoadingState());

    final response = await _workReportsRepo.approveWorkReport(
      id: id,
    );

    response.when(success: (workResponse) async {
      loadingItemsApprove.remove(id);
      await fetchWorkReports();
      emit(ApproveWorkReportsSuccessState());
    }, failure: (error) {
      loadingItemsApprove.remove(id);
      emit(ApproveWorkReportsErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });

  }


  Map<String, bool> loadingItemsDecline = {};

  declineWorkReport({required String id})async{
    loadingItemsDecline[id] = true;
    // loading
    emit(DeclineWorkReportsLoadingState());

    final response = await _workReportsRepo.declineWorkReport(
      id: id,
    );

    response.when(success: (workResponse) async {
      loadingItemsDecline.remove(id);
      await fetchWorkReports();
      emit(DeclineWorkReportsSuccessState());
    }, failure: (error) {
      loadingItemsDecline.remove(id);
      emit(DeclineWorkReportsErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });

  }

  //******************************************************
  //*********        Gat Share Data           ************
  //******************************************************

  String csvData = '';
  Future<void> getShareWorkReports()async{

    emit(GetShareWorkReportsLoadingState());

    final response = await _workReportsRepo.shareWorkReports(
        documentType: selectType(),
      startDate: extractDate(startDateTime.toString()),
      endDate: extractDate(endDateTime.toString()),
    );
    response.when(success: (shareWorkResponse) async {
      csvData = shareWorkResponse.data.csv.toString();

      emit(GetShareWorkReportsSuccessState());

    },failure: (error) {

      emit(GetShareWorkReportsErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  //******************************************************
  //*********        Share Pdf                ************
  //******************************************************
  Future<void> shareCsvAsPagedPdf() async {
    final pdf = pw.Document();

    final rows = csvData.split('\n');
    if (rows.isEmpty) return;

    final headers = ['Status', 'Total Price', 'Notes', 'Date'];

    final dataRows = rows.skip(1).map((row) {
      final cells = row.split(',').map((cell) => cell.replaceAll('"', '')).toList();
      return [
        cells[3], // Status
        cells[4], // Total Price
        cells[5], // Notes
        cells[10], // Date
      ];
    }).toList();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Table.fromTextArray(
            headers: headers,
            data: dataRows,
            border: pw.TableBorder.all(),
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            cellAlignment: pw.Alignment.center,
            headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
            columnWidths: {
              0: const pw.FixedColumnWidth(100), // Status
              1: const pw.FixedColumnWidth(100), // Total Price
              2: const pw.FixedColumnWidth(150), // Notes
              3: const pw.FixedColumnWidth(150), // Date
            },
          ),
        ],
      ),
    );

    final tempDir = await getTemporaryDirectory();
    final file = File("${tempDir.path}/pdf_report.pdf");
    await file.writeAsBytes(await pdf.save());

    // مشاركة الملف
    await Share.shareFiles([file.path], text: "Here is your paged report as PDF");
  }
  //******************************************************
  //*********        share excel              ************
  //******************************************************
  Future<void> shareCsvAsExcel() async {
    final excel = Excel.createExcel();
    final sheet = excel['Filtered Data'];

    final headers = ['Status', 'Total Price', 'Notes', 'Date'];
    sheet.appendRow(headers);

    final rows = csvData.split('\n');
    rows.skip(1).forEach((row) {
      final cells = row.split(',').map((cell) => cell.replaceAll('"', '')).toList();
      sheet.appendRow([
        cells[3], // Status
        cells[4], // Total Price
        cells[5], // Notes
        cells[10], // Date
      ]);
    });

    final tempDir = await getTemporaryDirectory();
    final file = File("${tempDir.path}/excel_report.xlsx");
    await file.writeAsBytes(excel.encode()!);

    await Share.shareFiles([file.path], text: "Here is your filtered report as Excel");
  }

}
