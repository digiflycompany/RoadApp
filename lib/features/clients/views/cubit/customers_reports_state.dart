part of 'customers_reports_cubit.dart';

@immutable
sealed class CustomersReportsState {}

final class CustomersReportsInitial extends CustomersReportsState {}

final class LoadingCustomersReportsState extends CustomersReportsState {}
final class SuccessCustomersReportsState extends CustomersReportsState {}
final class ErrorCustomersReportsState extends CustomersReportsState {}


final class VehiclesIdLoadingState extends CustomersReportsState {}
final class VehiclesIdSuccessState extends CustomersReportsState {}
final class VehiclesIdErrorState extends CustomersReportsState {
  final String error;

  VehiclesIdErrorState(this.error);
}
