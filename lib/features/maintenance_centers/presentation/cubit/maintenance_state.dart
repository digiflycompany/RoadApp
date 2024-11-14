sealed class MaintenanceState {}

final class MaintenanceInitial extends MaintenanceState {}

final class BoxUpdatedState extends MaintenanceState {}

final class GetMaintenanceCenterLoading extends MaintenanceState {}
final class GetMaintenanceCenterSuccess extends MaintenanceState {}
final class GetMaintenanceCenterError extends MaintenanceState {}

final class GetMaintenanceCenterMoreLoading extends MaintenanceState {}
final class GetMaintenanceCenterMoreSuccess extends MaintenanceState {}
final class GetMaintenanceCenterMoreError extends MaintenanceState {}