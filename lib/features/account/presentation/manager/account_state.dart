sealed class AccountState {}

final class AccountInitial extends AccountState {}
final class ChangeImageSuccessState extends AccountState {}
final class DeleteAccountSuccessState extends AccountState {}
final class UpdateProfileSuccessState extends AccountState {}
