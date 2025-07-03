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


final class SupportsTypeUsLoading extends ContactUsState {}
final class SupportsTypeUsSuccess extends ContactUsState {}
final class SupportsTypeUsError extends ContactUsState {
  final String error;
  SupportsTypeUsError(this.error);
}

