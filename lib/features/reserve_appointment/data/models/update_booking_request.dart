class UpdateBookingRequest {
  final String bookingTime;

  UpdateBookingRequest({required this.bookingTime});

  // Factory constructor to create an instance from a JSON map
  factory UpdateBookingRequest.fromJson(Map<String, dynamic> json) {
    return UpdateBookingRequest(
      bookingTime: json['bookingTime'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'bookingTime': bookingTime,
    };
  }
}