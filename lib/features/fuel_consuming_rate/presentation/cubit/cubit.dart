import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/add_rate_request_body.dart';
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

  int ratesPage = 1;

  void clearControllers() {
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
    clearControllers();
    return super.close();
  }

  void validateToAddRate(BuildContext context) {
    if (formKey.currentState!.validate()) {
      try {
        addRate(AddRateRequestBody(
          odometerBefore:
              _parseDouble(odometerController.text, "Odometer Before"),
          kmCount: _parseDouble(kmsController.text, "KM Count"),
          kmPerLiter: _parseDouble(kmLiterController.text, "KM Per Liter"),
          kmPerEGP: _parseDouble(kmGmController.text, "KM Per EGP"),
          literCount: _parseDouble(litersController.text, "Liter Count"),
          literPrice: _parseDouble(literPriceController.text, "Liter Price"),
          fullTankPrice:
              _parseDouble(fullTankPriceController.text, "Full Tank Price"),
        ));
      } catch (e) {
        print("Error parsing numbers: $e");
      }
    }
  }

  double _parseDouble(String text, String fieldName) {
    String cleanedText = text.trim();
    if (cleanedText.isEmpty) {
      print("$fieldName is empty, using default value 0.0");
      return 0.0;
    }
    double? parsedValue = double.tryParse(cleanedText.replaceAll(',', ''));
    if (parsedValue == null) {
      throw FormatException("$fieldName has invalid format");
    }
    return parsedValue;
  }

  fetchFuelRates({int page = 1, int limit = 15, bool? more}) async {
    more == true? emit(MoreLoadingState()): emit(FetchingFuelRatesLoadingState());
    final response = await _repo.fetchFuelRates(page: page, limit: limit);
    response.when(success: (response) async {

      if (more != true) {
        rates = response.data?.rides ?? [];
        ratesPage = 1;
      } else {
        rates.addAll(response.data?.rides ?? []);
        ratesPage ++;
      }
      emit(FuelRatesSuccessState(response.data?.rides ?? []));
    }, failure: (error) {
      emit(
          FuelRatesErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  addRate(AddRateRequestBody body) async {
    emit(AddRateLoadingState());
    final response = await _repo.addRate(body);

    response.when(
      success: (response) async {
        clearControllers();
        emit(RateAddedState());
      },
      failure: (error) {
        final errorMessage = error.apiErrorModel.message ?? 'Unknown Error!';
        emit(AddRateErrorState(errorMessage));
      }
    );
  }
}