import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/add_rate_request_body.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/fuel_rates_response.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/repos/fuel_rates_repo.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/states.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';
import 'package:roadapp/features/vehicles/data/repos/vehicles_repo.dart';

import '../../data/model/chart_response.dart';

class FuelConsumingRateCubit extends Cubit<FuelConsumingRateStates> {
  FuelConsumingRateCubit(this._repo, this._vehiclesRepo)
      : super(InitialFuelConsumingRateStates());
  static FuelConsumingRateCubit get(context) => BlocProvider.of(context);
  final FuelRatesRepo _repo;
  final VehiclesRepo _vehiclesRepo;

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
  int? oldKmTotalPriceBefore;
  int? oldKmTotalLitersBefore;

  void calculateDerivedValues() {
    try {
      final odometerBefore = int.tryParse(odometerController.text);

      print("::::::::::::::::: odometerBefore :: $odometerBefore");

      print("::::::::::::::::: oldOdometerBefore :: $oldOdometerBefore");
      print(
          "::::::::::::::::: oldKmTotalLitersBefore :: $oldKmTotalLitersBefore");
      print(
          "::::::::::::::::: oldKmTotalPriceBefore :: $oldKmTotalPriceBefore");

      if (odometerBefore != null && oldOdometerBefore != null) {
        final kms = odometerBefore - oldOdometerBefore!;
        kmsController.text = kms.toString();
        print("::::::::::::::::: kmsController :: ${kmsController.text}");

        // حساب KM لكل لتر
        if (oldKmTotalLitersBefore != null && oldKmTotalLitersBefore != 0) {
          final kmPerLiter = kms / oldKmTotalLitersBefore!;
          kmLiterController.text = kmPerLiter.toStringAsFixed(2);
          print(
              "::::::::::::::::: kmLiterController :: ${kmLiterController.text}");
        } else {
          kmLiterController.text = '0';
          print(
              "::::::::::::::::: kmLiterController :: ${kmLiterController.text}");
        }

        // حساب KM لكل جنيه
        if (oldKmTotalPriceBefore != null && oldKmTotalPriceBefore != 0) {
          final kmPerEGP = kms / oldKmTotalPriceBefore!;
          kmGmController.text = kmPerEGP.toStringAsFixed(2);
          print("::::::::::::::::: kmGmController :: ${kmGmController.text}");
        } else {
          kmGmController.text = '0';
          print("::::::::::::::::: kmGmController :: ${kmGmController.text}");
        }

        print(
            "::::::::::::::::: kmsController :: ${kmsController.text}:::::::::::::::::::::::::::::::::::::::");
        print(
            "::::::::::::::::: kmLiterController :: ${kmLiterController.text}:::::::::::::::::::::::::::::::::::::::");
        print(
            "::::::::::::::::: kmGmController :: ${kmGmController.text}:::::::::::::::::::::::::::::::::::::::");

        // حساب السعر الكلي للتانك
        calculateFullTankPrice();
        emit(FuelRateCalculationState());
      }
    } catch (e) {
      debugPrint("Error in calculation: $e");
    }

    // لو مفيش أي بيانات قبل كده
    if (rates.isEmpty) {
      kmGmController.text = '0';
      kmLiterController.text = '0';
      kmsController.text = '0';
    }
  }

  void calculateFullTankPrice() {
    try {
      final liters = double.tryParse(litersController.text);
      final literPrice = double.tryParse(literPriceController.text);
      print("::::::::::::::::: liters :: $liters");
      print("::::::::::::::::: literPrice :: $literPrice");
      final fullTankPrice = liters! * literPrice!;
      fullTankPriceController.text = fullTankPrice.toStringAsFixed(2);
      print(
          "::::::::::::::::: fullTankPriceController :: ${fullTankPriceController.text}");
    } catch (e) {
      debugPrint("Error in full tank price calculation: $e");
    }
  }

