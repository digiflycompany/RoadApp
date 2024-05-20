import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/models/appointment_reservation_management/appointment_reservation_management_model.dart';
import 'package:roadapp/modules/reserve_appointment/cubit/reserve_appointment_state.dart';
import 'package:roadapp/modules/reserve_appointment/views/widgets/products_reservation_management.dart';
import 'package:roadapp/modules/reserve_appointment/views/widgets/service_appointment_management.dart';

import '../model/appointment_model.dart';
import '../repo/appointment_repo.dart';

class ReserveAppointmentCubit extends Cubit<ReserveAppointmentStates> {
  ReserveAppointmentCubit() : super(ReserveAppointmentInitStates());

  final columns1 = ["اسم المركز", "نوع الاجراء", "التاريخ", "الوقت"];

  final columns2 = ["اسم المركز", "نوع الاجراء", "التاريخ", "الوقت"];

  final cells2 = [
    AppointmentReservationManagementModel(
        "العالمية للكوري", "تيل فرامل", "09/03/2023", "8م"),
    AppointmentReservationManagementModel(
        "العالمية للكوري", "فانوس أمامي", "09/03/2023", "8م"),
  ];

  final cells1 = [
    AppointmentReservationManagementModel(
        "مركز الوكيل", "صيانة دورة التبريد", "09/03/2023", "8م"),
    AppointmentReservationManagementModel(
        "مركز الوكيل", "صيانة دورة التبريد", "09/03/2023", "8م"),
  ];

  int index = 0;

  bool click = true;

  late final widgets = [
    ServiceAppointmentManagement(
      columns1: columns1,
      cells1: cells1,
    ),
    ProductsReservationManagement(
      columns2: columns2,
      cells2: cells2,
    ),
  ];

  void changeReservationType(int index, bool click) {
    this.index = index;
    this.click = click;
    emit(ReserveAppointmentChangeReservationTypeStates());
  }

  AppointmentRepo? repo = AppointmentRepo();
  AppointmentModel? appointmentModel;

// Future<void> getAppointment() async {
//   emit(CubitState.loading);
//   appointmentModel = await repo?.getAppointment();
//
//   if (appointmentModel == null) {
//     emit(CubitState.error);
//   } else {
//     emit(CubitState.done);
//   }
// }
}
