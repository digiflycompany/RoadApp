import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/modules/vehicles_category/cubit/states.dart';

class VehiclesCategoryCubit extends Cubit<VehiclesCategoryStates>{
  VehiclesCategoryCubit() : super(InitialVehiclesCategoryStates());

  static VehiclesCategoryCubit get(context)=> BlocProvider.of(context);




}