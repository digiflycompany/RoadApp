abstract class MaintenanceCenterDetailsStates {}

class MaintenanceCenterDetailsInitStates
    extends MaintenanceCenterDetailsStates {}

class MaintenanceCenterDetailsPickupDateStates
    extends MaintenanceCenterDetailsStates {}

class BookingLoadingState extends MaintenanceCenterDetailsStates {}

class BookingSuccessState extends MaintenanceCenterDetailsStates {}

class BookingErrorState extends MaintenanceCenterDetailsStates {
  final String? bookingError;

  BookingErrorState({ this.bookingError});
}
