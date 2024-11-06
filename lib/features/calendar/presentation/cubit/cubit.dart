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

  fetchMemos({String? order}) async {
    emit(FetchingMemosLoadingState());
    final response = await _memosRepo.fetchMemos(order: order);
    response.when(success: (memosResponse) async {
      memos = memosResponse.data?.diaries;
      emit(MemosSuccessState());
    }, failure: (error) {
      emit(MemosErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}