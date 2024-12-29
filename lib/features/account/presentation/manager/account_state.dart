import 'package:roadapp/features/account/data/models/account_response.dart';

import '../../data/models/profile_user_response.dart';

sealed class AccountState {}

final class AccountInitial extends AccountState {}
final class ChangeImageSuccessState extends AccountState {}
final class DeleteAccountSuccessState extends AccountState {}
final class UpdateProfileSuccessState extends AccountState {}
final class UpdateProfileErrorState extends AccountState {
  final String errorMessage;
  UpdateProfileErrorState(this.errorMessage);
}
final class UpdateProfileLoadingState extends AccountState {}
final class AccountLoadingState extends AccountState {}
final class AccountErrorState extends AccountState {
  final String errorMessage;
  AccountErrorState(this.errorMessage);
}
final class AccountSuccessState extends AccountState {
  final UserData userData;
  AccountSuccessState(this.userData);
}

final class AccountUserSuccessState extends AccountState {
  final UserDataUser userData;
  AccountUserSuccessState(this.userData);
}

final class UpdateMcSuccessState extends AccountState {}
final class UpdateMcErrorState extends AccountState {
  final String errorMessage;
  UpdateMcErrorState(this.errorMessage);
}
final class UpdateMcLoadingState extends AccountState {}