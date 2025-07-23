import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/features/password_recovery/data/model/get_code_request_body.dart';
import 'package:roadapp/features/password_recovery/data/model/verify_email_request_body.dart';
import 'package:roadapp/features/password_recovery/data/model/verify_email_reset_request_body.dart';
import 'package:roadapp/features/password_recovery/data/repo/recovery_repo.dart';
import 'package:roadapp/features/password_recovery/presentation/cubit/password_recovery_states.dart';

class PasswordRecoveryCubit extends Cubit<PasswordRecoveryStates> {
  PasswordRecoveryCubit(this._recoveryRepo)
      : super(PasswordRecoveryInitState());
  static PasswordRecoveryCubit get(context) => BlocProvider.of(context);
  final RecoveryRepo _recoveryRepo;

  var emailController = TextEditingController();
  final requestFormKey = GlobalKey<FormState>();
  final codeFormKey = GlobalKey<FormState>();
  String? verificationCode;

  setCode(String code) {
    verificationCode = code;
  }

  validateToRequestCode(BuildContext context,{bool? resendResetPasswordCode,}) {
    if (requestFormKey.currentState!.validate()) {
      requestCode(GetCodeRequestBody(email: emailController.text.trim()),
          resendResetPasswordCode,context);
    }
  }

  requestCode(GetCodeRequestBody body, bool? resendResetPasswordCode, BuildContext context) async {
    emit(RequestCodeLoadingState());
    final response = await _recoveryRepo.getCode(body);

    response.when(success: (response) async {
      if (resendResetPasswordCode == null) {
        // emailController.clear();
        emit(RequestCodeSuccessState());
      } else {
        Navigator.pop(context);
        emit(ResendRequestCodeSuccessState());
      }
    }, failure: (error) {
      emit(RequestCodeErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  validateToVerifyCode({bool? justRegistered}) {
    if (codeFormKey.currentState!.validate()) {
      justRegistered == true
          ? verifyCode(VerifyEmailRequestBody(code: verificationCode!))
          : verifyCodeToReset(VerifyEmailResetRequestBody(
              resetPasswordCode: verificationCode!,
              email: emailController.text.trim()));
    }
  }

  verifyCode(VerifyEmailRequestBody body) async {
    emit(VerificationLoadingState());
    final response = await _recoveryRepo.verifyEmail(body);

    response.when(success: (loginResponse) async {
      await CacheHelper().saveData(CacheVars.isVerified, true);
      emit(VerifyCodeSuccessState());
    }, failure: (error) {
      emit(VerificationErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  verifyCodeToReset(VerifyEmailResetRequestBody body) async {
    emit(VerificationLoadingState());
    final response = await _recoveryRepo.verifyEmailToReset(body);

    response.when(success: (res) async {
      await CacheHelper().saveData(CacheVars.isVerified, true);
      await CacheHelper().saveData(CacheVars.accessToken, res.token);
      await CacheHelper().saveData("resetPasswordToken", res.token);
      emailController.clear();

      emit(VerifyCodeSuccessState());
    }, failure: (error) {
      emit(VerificationErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}
