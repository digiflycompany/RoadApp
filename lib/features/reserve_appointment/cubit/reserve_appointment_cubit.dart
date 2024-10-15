import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/reserve_appointment/cubit/reserve_appointment_state.dart';
import 'package:roadapp/features/reserve_appointment/data/models/appointment_model.dart';
import 'package:roadapp/features/reserve_appointment/data/models/appointment_reservation_management_model.dart';
import 'package:roadapp/features/reserve_appointment/views/widgets/products_reservation_management.dart';
import 'package:roadapp/features/reserve_appointment/views/widgets/service_appointment_management.dart';

class ReserveAppointmentCubit extends Cubit<ReserveAppointmentStates> {
  ReserveAppointmentCubit() : super(ReserveAppointmentInitStates());

  static ReserveAppointmentCubit get(context) => BlocProvider.of(context);

  final cells2 = [
    AppointmentReservationManagementModel(
        "العالمية للكوري", "تيل فرامل", "09/03/2023", "8م"),
    AppointmentReservationManagementModel(
        "العالمية للكوري", "فانوس أمامي", "09/03/2023", "8م")
  ];

  final cells1 = [
    AppointmentReservationManagementModel(
        "مركز الوكيل", "صيانة دورة التبريد", "09/03/2023", "8م"),
    AppointmentReservationManagementModel(
        "مركز الوكيل", "صيانة دورة التبريد", "09/03/2023", "8م")
  ];

  int index = 0;

  bool click = true;

  late final widgets = [
    ServiceAppointmentManagement(cells1: cells1),
    ProductsReservationManagement(cells2: cells2)
  ];

  void changeReservationType(int index, bool click) {
    this.index = index;
    this.click = click;
    emit(ReserveAppointmentChangeReservationTypeStates());
  }

  AppointmentModel? appointmentModel;
}