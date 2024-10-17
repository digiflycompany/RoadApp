import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_state.dart';

class AddMemoCubit extends Cubit<AddMemoState> {
  AddMemoCubit() : super(AddMemoInitial());

  static AddMemoCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();

  TextEditingController importanceController = TextEditingController();
  TextEditingController timesController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController classificationController = TextEditingController();
  TextEditingController topicController = TextEditingController();

  addNote() {
    if (formKey.currentState!.validate()) {
      emit(NoteAddedState());
      importanceController.clear();
      timesController.clear();
      timeController.clear();
      classificationController.clear();
      topicController.clear();
    }
  }
}