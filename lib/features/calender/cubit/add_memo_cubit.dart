import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/calender/cubit/add_memo_state.dart';

class AddMemoCubit extends Cubit<AddMemoState> {
  AddMemoCubit() : super(AddMemoInitial());

  static AddMemoCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();

  TextEditingController importanceController = TextEditingController();
  TextEditingController timesController = TextEditingController();
}