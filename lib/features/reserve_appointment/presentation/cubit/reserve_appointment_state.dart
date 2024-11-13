import 'package:roadapp/features/reserve_appointment/data/models/reservations_response.dart';

abstract class ReserveAppointmentStates{}

class ReserveAppointmentInitStates extends ReserveAppointmentStates {}

class ReserveAppointmentChangeReservationTypeStates extends ReserveAppointmentStates {}
class FetchingReservationsLoadingState extends ReserveAppointmentStates {}
class ReservationsErrorState extends ReserveAppointmentStates {
  final String errorMessage;
  ReservationsErrorState(this.errorMessage);
}
class ReservationsSuccessState extends ReserveAppointmentStates {
  final List<Booking> reservations;
  ReservationsSuccessState(this.reservations);
}