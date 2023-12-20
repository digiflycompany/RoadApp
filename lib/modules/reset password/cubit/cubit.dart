import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp2/modules/reset%20password/cubit/state.dart';


class ResetPasswordCubit extends Cubit<ResetPasswordStates>
{
  ResetPasswordCubit() : super(AppResetPasswordInitialState());

  static ResetPasswordCubit get(context)=> BlocProvider.of(context);


  final TextEditingController passwordController = TextEditingController();

  bool visiblePassword = true;


  IconData suffix =Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword =!isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined ;
    emit(AppResetPasswordInitialState());
  }

}