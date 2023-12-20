abstract class RegisterStates {}

class AppRegisterInitialState extends RegisterStates {}

class AppRegisterLoadingState extends RegisterStates {}

class AppRegisterSuccessState extends RegisterStates
{
  final String uId;

  AppRegisterSuccessState(this.uId);

}

class AppRegisterErrorState extends RegisterStates
{
  final String error;

  AppRegisterErrorState(this.error);
}

class AppChangePasswordVisibilityState extends RegisterStates {}

class ChangeRegisterIndexState extends RegisterStates {}

class ChangeUsetTypeState extends RegisterStates {}