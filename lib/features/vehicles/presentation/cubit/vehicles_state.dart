import 'package:roadapp/features/vehicles/data/models/brands_response.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';

sealed class VehiclesState {}

final class VehiclesInitial extends VehiclesState {}

final class FetchingVehiclesLoadingState extends VehiclesState {}

final class AddVehicleLoadingState extends VehiclesState {}

final class SelectedBrandState extends VehiclesState {}

final class AddVehicleSuccessState extends VehiclesState {}

final class FetchingBrandsLoadingState extends VehiclesState {}

final class BrandsErrorState extends VehiclesState {
  final String error;
  BrandsErrorState(this.error);
}

final class BrandsSuccessState extends VehiclesState {
  final List<Brand>? brands;
  BrandsSuccessState(this.brands);
}

final class VehiclesErrorState extends VehiclesState {
  final String error;
  VehiclesErrorState(this.error);
}

final class AddVehicleErrorState extends VehiclesState {
  final String error;
  AddVehicleErrorState(this.error);
}

final class VehiclesSuccessState extends VehiclesState {
  final List<Vehicle>? vehicles;
  VehiclesSuccessState(this.vehicles);
}