import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';

sealed class VehiclesState {}

final class VehiclesInitial extends VehiclesState {}

final class FetchingVehiclesLoadingState extends VehiclesState {}

final class VehiclesErrorState extends VehiclesState {
  final String error;
  VehiclesErrorState(this.error);
}

final class VehiclesSuccessState extends VehiclesState {
  final List<Vehicle>? vehicles;
  VehiclesSuccessState(this.vehicles);
}