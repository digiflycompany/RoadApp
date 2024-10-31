import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/vehicles/data/models/add_vehicle_request_body.dart';
import 'package:roadapp/features/vehicles/data/models/brands_response.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';
import 'package:roadapp/features/vehicles/data/repo/vehicles_repo.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_state.dart';

class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit(this._vehiclesRepo) : super(VehiclesInitial());
  static VehiclesCubit get(context) => BlocProvider.of(context);
  final VehiclesRepo _vehiclesRepo;

  TextEditingController companyController = TextEditingController();
  TextEditingController carController = TextEditingController();
  TextEditingController manufactureYearController = TextEditingController();
  TextEditingController platNumberController = TextEditingController();
  TextEditingController gearShiftController = TextEditingController();
  TextEditingController ccsNumberController = TextEditingController();
  TextEditingController enginNumberController = TextEditingController();
  TextEditingController chassisNumberController = TextEditingController();
  TextEditingController tankCapacityController = TextEditingController();

  var addVehicleFormKey = GlobalKey<FormState>();

  List<Vehicle>? vehicles;
  List<Brand>? brands;

  fetchVehicles() async {
    emit(FetchingVehiclesLoadingState());
    final response = await _vehiclesRepo.fetchVehicles();
    response.when(success: (vehiclesResponse) async {
      vehicles = vehiclesResponse.data?.vehicles;
      emit(VehiclesSuccessState(vehiclesResponse.data?.vehicles));
    }, failure: (error) {
      emit(VehiclesErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  fetchBrands() async {
    emit(FetchingBrandsLoadingState());
    final response = await _vehiclesRepo.fetchBrands();
    response.when(success: (brandsResponse) async {
      brands = brandsResponse.data?.brands;
      emit(BrandsSuccessState(brandsResponse.data?.brands));
    }, failure: (error) {
      emit(BrandsErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  addVehicle(AddVehicleRequestBody body) async {
    emit(AddVehicleLoadingState());
    final response = await _vehiclesRepo.addVehicle(body);
    response.when(success: (creationResponse) async {
      emit(AddVehicleSuccessState());
    }, failure: (error) {
      emit(AddVehicleErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  validateToAddVehicle() {
    if (addVehicleFormKey.currentState!.validate()) {
      addVehicle(AddVehicleRequestBody(
          make: companyController.text.trim(),
          model: carController.text.trim(),
          modelAr: 'modelAr',
          tankCapacity: tankCapacityController.text.trim(),
          motorNumber: enginNumberController.text.trim(),
          chassisNumber: chassisNumberController.text.trim(),
          plateNumber: platNumberController.text.trim(),
          engineType: 'PETROL',
          gearShiftType: gearShiftController.text.trim(),
          brandId: 'LM2sUoD14a',
          CCNumber: int.parse(ccsNumberController.text.trim())));
    }
    return;
  }
}