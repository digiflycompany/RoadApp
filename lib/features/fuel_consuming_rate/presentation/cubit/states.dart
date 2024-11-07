import 'package:roadapp/features/fuel_consuming_rate/data/model/fuel_rates_response.dart';

abstract class FuelConsumingRateStates {}

class InitialFuelConsumingRateStates extends FuelConsumingRateStates {}

class FuelReportAddedState extends FuelConsumingRateStates {}

class FetchingFuelRatesLoadingState extends FuelConsumingRateStates {}

class FuelRatesErrorState extends FuelConsumingRateStates {
  final String errorMessage;
  FuelRatesErrorState(this.errorMessage);
}

class FuelRatesSuccessState extends FuelConsumingRateStates {
  final List<Ride> rates;
  FuelRatesSuccessState(this.rates);
}