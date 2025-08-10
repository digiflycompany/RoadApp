abstract class ResetPasswordStates {}

class AppResetPasswordInitialState extends ResetPasswordStates {}

class ResetPasswordLoadingStates extends ResetPasswordStates {}

class ResetPasswordSuccessStates extends ResetPasswordStates {}

class ResetPasswordErrorStates extends ResetPasswordStates {
  final String? error;

  ResetPasswordErrorStates(this.error);
}
