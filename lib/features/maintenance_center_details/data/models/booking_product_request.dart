

class BookingProductRequest {
  final String? providerId;
  final List<String>? services;
  final String? vehicleId;
  final DateTime? bookingTime;
  final String? comment;

  BookingProductRequest({
    this.providerId,
    this.services,
    this.vehicleId,
    this.bookingTime,
    this.comment,
  });

  factory BookingProductRequest.fromJson(Map<String, dynamic> json) {
    return BookingProductRequest(
      providerId: json['providerId'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((service) => service as String)
          .toList(),
      vehicleId: json['vehicleId'] as String?,
      bookingTime: json['bookingTime'] != null
          ? DateTime.parse(json['bookingTime'] as String)
          : null,
      comment: json['comment'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'providerId': providerId,
      'services': services,
      'vehicleId': vehicleId,
      'bookingTime': bookingTime?.toIso8601String(),
      'comment': comment,
    };
  }
}
