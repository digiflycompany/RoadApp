import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_state.dart';

class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit() : super(VehiclesInitial());
  static VehiclesCubit get(context) => BlocProvider.of(context);
}