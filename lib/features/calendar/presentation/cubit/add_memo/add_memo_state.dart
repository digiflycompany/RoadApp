import '../../../../vehicles/data/models/vehicles_response.dart';

sealed class AddMemoState {}

final class AddMemoInitial extends AddMemoState {}

final class NoteAddedState extends AddMemoState {}

final class MemoPickupDateStates extends AddMemoState {}

final class MemoDropdownChangedState extends AddMemoState {}

final class AddingMemoLoadingState extends AddMemoState {}

final class AddMemoErrorState extends AddMemoState {
  final String error;

  AddMemoErrorState(this.error);
}

class FetchingVehiclesLoadingState extends AddMemoState{}
class VehicleSelectedState extends AddMemoState{
  final String vehicle;
  VehicleSelectedState(this.vehicle);
}
class VehiclesDropDownSuccessState extends AddMemoState{
  final List<Vehicle>? vehicles;
  VehiclesDropDownSuccessState(this.vehicles);
}
class VehiclesDropDownErrorState extends AddMemoState{
  final String errorMessage;
  VehiclesDropDownErrorState(this.errorMessage);
}