  void validateToAddRate(BuildContext context) {
    if (formKey.currentState!.validate()) {
      try {
        addRate(
            AddRateRequestBody(
              odometerBefore:
                  _parseDouble(odometerController.text, "Odometer Before"),
              kmCount: _parseDouble(kmsController.text, "KM Count"),
              kmPerLiter: _parseDouble(kmLiterController.text, "KM Per Liter"),
              kmPerEGP: _parseDouble(kmGmController.text, "KM Per EGP"),
              literCount: _parseDouble(litersController.text, "Liter Count"),
              literPrice:
                  _parseDouble(literPriceController.text, "Liter Price"),
              fullTankPrice:
                  _parseDouble(fullTankPriceController.text, "Full Tank Price"),
              vehicleId: selectedVehicleId,
            ),
            context);
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

  fetchFuelRates({
    int page = 1,
    int limit = 15,
    bool? more,
    String? vehicleId,
  }) async {
    more == true
        ? emit(MoreLoadingState())
        : emit(FetchingFuelRatesLoadingState());

    final response = await _repo.fetchFuelRates(
      page: page,
      limit: limit,
      vehicleId: vehicleId,
    );

    response.when(
      success: (response) async {
        if (more != true) {
          rates = response.data?.rides ?? [];

          if (rates.isNotEmpty) {
            oldOdometerBefore = rates[0].odometerBefore?.toInt(); //15600
            debugPrint('====> oldOdometerBefore: $oldOdometerBefore');

            oldKmTotalPriceBefore = rates[0].fullTankPrice?.toInt(); //0
            debugPrint('====> oldKmTotalPriceBefore: $oldKmTotalPriceBefore');

            oldKmTotalLitersBefore = rates[0].literCount?.toInt(); //25
            debugPrint('====> oldKmTotalLitersBefore: $oldKmTotalLitersBefore');
          } else {
            oldOdometerBefore = 0;
            oldKmTotalPriceBefore = 0;
            oldKmTotalLitersBefore = 0;
          }

          ratesPage = 1;
        } else {
          rates.addAll(response.data?.rides ?? []);
          ratesPage++;
        }

        emit(FuelRatesSuccessState(response.data?.rides ?? []));
      },
      failure: (error) {
        emit(FuelRatesErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!',
        ));
      },
    );
  }

  addRate(AddRateRequestBody body, context) async {
    emit(AddRateLoadingState());
    final response = await _repo.addRate(body);

    response.when(success: (response) async {
      clearControllers();
      emit(RateAddedState());
      Navigator.pop(context);
    }, failure: (error) {
      final errorMessage = error.apiErrorModel.message ?? 'Unknown Error!';
      emit(AddRateErrorState(errorMessage));
    });
  }

  List<ChartData> chartDataList = [];

  // fetchChart() async {
  //   emit(ChartLoadingState());
  //   final response = await _repo.fetchChart(selectedFilter.toString());
  //
  //   response.when(
  //       success: (response) async {
  //         chartDataList = response.data;
  //         emit(ChartSuccessState());
  //       },
  //       failure: (error) {
  //         final errorMessage = error.apiErrorModel.message ?? 'Unknown Error!';
  //         emit(ChartErrorState(errorMessage));
  //       }
  //   );
  // }

  int selectedChartFilter = 1;
  void changeSelectedChartFilter(int chartFilter) {
    selectedChartFilter = chartFilter;
    emit(ChangeSelectedVehicleState());
  }

  fetchChart(int selectedFilter, {String? vehicleId}) async {
    emit(ChartLoadingState());
    final response =
        await _repo.fetchChart(selectedFilter.toString(), vehicleId);

    response.when(
      success: (response) async {
        chartDataList = response.data
            .map((item) => ChartData(
                  label: item.label,
                  liters: item.liters,
                  km: item.km,
                ))
            .toList();

        emit(ChartSuccessState());
      },
      failure: (error) {
        final errorMessage = error.apiErrorModel.message ?? 'Unknown Error!';
        emit(ChartErrorState(errorMessage));
      },
    );
  }

  Vehicle? selectedVehicle;
  String? selectedVehicleId;
  List<Vehicle>? vehicles;
  void changeSelectedVehicle(Vehicle? vehicle, String? vehicleId) {
    selectedVehicle = vehicle;
    selectedVehicleId = vehicleId;
    emit(ChangeSelectedVehicleState());
  }

  Future<void> fetchVehicles() async {
    emit(FetchingVehiclesLoadingState());

    final response = await _vehiclesRepo.fetchVehicles();

    response.when(
      success: (vehiclesResponse) async {
        vehicles = vehiclesResponse.data?.vehicles ?? [];
        emit(VehiclesSuccessState(vehicles!));
      },
      failure: (error) {
        emit(VehiclesErrorState(
            error.apiErrorModel.message ?? 'Unknown Error!'));
      },
    );
  }
}
