import 'package:roadapp/features/reserve_appointment/data/models/reservations_response.dart';

abstract class ReserveAppointmentStates{}

class ReserveAppointmentInitStates extends ReserveAppointmentStates {}

class ReserveAppointmentChangeReservationTypeStates extends ReserveAppointmentStates {}
class FetchingReservationsLoadingState extends ReserveAppointmentStates {}
class MoreLoadingState extends ReserveAppointmentStates {}
class ReservationsErrorState extends ReserveAppointmentStates {
  final String errorMessage;
  ReservationsErrorState(this.errorMessage);
}
class ReservationsSuccessState extends ReserveAppointmentStates {
  final List<Booking> reservations;
  ReservationsSuccessState(this.reservations);
}


class UpdateBookingLoading extends ReserveAppointmentStates {}
class UpdateBookingSuccess extends ReserveAppointmentStates {}
class UpdateDate extends ReserveAppointmentStates {}
class UpdateBookingError extends ReserveAppointmentStates {
  final String errorMessage;

  UpdateBookingError(this.errorMessage);
}


class ApproveBookingLoading extends ReserveAppointmentStates {}
class ApproveBookingSuccess extends ReserveAppointmentStates {}
class ApproveBookingError extends ReserveAppointmentStates {
  final String errorMessage;

  ApproveBookingError(this.errorMessage);
}


class DeclinedBookingLoading extends ReserveAppointmentStates {}
class DeclinedBookingSuccess extends ReserveAppointmentStates {}
class DeclinedBookingError extends ReserveAppointmentStates {
  final String errorMessage;

  DeclinedBookingError(this.errorMessage);
}