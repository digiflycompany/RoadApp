import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/calendar/data/models/add_memo_request_body.dart';
import 'package:roadapp/features/calendar/data/repos/memos_repo.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_state.dart';

class AddMemoCubit extends Cubit<AddMemoState> {
  AddMemoCubit(this._memosRepo) : super(AddMemoInitial());
  final MemosRepo _memosRepo;
  static AddMemoCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();

  TextEditingController topicController = TextEditingController();

  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  String selectedImportance = '1';
  String selectedClassification = 'GENERAL';

  List<String> importanceList = ['1', '2', '3'];
  List<String> classificationsList = ['GENERAL', 'SPECIFIC'];

  validateToAddMemo() {
    if (formKey.currentState!.validate()) {
      String date = convertDateTimeToString(dateTime, timeOfDay);
      AddMemoRequestBody body = AddMemoRequestBody(
          date: date,
          type: selectedClassification,
          description: topicController.text.trim(),
          priority: int.parse(selectedImportance));
      addMemo(body);
    }
  }

  void pickupDate(BuildContext context) {
    showDatePicker(
        keyboardType: TextInputType.name,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2050),
        builder: (_, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 12.sp))),
              child: child!);
        }).then((value) {
      if (value != null) {
        dateTime = value;
      }
      emit(MemoPickupDateStates());
    });
  }

  void pickupTime(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: timeOfDay,
    ).then((value) {
      if (value != null) {
        timeOfDay = value;
      }
      emit(MemoPickupDateStates());
    });
  }

  changeImportance(String value) {
    selectedImportance = value;
    emit(MemoDropdownChangedState());
  }

  changeClassification(String value) {
    selectedClassification = value;
    emit(MemoDropdownChangedState());
  }

  addMemo(AddMemoRequestBody body) async {
    emit(AddingMemoLoadingState());
    final response = await _memosRepo.addMemo(body);
    response.when(success: (creationResponse) async {
      emit(NoteAddedState());
    }, failure: (error) {
      emit(AddMemoErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  String convertDateTimeToString(DateTime dateTime, TimeOfDay timeOfDay) {
    DateTime fullDateTime = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    String formattedDateTime = fullDateTime.toUtc().toIso8601String();

    return formattedDateTime;
  }
}
