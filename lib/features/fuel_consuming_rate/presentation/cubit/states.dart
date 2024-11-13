
import 'package:roadapp/features/fuel_consuming_rate/data/model/fuel_rates_response.dart';

abstract class FuelConsumingRateStates {}

class InitialFuelConsumingRateStates extends FuelConsumingRateStates {}

class FuelReportAddedState extends FuelConsumingRateStates {}

class FetchingFuelRatesLoadingState extends FuelConsumingRateStates {}
class MoreLoadingState extends FuelConsumingRateStates {}

class AddRateLoadingState extends FuelConsumingRateStates {}

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
