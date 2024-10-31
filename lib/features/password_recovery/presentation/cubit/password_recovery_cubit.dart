import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/features/password_recovery/data/model/verify_email_request_body.dart';
import 'package:roadapp/features/password_recovery/data/repo/recovery_repo.dart';
import 'package:roadapp/features/password_recovery/presentation/cubit/password_recovery_states.dart';

class PasswordRecoveryCubit extends Cubit<PasswordRecoveryStates> {
  PasswordRecoveryCubit(this._recoveryRepo) : super(PasswordRecoveryInitState());
  static PasswordRecoveryCubit get(context) => BlocProvider.of(context);
  final RecoveryRepo _recoveryRepo;

  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  final requestFormKey = GlobalKey<FormState>();
  final codeFormKey = GlobalKey<FormState>();
  String? verificationCode;

  setCode(String code) {
    verificationCode = code;
  }

  validateToRequestCode() {
    if (requestFormKey.currentState!.validate()) {
      requestCode();
    }
  }

  requestCode() {
    emit(RequestCodeSuccessState());
  }

  validateToVerifyCode() {
    if (codeFormKey.currentState!.validate()) {
      verifyCode(VerifyEmailRequestBody(code: verificationCode!));
    }
  }

  verifyCode(VerifyEmailRequestBody body) async {
    emit(VerificationLoadingState());
    final response = await _recoveryRepo.verifyEmail(body);

    response.when(success: (loginResponse) async {
      await CacheHelper()
          .saveData(CacheVars.isVerified, true);
      emit(VerifyCodeSuccessState());
    }, failure: (error) {
      emit(VerificationErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}