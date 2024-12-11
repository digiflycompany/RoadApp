sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}

class AuthSuccessState extends AuthState {}

class AppLoginSuccessState extends AuthState {
  final String uId;

  AppLoginSuccessState(this.uId);
}

class AppLoginErrorState extends AuthState {
  final String error;

  AppLoginErrorState(this.error);
}

class AppChangePasswordVisibilityState extends AuthState {}

class AppChangeRememberMeState extends AuthState {}

class ChangeLogInIndexState extends AuthState {}

class AppRegisterLoadingState extends AuthState {}

class AppRegisterSuccessState extends AuthState {
  final String uId;

  AppRegisterSuccessState(this.uId);
}

class AppRegisterErrorState extends AuthState {
  final String error;

  AppRegisterErrorState(this.error);
}

class ChangeRegisterIndexState extends AuthState {}

class ChangeUserTypeState extends AuthState {}


final class GetUserDataLoading extends AuthState {}
final class GetUserDataSuccess extends AuthState {}
final class GetUserDataError extends AuthState {}