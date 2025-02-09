part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}
final class AddContactUsLoading extends ContactUsState {}
final class AddContactUsSuccess extends ContactUsState {}
final class AddContactUsError extends ContactUsState {
  final String error;
  AddContactUsError(this.error);
}
