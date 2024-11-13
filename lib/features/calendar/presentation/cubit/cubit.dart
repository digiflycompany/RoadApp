import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/calendar_custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/calendar_dialog.dart';
import 'package:roadapp/features/calendar/data/models/memos_response.dart';
import 'package:roadapp/features/calendar/data/repos/memos_repo.dart';
import 'package:roadapp/features/calendar/presentation/cubit/states.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit(this._memosRepo) : super(CalendarInitState());
  final MemosRepo _memosRepo;
  static CalendarCubit get(context) => BlocProvider.of(context);

  bool importanceDegree = false;
  bool checkBoxDate = false;

  DateTime selectedDay = DateTime.now().add(const Duration(days: 1));
  DateTime? focusedDay = DateTime.now().add(const Duration(days: 1));
  String? selectedHour;

  List<Diary>? memos;
  int memosPage = 1;
  bool isLoadingMore = false;

  void showCalendarDialog(BuildContext context) {
    calendarCustomAlertDialog(
        context: context,
        title: StringManager.daySelection.tr(context),
        content: const CalendarDialogContent());
  }

  void changeCheckBox(bool value, String box) {
    switch (box) {
      case 'date':
        checkBoxDate = value;
        importanceDegree = false;
        break;
      case 'degree':
        importanceDegree = value;
        checkBoxDate = false;
        break;
    }
    emit(BoxUpdatedState());
  }

  fetchMemos({String? order, int page = 1, int limit = 20, bool? more}) async {
    if (more == true) {
      isLoadingMore = true; // Set loading state to true when fetching more
      emit(MoreLoadingState());
    } else {
      emit(FetchingMemosLoadingState());
    }

    final response = await _memosRepo.fetchMemos(order: order, page: page, limit: limit);

    response.when(success: (memosResponse) async {
      if (more != true) {
        memos = memosResponse.data?.diaries;
        memosPage = 1;
      } else {
        memos?.addAll(memosResponse.data?.diaries ?? []);
        memosPage++;
      }

      isLoadingMore = false;
      emit(MemosSuccessState());
    }, failure: (error) {
      isLoadingMore = false;
      emit(MemosErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}