abstract class SparePartsCenterDetailsStates {}

class SparePartsCenterDetailsInitStates extends SparePartsCenterDetailsStates {}

class SparePartsCenterDetailsPickupDateStates
    extends SparePartsCenterDetailsStates {}


class BookingSparePartsLoadingState extends SparePartsCenterDetailsStates {}
class BookingSparePartsSuccessState extends SparePartsCenterDetailsStates {}
class BookingSparePartsErrorState extends SparePartsCenterDetailsStates {
  final String? bookingError;

  BookingSparePartsErrorState({ this.bookingError});
}
