import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/features/password_recovery/data/model/reset_password_request_body.dart';
import 'package:roadapp/features/password_recovery/data/repo/recovery_repo.dart';
import 'package:roadapp/features/reset%20password/presentation/cubit/state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit(this._recoveryRepo)
      : super(AppResetPasswordInitialState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  final RecoveryRepo _recoveryRepo;

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
    if (formKey.currentState!.validate()) {
      resetPassword();
    }
  }

  resetPassword() async {
    emit(ResetPasswordLoadingStates());

    final token = await CacheHelper().getData("resetPasswordToken");
    final formatedToken= "Bearer $token";

    final ResetPasswordRequestBody body =
        ResetPasswordRequestBody(password: passwordController.text.trim());

    final response = await _recoveryRepo.resetPassword(formatedToken, body);

    response.when(success: (response) {
      emit(ResetPasswordSuccessStates());
    }, failure: (error) {
      emit(ResetPasswordErrorStates(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}
