import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/reset%20password/presentation/cubit/state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(AppResetPasswordInitialState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool visiblePassword = true;
  bool visiblePassword2 = true;

  IconData suffix = Icons.visibility_off_outlined;
  IconData suffix2 = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    suffix = visiblePassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(AppResetPasswordInitialState());
  }
  void changePassword2Visibility() {
    visiblePassword2 = !visiblePassword2;
    suffix2 = visiblePassword2
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(AppResetPasswordInitialState());
  }

  validateToResetPassword() {
    if(formKey.currentState!.validate()) {
      resetPassword();
    }
  }

  resetPassword() {
    emit(ResetPasswordSuccessStates());
  }
}
