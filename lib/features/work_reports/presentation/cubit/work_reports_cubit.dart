import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/features/work_reports/data/repo/work_reports_repo.dart';

import '../../data/models/work_reports_response.dart';

part 'work_reports_state.dart';

class WorkReportsCubit extends Cubit<WorkReportsState> {
  WorkReportsCubit(this._workReportsRepo) : super(WorkReportsInitial());

  final WorkReportsRepo _workReportsRepo;

  static WorkReportsCubit get(context) => BlocProvider.of(context);

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
    ).then((value) {
      if (value != null) {
        // Update the date portion of dateTime
        startDateTime = DateTime(
          value.year,
          value.month,
          value.day,
        );
      }
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
    ).then((value) {
      if (value != null) {
        // Update the date portion of dateTime
        endDateTime = DateTime(
          value.year,
          value.month,
          value.day,
        );
      }
      emit(EndDateTimeState());
    });
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

  fetchWorkReports({int page = 1, int limit = 35, bool? more}) async {
    if (more == true) {
      emit(FetchWorkReportsLoadingMoreState());
    } else {
      emit(FetchWorkReportsLoadingState());
    }

    final response = await _workReportsRepo.fetchWorkReports(
      startDate: extractDate(startDateTime.toString()),
      endDate: extractDate(endDateTime.toString()),
      type: 'pay',
      page: page,
      limit: limit,
    );

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
}
