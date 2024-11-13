import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/reserve_appointment/data/repos/reservations_repo.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_state.dart';
import 'package:roadapp/features/reserve_appointment/presentation/views/widgets/products_reservation_management.dart';
import 'package:roadapp/features/reserve_appointment/presentation/views/widgets/service_appointment_management.dart';

class ReserveAppointmentCubit extends Cubit<ReserveAppointmentStates> {
  ReserveAppointmentCubit(this._repo) : super(ReserveAppointmentInitStates());
  final ReservationsRepo _repo;
  static ReserveAppointmentCubit get(context) => BlocProvider.of(context);

  final cells2 = [
    ["العالمية للكوري", "تيل فرامل", "09/03/2023", "8م"],
    ["العالمية للكوري", "فانوس أمامي", "09/03/2023", "8م"]
  ];

  final cells1 = [
    ["مركز الوكيل", "صيانة دورة التبريد", "09/03/2023", "8م"],
    ["مركز الوكيل", "صيانة دورة التبريد", "09/03/2023", "8م"]
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

  fetchReservations() async {
    emit(FetchingReservationsLoadingState());
    final response = await _repo.fetchReservations();
    response.when(success: (vehiclesResponse) async {
      emit(ReservationsSuccessState(vehiclesResponse.data?.bookings ?? []));
    }, failure: (error) {
      emit(ReservationsErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}