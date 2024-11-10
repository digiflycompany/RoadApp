import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:roadapp/features/reserve_appointment/data/models/reservations_response.dart';
import 'package:roadapp/features/reserve_appointment/data/repos/reservations_repo.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_state.dart';

class ReserveAppointmentCubit extends Cubit<ReserveAppointmentStates> {
  ReserveAppointmentCubit(this._repo) : super(ReserveAppointmentInitStates());
  final ReservationsRepo _repo;
  static ReserveAppointmentCubit get(context) => BlocProvider.of(context);

  final List<List<String>> cells1 = [];

  List<Booking>? bookings;

  int index = 0, reservationsPage = 1;

  bool click = true;

  void changeReservationType(int index, bool click) {
    this.index = index;
    this.click = click;
    emit(ReserveAppointmentChangeReservationTypeStates());
  }

  void fetchReservations({int page = 1, int limit = 35, bool? more}) async {
    more == true? emit(MoreLoadingState()):emit(FetchingReservationsLoadingState());
    final response = await _repo.fetchReservations(page: page, limit: limit);
    response.when(success: (reservationsResponse) async {


      if (more != true) {
        bookings = reservationsResponse.data?.bookings;
        reservationsPage = 1;
      } else {
        bookings?.addAll(reservationsResponse.data?.bookings ?? []);
        reservationsPage ++;
      }
      emit(ReservationsSuccessState(
          reservationsResponse.data?.bookings ?? []));  // Pass cells1 here
    }, failure: (error) {
      emit(ReservationsErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


  List<String> convertBookingToListOfStrings(Booking booking) {
    if (booking.providerId == null ||
        booking.services == null ||
        booking.bookingTime == null) {
      return [];
    }

    DateTime bookingDate = DateTime.parse(booking.bookingTime!);

    String formattedDate = DateFormat('MM/dd/yyyy').format(bookingDate);

    String formattedTime = DateFormat('h a')
        .format(bookingDate)
        .replaceAll("AM", "ص")
        .replaceAll("PM", "م");

    String providerName = booking.providerId?.name ?? "Unknown Provider";
    String serviceName = booking.services?.isNotEmpty == true
        ? booking.services![0].name ?? "U"
        : "";

    return [providerName, serviceName, formattedDate, formattedTime];
  }
}
