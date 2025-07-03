import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/vehicles/data/models/add_vehicle_request_body.dart';
import 'package:roadapp/features/vehicles/data/models/brands_response.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';
import 'package:roadapp/features/vehicles/data/repos/vehicles_repo.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_state.dart';

class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit(this._vehiclesRepo) : super(VehiclesInitial());
  static VehiclesCubit get(context) => BlocProvider.of(context);
  final VehiclesRepo _vehiclesRepo;

  TextEditingController carController = TextEditingController();
  TextEditingController manufactureYearController = TextEditingController();
  TextEditingController platNumberController = TextEditingController();
  TextEditingController ccsNumberController = TextEditingController();
  TextEditingController enginNumberController = TextEditingController();
  TextEditingController chassisNumberController = TextEditingController();
  TextEditingController tankCapacityController = TextEditingController();

  var addVehicleFormKey = GlobalKey<FormState>();

  int vehiclesPage = 1;

  List<Vehicle>? vehicles;
  List<String> transmissionTypes = ['AUTO', 'MANUAL'];

  String? selectedBrand, transmissionType;


  String? selectedBrandId;
  String? selectedModelName;
  int? selectedYear;

  void changeSelectedBrand(String? brandId) {
    selectedBrandId = brandId;
    selectedModelName = null;
    selectedYear = null;
    emit(BrandChangedState());
  }

  void changeSelectedModel(String? modelName) {
    selectedModelName = modelName;
    selectedYear = null;
    emit(ModelChangedState());
  }

  void changeSelectedYear(int? year) {
    selectedYear = year;
    emit(YearChangedState());
  }
  List<BrandRes>? brands;
  bool isLoading = false;
  fetchBrands() async {
    emit(FetchingBrandsLoadingState());
    final response = await _vehiclesRepo.fetchBrands();
    response.when(success: (brandsResponse) async {
      brands = brandsResponse.data?.brands;
      isLoading = false;

      emit(BrandsSuccessState(brandsResponse.data?.brands));
    }, failure: (error) {
      isLoading = false;

      emit(BrandsErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


  fetchVehicles({int page = 1, int limit = 35, bool? more}) async {
    if (more == true) {
      isLoading = true;
      emit(MoreLoadingState());
    } else {
      isLoading = true;
      emit(FetchingVehiclesLoadingState());
    }

    final response =
    await _vehiclesRepo.fetchVehicles(page: page, limit: limit);

    response.when(success: (vehiclesResponse) async {
      if (more != true) {
        vehicles = vehiclesResponse.data?.vehicles ?? [];
        vehiclesPage = 1;
      } else {
        vehicles?.addAll(vehiclesResponse.data?.vehicles ?? []);
        vehiclesPage ++;
      }

      emit(VehiclesSuccessState(vehicles));
    }, failure: (error) {
      emit(VehiclesErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


  addVehicle(AddVehicleRequestBody body) async {
    emit(AddVehicleLoadingState());
    final response = await _vehiclesRepo.addVehicle(body);
    response.when(success: (creationResponse) async {
      clearFields();
      emit(AddVehicleSuccessState());
    }, failure: (error) {
      emit(AddVehicleErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  validateToAddVehicle() {
    if (addVehicleFormKey.currentState!.validate() &&
        selectedBrandId != null &&
        transmissionType != null) {
      addVehicle(AddVehicleRequestBody(
          make: selectedBrandId!,
         // model: carController.text.trim(),
          model: selectedModelName!,
          modelAr: 'modelAr',
          tankCapacity: tankCapacityController.text.trim(),
          motorNumber: enginNumberController.text.trim(),
          chassisNumber: chassisNumberController.text.trim(),
          plateNumber: platNumberController.text.trim(),
          //manufacturingYear: int.parse(selectedYear.text.trim()),
          manufacturingYear: selectedYear,
          engineType: 'PETROL',
          gearShiftType: transmissionType!,
          brandId: selectedBrandId!,
          CCNumber: int.parse(ccsNumberController.text.trim())));
    }
    return;
  }

  // void changeSelectedBrand(String brand) {
  //   selectedBrand = brand;
  //   emit(SelectedBrandState());
  // }

  void changeTransmissionType(String type) {
    transmissionType = type;
    emit(SelectedBrandState());
  }

  clearFields() {
    carController.clear();
    manufactureYearController.clear();
    platNumberController.clear();
    ccsNumberController.clear();
    enginNumberController.clear();
    chassisNumberController.clear();
    tankCapacityController.clear();
    selectedBrand = null;
    transmissionType = null;
  }
}