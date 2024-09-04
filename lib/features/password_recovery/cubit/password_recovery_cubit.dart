import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_states.dart';

class PasswordRecoveryCubit extends Cubit<PasswordRecoveryStates> {
  PasswordRecoveryCubit() : super(PasswordRecoveryInitState());
  static PasswordRecoveryCubit get(context) => BlocProvider.of(context);

  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  final requestFormKey = GlobalKey<FormState>();
  final codeFormKey = GlobalKey<FormState>();

  validateToRequestCode() {
    if(requestFormKey.currentState!.validate()) {
      requestCode();
    }
  }

  requestCode() {
    emit(RequestCodeSuccessState());
  }

  validateToVerifyCode() {
    if(codeFormKey.currentState!.validate()) {
      verifyCode();
    }
  }

  verifyCode() {
    emit(VerifyCodeSuccessState());
  }
}
