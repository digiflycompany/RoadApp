abstract class LoginStates {}

class AppLoginInitialState extends LoginStates {}

class AppLoginLoadingState extends LoginStates {}

class AppLoginSuccessState extends LoginStates
{
  final String uId;

  AppLoginSuccessState(this.uId);

}

class AppLoginErrorState extends LoginStates
{
  final String error;

  AppLoginErrorState(this.error);
}

class AppChangePasswordVisibilityState extends LoginStates {}

class ChangeLogInIndexState extends LoginStates {}