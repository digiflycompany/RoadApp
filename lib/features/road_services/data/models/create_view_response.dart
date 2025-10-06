class CreateReviewResponse {
  final bool success;
  final ReviewData data;

  CreateReviewResponse({required this.success, required this.data});

  factory CreateReviewResponse.fromJson(Map<String, dynamic> json) {
    return CreateReviewResponse(
      success: json['success'],
      data: ReviewData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class ReviewData {
  final String id;
  final String bookingId;
  final int employeesBehavior;
  final int speed;
  final int honesty;
  final int fairCost;
  final int efficiency;
  final String createdAt;
  final String updatedAt;

  ReviewData({
    required this.id,
    required this.bookingId,
    required this.employeesBehavior,
    required this.speed,
    required this.honesty,
    required this.fairCost,
    required this.efficiency,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(
      id: json['_id'],
      bookingId: json['bookingId'],
      employeesBehavior: json['employeesBehavior'],
      speed: json['speed'],
      honesty: json['honesty'],
      fairCost: json['fairCost'],
      efficiency: json['efficiency'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'bookingId': bookingId,
      'employeesBehavior': employeesBehavior,
      'speed': speed,
      'honesty': honesty,
      'fairCost': fairCost,
      'efficiency': efficiency,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
