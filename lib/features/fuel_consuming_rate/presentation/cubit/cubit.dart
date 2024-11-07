import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/fuel_rates_response.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/repos/fuel_rates_repo.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/states.dart';

class FuelConsumingRateCubit extends Cubit<FuelConsumingRateStates> {
  FuelConsumingRateCubit(this._repo) : super(InitialFuelConsumingRateStates());
  static FuelConsumingRateCubit get(context) => BlocProvider.of(context);
  final FuelRatesRepo _repo;
  
  TextEditingController fuelMeterBeforeAddingFuelController =
      TextEditingController();
  TextEditingController odometerController = TextEditingController();
  TextEditingController kmsController = TextEditingController();
  TextEditingController kmGmController = TextEditingController();
  TextEditingController kmLiterController = TextEditingController();
  TextEditingController litersController = TextEditingController();
  TextEditingController literPriceController = TextEditingController();
  TextEditingController fullTankPriceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  List<Ride> rates = [];

  void disposeControllers() {
    fuelMeterBeforeAddingFuelController.clear();
    odometerController.clear();
    kmsController.clear();
    kmGmController.clear();
    kmLiterController.clear();
    litersController.clear();
    literPriceController.clear();
    fullTankPriceController.clear();
  }

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }

  void addFuelReport(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pop(context);
    }
  }

  fetchFuelRates() async {
    emit(FetchingFuelRatesLoadingState());
    final response = await _repo.fetchFuelRates();
    response.when(success: (response) async {
      rates = response.data?.rides ?? [];
      DefaultLogger.logger.d(rates);
      emit(FuelRatesSuccessState(response.data?.rides ?? []));
    }, failure: (error) {
      emit(FuelRatesErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}