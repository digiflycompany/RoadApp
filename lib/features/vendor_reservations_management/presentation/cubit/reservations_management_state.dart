import 'package:roadapp/features/vendor_reservations_management/data/models/reservation_managment_model.dart';

abstract class ReservationManagementStates {}

class ReservationManagementInitialStates extends ReservationManagementStates {}

class ReservationManagementLoadingStates extends ReservationManagementStates {}

class MoreLoadingState extends ReservationManagementStates {}

class ReservationManagementErrorStates extends ReservationManagementStates {
  final String error;

  ReservationManagementErrorStates({required this.error});
}

class ReservationManagementSuccessStates extends ReservationManagementStates {
  final List<Booking>? reservations;

  ReservationManagementSuccessStates(this.reservations);
}

///-------------------APPROVE BOOKING-------------------///
class ApproveBookingLoadingStates extends ReservationManagementStates {}

class ApproveBookingErrorStates extends ReservationManagementStates {
  final String error;

  ApproveBookingErrorStates({required this.error});
}

class ApproveBookingSuccessStates extends ReservationManagementStates {}

///---------------------DECLINE BOOKING---------------------///
class DeclineBookingLoadingStates extends ReservationManagementStates {}

class DeclineBookingErrorStates extends ReservationManagementStates {
  final String error;

  DeclineBookingErrorStates({required this.error});
}

class DeclineBookingSuccessStates extends ReservationManagementStates {}

class ReservationManagementChangeReservationTypeStates
    extends ReservationManagementStates {}
