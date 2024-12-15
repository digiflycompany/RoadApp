part of 'customers_reports_cubit.dart';

@immutable
sealed class CustomersReportsState {}

final class CustomersReportsInitial extends CustomersReportsState {}

final class LoadingCustomersReportsState extends CustomersReportsState {}
final class SuccessCustomersReportsInitial extends CustomersReportsState {}
final class ErrorCustomersReportsInitial extends CustomersReportsState {}
