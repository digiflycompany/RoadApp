part of 'customers_reports_cubit.dart';

@immutable
sealed class CustomersReportsState {}

final class CustomersReportsInitial extends CustomersReportsState {}

final class LoadingCustomersReportsState extends CustomersReportsState {}
final class SuccessCustomersReportsState extends CustomersReportsState {}
final class ErrorCustomersReportsState extends CustomersReportsState {}
