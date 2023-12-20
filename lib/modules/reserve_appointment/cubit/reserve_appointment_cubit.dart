import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cubit/global_cubit_state.dart';
import '../model/appointment_model.dart';
import '../repo/appointment_repo.dart';

class AppointmentCubit extends Cubit<CubitState> {
  AppointmentCubit() : super(CubitState.initial);

  AppointmentRepo? repo = AppointmentRepo();
  AppointmentModel? appointmentModel;

  Future<void> getAppointment() async {
    emit(CubitState.loading);
    appointmentModel = await repo?.getAppointment();

    if (appointmentModel == null) {
      emit(CubitState.error);
    } else {
      emit(CubitState.done);
    }
  }
}
