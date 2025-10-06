class ReviewsResponse {
  final bool success;
  final List<ReviewModel> reviews;
  final ReviewsOptions options;

  ReviewsResponse({
    required this.success,
    required this.reviews,
    required this.options,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    final reviewsList = (data['reviews'] as List<dynamic>? ?? [])
        .map((e) => ReviewModel.fromJson(e))
        .toList();

    return ReviewsResponse(
      success: json['success'] ?? false,
      reviews: reviewsList,
      options: ReviewsOptions.fromJson(data['options'] ?? {}),
    );
  }
}

class ReviewModel {
  final String id;
  final String bookingId;
  final MaintenanceCenter? maintenanceCenter;
  final User? user;
  final int employeesBehavior;
  final int speed;
  final int honesty;
  final int fairCost;
  final int efficiency;
  final String createdAt;
  final String updatedAt;

  ReviewModel({
    required this.id,
    required this.bookingId,
    this.maintenanceCenter,
    this.user,
    required this.employeesBehavior,
    required this.speed,
    required this.honesty,
    required this.fairCost,
    required this.efficiency,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return ReviewModel(
      id: json['_id'] ?? '',
      bookingId: json['bookingId'] ?? '',
      maintenanceCenter: json['maintenanceCenterId'] != null
          ? MaintenanceCenter.fromJson(json['maintenanceCenterId'])
          : null,
      user: json['userId'] != null ? User.fromJson(json['userId']) : null,
      employeesBehavior: parseInt(json['employeesBehavior']),
      speed: parseInt(json['speed']),
      honesty: parseInt(json['honesty']),
      fairCost: parseInt(json['fairCost']),
      efficiency: parseInt(json['efficiency']),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}

class MaintenanceCenter {
  final String id;
  final String name;

  MaintenanceCenter({required this.id, required this.name});

  factory MaintenanceCenter.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenter(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class User {
  final String id;
  final String fullName;

  User({required this.id, required this.fullName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
    );
  }
}

class ReviewsOptions {
  final int page;
  final int limit;
  final int count;

  ReviewsOptions({
    required this.page,
    required this.limit,
    required this.count,
  });

  factory ReviewsOptions.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return ReviewsOptions(
      page: parseInt(json['page']),
      limit: parseInt(json['limit']),
      count: parseInt(json['count']),
    );
  }
}
