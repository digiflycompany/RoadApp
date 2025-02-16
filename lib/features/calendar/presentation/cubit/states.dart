import '../../../vehicles/data/models/vehicles_response.dart';

abstract class CalendarState{}

class CalendarInitState extends CalendarState{}
class MoreLoadingState extends CalendarState{}
class BoxUpdatedState extends CalendarState{}
class FetchingMemosLoadingState extends CalendarState{}
class MemosSuccessState extends CalendarState{}
class MemosFilteredState extends CalendarState{}
class VehiclesLoadedState extends CalendarState{}
class VehicleHomeSelectedState extends CalendarState{
  final List<Vehicle>? vehicles;
  VehicleHomeSelectedState(this.vehicles);
}
class MemosErrorState extends CalendarState{
  final String errorMessage;
  MemosErrorState(this.errorMessage);
}




class FetchingVehiclesLoadingState extends CalendarState{}
class VehicleSelectedState extends CalendarState{
  final String vehicle;
  VehicleSelectedState(this.vehicle);
}
class VehiclesDropDownSuccessState extends CalendarState{
  final List<Vehicle>? vehicles;
  VehiclesDropDownSuccessState(this.vehicles);
}
class VehiclesDropDownErrorState extends CalendarState{
  final String errorMessage;
  VehiclesDropDownErrorState(this.errorMessage);
}