import '../../../../vehicles/data/models/vehicles_response.dart';

sealed class AddMemoState {}

final class AddMemoInitial extends AddMemoState {}

final class NoteAddedState extends AddMemoState {}

final class MemoPickupDateStates extends AddMemoState {}

final class MemoDropdownChangedState extends AddMemoState {}
final class AddMemoLoadingCustomersReportsState extends AddMemoState {}
final class SuccessCustomersReportsState extends AddMemoState {}
final class ErrorCustomersReportsState extends AddMemoState {}
final class UserTypeCheckedState extends AddMemoState {}
final class ClientSelectedState extends AddMemoState {
  final String clientId;

  ClientSelectedState(this.clientId);
}

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