import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(AppLoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool visiblePassword = true;
  bool rememberMe = true;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(AppLoginLoadingState());
  }

  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    suffix = visiblePassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(AppChangePasswordVisibilityState());
  }

  void changeRememberMeCheck(bool ? val){
    rememberMe = val!;
    emit(AppChangeRememberMeState());
  }


  int index = 0;

  void changeRegisterIndex(int index) {
    this.index = index;
    emit(ChangeLogInIndexState());
  }
}
