class UpdateBookingProviderRequest {
  final DateTime bookingTime;

  UpdateBookingProviderRequest({required this.bookingTime});

  factory UpdateBookingProviderRequest.fromJson(Map<String, dynamic> json) {
    return UpdateBookingProviderRequest(
      bookingTime: DateTime.parse(json['bookingTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingTime': bookingTime.toIso8601String(),
    };
  }
}
