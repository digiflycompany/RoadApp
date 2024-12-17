part of 'maintenance_service_type_cubit.dart';

@immutable
sealed class MaintenanceServiceTypeVendorState {}

final class MaintenanceServiceTypeInitial extends MaintenanceServiceTypeVendorState {}



final class ServicesTypeLoadingState extends MaintenanceServiceTypeVendorState {}
final class ServicesTypeLoadingMoreState extends MaintenanceServiceTypeVendorState {}
final class ServicesTypeErrorState extends MaintenanceServiceTypeVendorState {
  final String error;
  ServicesTypeErrorState(this.error);
}

final class ServiceTypeSuccessState extends MaintenanceServiceTypeVendorState {
  final List<Service>? serviceType;
  ServiceTypeSuccessState(this.serviceType);
}


final class SearchServicesTypeLoadingState extends MaintenanceServiceTypeVendorState {}
final class SearchServicesTypeLoadingMoreState extends MaintenanceServiceTypeVendorState {}
final class SearchServicesTypeErrorState extends MaintenanceServiceTypeVendorState {
  final String error;
  SearchServicesTypeErrorState(this.error);
}

final class SearchServiceTypeSuccessState extends MaintenanceServiceTypeVendorState {
  final List<Service>? serviceType;
  SearchServiceTypeSuccessState(this.serviceType);
}


final class SelectServicesProcessTypeState extends MaintenanceServiceTypeVendorState {}
final class ServicesTypeDropDawnLoadingState extends MaintenanceServiceTypeVendorState {}
final class ServicesTypeDropDawnLoadingMoreState extends MaintenanceServiceTypeVendorState {}
final class ServicesTypeDropDawnErrorState extends MaintenanceServiceTypeVendorState {
  final String error;
  ServicesTypeDropDawnErrorState(this.error);
}

final class ServiceTypeDropDawnSuccessState extends MaintenanceServiceTypeVendorState {
  final List<Service>? serviceType;
  ServiceTypeDropDawnSuccessState(this.serviceType);
}


final class AddServicesLoadingState extends MaintenanceServiceTypeVendorState {}
final class AddServicesSuccessState extends MaintenanceServiceTypeVendorState {}
final class AddServicesErrorState extends MaintenanceServiceTypeVendorState {
  final String error;
  AddServicesErrorState(this.error);
}


final class CarBrandDropDawnLoadingState extends MaintenanceServiceTypeVendorState {}
final class CarBrandDropDawnLoadingMoreState extends MaintenanceServiceTypeVendorState {}
final class CarBrandDropDawnErrorState extends MaintenanceServiceTypeVendorState {
  final String error;
  CarBrandDropDawnErrorState(this.error);
}

final class CarBrandDropDawnSuccessState extends MaintenanceServiceTypeVendorState {
  final List<Brand>? carBrand;
  CarBrandDropDawnSuccessState(this.carBrand);
}


final class AddServicesSuggestionLoadingState extends MaintenanceServiceTypeVendorState {}
final class AddServicesSuggestionSuccessState extends MaintenanceServiceTypeVendorState {}
final class AddServicesSuggestionErrorState extends MaintenanceServiceTypeVendorState {
  final String error;
  AddServicesSuggestionErrorState(this.error);
}