abstract class PasswordRecoveryStates {}

class PasswordRecoveryInitState extends PasswordRecoveryStates {}
class RequestCodeSuccessState extends PasswordRecoveryStates {}
class VerifyCodeSuccessState extends PasswordRecoveryStates {}
