import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/features/work_reports/data/repo/work_reports_repo.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../data/models/work_reports_response.dart';

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

  //**************************************************
  //*********        Date Time            ************
  //**************************************************

  DateTime startDateTime = DateTime.now();

  void pickupStartDate(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
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
      lastDate: DateTime(2025),
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
      status: 'PENDING',
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


}
