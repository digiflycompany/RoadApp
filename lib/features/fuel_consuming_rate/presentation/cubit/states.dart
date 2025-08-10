import 'package:roadapp/features/fuel_consuming_rate/data/model/fuel_rates_response.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';

abstract class FuelConsumingRateStates {}

class InitialFuelConsumingRateStates extends FuelConsumingRateStates {}

class FuelReportAddedState extends FuelConsumingRateStates {}

class FetchingFuelRatesLoadingState extends FuelConsumingRateStates {}
class MoreLoadingState extends FuelConsumingRateStates {}

class AddRateLoadingState extends FuelConsumingRateStates {}
class FuelRateCalculationState extends FuelConsumingRateStates {}
class GetFuelRateState extends FuelConsumingRateStates {}

class RateAddedState extends FuelConsumingRateStates {}

class AddRateErrorState extends FuelConsumingRateStates {
  final String errorMessage;
  AddRateErrorState(this.errorMessage);
}

class FuelRatesErrorState extends FuelConsumingRateStates {
  final String errorMessage;
  FuelRatesErrorState(this.errorMessage);
}

class FuelRatesSuccessState extends FuelConsumingRateStates {
  final List<Ride> rates;
  FuelRatesSuccessState(this.rates);
}

class ChartLoadingState extends FuelConsumingRateStates {}
class ChartSuccessState extends FuelConsumingRateStates {}
class ChartErrorState extends FuelConsumingRateStates {
  final String error;
  ChartErrorState(this.error);
}

final class FetchingVehiclesLoadingState extends FuelConsumingRateStates {}

final class VehiclesSuccessState extends FuelConsumingRateStates {
  final List<Vehicle>? vehicles;
  VehiclesSuccessState(this.vehicles);
}

final class VehiclesErrorState extends FuelConsumingRateStates {
  final String error;
  VehiclesErrorState(this.error);
}

final class ChangeSelectedVehicleState extends FuelConsumingRateStates {}


