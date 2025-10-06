class CreateReviewRequest {
  final String bookingId;
  final int employeesBehavior;
  final int speed;
  final int honesty;
  final int fairCost;
  final int efficiency;

  CreateReviewRequest({
    required this.bookingId,
    required this.employeesBehavior,
    required this.speed,
    required this.honesty,
    required this.fairCost,
    required this.efficiency,
  });

  factory CreateReviewRequest.fromJson(Map<String, dynamic> json) {
    return CreateReviewRequest(
      bookingId: json['bookingId'],
      employeesBehavior: json['employeesBehavior'],
      speed: json['speed'],
      honesty: json['honesty'],
      fairCost: json['fairCost'],
      efficiency: json['efficiency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'employeesBehavior': employeesBehavior,
      'speed': speed,
      'honesty': honesty,
      'fairCost': fairCost,
      'efficiency': efficiency,
    };
  }
}
