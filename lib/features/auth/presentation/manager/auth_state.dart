sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthSuccessState extends AuthState {}

class AppLoginSuccessState extends AuthState
{
  final String uId;

  AppLoginSuccessState(this.uId);

}

class AppLoginErrorState extends AuthState
{
  final String error;

  AppLoginErrorState(this.error);
}

class AppChangePasswordVisibilityState extends AuthState {}

class AppChangeRememberMeState extends AuthState {}

class ChangeLogInIndexState extends AuthState {}

class AppRegisterLoadingState extends AuthState {}

class AppRegisterSuccessState extends AuthState
{
  final String uId;

  AppRegisterSuccessState(this.uId);

}

class AppRegisterErrorState extends AuthState
{
  final String error;

  AppRegisterErrorState(this.error);
}

class ChangeRegisterIndexState extends AuthState {}

class ChangeUserTypeState extends AuthState {}