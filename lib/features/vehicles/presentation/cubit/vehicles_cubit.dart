import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/vehicles/data/repo/vehicles_repo.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_state.dart';

class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit(this._vehiclesRepo) : super(VehiclesInitial());
  static VehiclesCubit get(context) => BlocProvider.of(context);
  final VehiclesRepo _vehiclesRepo;

  fetchVehicles() async {
    emit(FetchingVehiclesLoadingState());
    final response = await _vehiclesRepo.fetchVehicles();

    response.when(success: (vehiclesResponse) async {
      emit(VehiclesSuccessState(vehiclesResponse.data?.vehicles));
    }, failure: (error) {
      emit(VehiclesErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}