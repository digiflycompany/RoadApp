import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/calendar/data/models/add_memo_request_body.dart';
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

  validateToAddMemo() {
    if (formKey.currentState!.validate()) addMemo();
  }

  addMemo(/*AddMemoRequestBody body*/) async {
    /*emit(FetchingMemosLoadingState());
    final response = await _memosRepo.fetchMemos();
    response.when(success: (memosResponse) async {
      memos = memosResponse.data?.diaries;
      emit(MemosSuccessState());
    }, failure: (error) {
      emit(MemosErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });*/
  }
}