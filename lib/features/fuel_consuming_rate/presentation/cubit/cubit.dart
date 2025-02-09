import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
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

  int? oldOdometerBefore;
  int? oldKmTotalPriceBefore ;
  int? oldKmTotalLitersBefore ;


  void calculateDerivedValues() {

    try {
      final odometerBefore = int.tryParse(odometerController.text);
      if (odometerBefore != null && oldOdometerBefore != null) {
        final kms = odometerBefore - oldOdometerBefore! ;
        kmsController.text = kms.toString();

        if (oldKmTotalPriceBefore != null) {
          final kmGm = kms / oldKmTotalLitersBefore!;
          kmLiterController.text = kmGm.toStringAsFixed(2);
        }

        if (oldKmTotalLitersBefore != null) {
          final liters = kms / oldKmTotalPriceBefore!;
          kmGmController.text = liters.toStringAsFixed(2);
        }

        calculateFullTankPrice();
        emit(FuelRateCalculationState()); // Trigger UI update

      }
    } catch (e) {
      debugPrint("Error in calculation: $e");
    }
    if(rates.isEmpty){
      kmGmController.text = '0';
      kmLiterController.text = '0';
      kmsController.text = '0';
    }
  }

  void calculateFullTankPrice() {
    try {
      final liters = double.tryParse(litersController.text) ?? 0;
      final literPrice = double.tryParse(literPriceController.text) ?? 0;
      final fullTankPrice = liters * literPrice;
      fullTankPriceController.text = fullTankPrice.toStringAsFixed(2);
    } catch (e) {
      debugPrint("Error in full tank price calculation: $e");
    }
  }

  void validateToAddRate(BuildContext context) {
    if (formKey.currentState!.validate()) {

      try {
        addRate(AddRateRequestBody(
          odometerBefore: _parseDouble(odometerController.text, "Odometer Before"),
          kmCount: _parseDouble(kmsController.text, "KM Count"),
          kmPerLiter: _parseDouble(kmLiterController.text, "KM Per Liter"),
          kmPerEGP: _parseDouble(kmGmController.text, "KM Per EGP"),
          literCount: _parseDouble(litersController.text, "Liter Count"),
          literPrice: _parseDouble(literPriceController.text, "Liter Price"),
          fullTankPrice: _parseDouble(fullTankPriceController.text, "Full Tank Price"),
        ),context);
        // fetchFuelRates();
        // emit(GetFuelRateState());
      } catch (e) {
        debugPrint("Error parsing numbers: $e");
      }
    }
  }

  // void validateToAddRate(BuildContext context) {
  //   if (formKey.currentState!.validate()) {
  //     try {
  //      // kmsController = oldOdometerBefore - odometerController;
  //      // kmGmController = kmsController / oldKmTotalPriceBefore;
  //      // litersController = kmsController / oldKmTotalLitersBefore;
  //      // fullTankPriceController = litersController * literPriceController;
  //       addRate(AddRateRequestBody(
  //         odometerBefore:
  //             _parseDouble(odometerController.text, "Odometer Before"),
  //         kmCount: _parseDouble(kmsController.text, "KM Count"),
  //         kmPerLiter: _parseDouble(kmLiterController.text, "KM Per Liter"),
  //         kmPerEGP: _parseDouble(kmGmController.text, "KM Per EGP"),
  //         literCount: _parseDouble(litersController.text, "Liter Count"),
  //         literPrice: _parseDouble(literPriceController.text, "Liter Price"),
  //         fullTankPrice:
  //             _parseDouble(fullTankPriceController.text, "Full Tank Price"),
  //       ));
  //     } catch (e) {
  //       debugPrint("Error parsing numbers: $e");
  //     }
  //   }
  // }

  double _parseDouble(String text, String fieldName) {
    String cleanedText = text.trim();
    if (cleanedText.isEmpty) {
      debugPrint("$fieldName is empty, using default value 0.0");
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

        if(rates.isNotEmpty){
          oldOdometerBefore = rates[0].odometerBefore!.toInt();
          debugPrint('====> $oldOdometerBefore');
          oldKmTotalPriceBefore = rates[0].fullTankPrice!.toInt();
          debugPrint('====> $oldKmTotalPriceBefore');
          oldKmTotalLitersBefore = rates[0].literCount!.toInt();
          debugPrint('====> $oldKmTotalLitersBefore');
        }else{
          oldOdometerBefore = 0;
          oldKmTotalPriceBefore = 0;
          oldKmTotalLitersBefore = 0;
        }
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

  addRate(AddRateRequestBody body,context) async {
    emit(AddRateLoadingState());
    final response = await _repo.addRate(body);

    response.when(
      success: (response) async {
        clearControllers();
        emit(RateAddedState());
        Navigator.pop(context);

      },
      failure: (error) {
        final errorMessage = error.apiErrorModel.message ?? 'Unknown Error!';
        emit(AddRateErrorState(errorMessage));
      }
    );
  }
}