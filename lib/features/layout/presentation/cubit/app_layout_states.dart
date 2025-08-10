import 'package:roadapp/features/account/data/models/profile_user_response.dart';

abstract class AppLayoutState {}

class AppLayoutInitState extends AppLayoutState {}

class AppBottomNavState extends AppLayoutState {}

class AccountLoadingState extends AppLayoutState {}

class AccountUserSuccessState extends AppLayoutState {
  final UserDataUser userData;
  AccountUserSuccessState(this.userData);
}

class AccountErrorState extends AppLayoutState {
  final String errorMessage;
  AccountErrorState(this.errorMessage);
}
