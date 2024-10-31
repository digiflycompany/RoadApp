abstract class PasswordRecoveryStates {}

class PasswordRecoveryInitState extends PasswordRecoveryStates {}

class RequestCodeSuccessState extends PasswordRecoveryStates {}

class VerifyCodeSuccessState extends PasswordRecoveryStates {}

class VerificationLoadingState extends PasswordRecoveryStates {}

class VerificationErrorState extends PasswordRecoveryStates {
  final String error;
  VerificationErrorState(this.error);
}