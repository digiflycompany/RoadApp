part of 'maintenance_service_type_cubit.dart';

@immutable
sealed class MaintenanceServiceTypeState {}

final class MaintenanceServiceInitial extends MaintenanceServiceTypeState {}

final class GetServiceTypeLoading extends MaintenanceServiceTypeState {}
final class GetServiceTypeSuccess extends MaintenanceServiceTypeState {}
final class GetServiceTypeError extends MaintenanceServiceTypeState {}


final class GetServiceTypeMoreLoading extends MaintenanceServiceTypeState {}
final class GetServiceTypeMoreSuccess extends MaintenanceServiceTypeState {}
final class GetServiceTypeMoreError extends MaintenanceServiceTypeState {}

final class GetSearchServiceTypeLoading extends MaintenanceServiceTypeState {}
final class GetSearchServiceTypeSuccess extends MaintenanceServiceTypeState {}
final class GetSearchServiceTypeError extends MaintenanceServiceTypeState {}


final class FetchProductTypeLoading extends MaintenanceServiceTypeState {}
final class FetchProductTypeSuccess extends MaintenanceServiceTypeState {}
final class FetchProductTypeError extends MaintenanceServiceTypeState {}


