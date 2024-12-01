class UserResponse {
  final bool success;
  final Data data;

  UserResponse({
    required this.success,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class Data {
  final User user;
  final UnreadNotifications unreadNotifications;

  Data({
    required this.user,
    required this.unreadNotifications,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      unreadNotifications: UnreadNotifications.fromJson(json['unreadNotifications']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'unreadNotifications': unreadNotifications.toJson(),
    };
  }
}

class User {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String countryId;
  final List<dynamic> favouriteAds;
  final String role;
  final bool isActive;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final MaintenanceCenterProfile maintenanceCenterId;

  User({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.countryId,
    required this.favouriteAds,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.maintenanceCenterId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      countryId: json['countryId'],
      favouriteAds: List<dynamic>.from(json['favouriteAds']),
      role: json['role'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      maintenanceCenterId: MaintenanceCenterProfile.fromJson(json['maintenanceCenterId']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'countryId': countryId,
      'favouriteAds': favouriteAds,
      'role': role,
      'isActive': isActive,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'maintenanceCenterId': maintenanceCenterId.toJson(),
    };
  }
}

class MaintenanceCenterProfile {
  final String id;
  final String landline;
  final String name;
  final String taxRegistrationNo;
  final String commercialRegistrationNo;
  final List<String> admins;
  final Country country;
  final Address address;
  final int reviewsCount;
  final TotalReviews totalReviews;
  final AverageReviews averageReviews;

  MaintenanceCenterProfile({
    required this.id,
    required this.landline,
    required this.name,
    required this.taxRegistrationNo,
    required this.commercialRegistrationNo,
    required this.admins,
    required this.country,
    required this.address,
    required this.reviewsCount,
    required this.totalReviews,
    required this.averageReviews,
  });

  factory MaintenanceCenterProfile.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenterProfile(
      id: json['_id'],
      landline: json['landline'],
      name: json['name'],
      taxRegistrationNo: json['taxRegistrationNo'],
      commercialRegistrationNo: json['commercialRegistrationNo'],
      admins: List<String>.from(json['admins']),
      country: Country.fromJson(json['country']),
      address: Address.fromJson(json['address']),
      reviewsCount: json['reviewsCount'],
      totalReviews: TotalReviews.fromJson(json['totalReviews']),
      averageReviews: AverageReviews.fromJson(json['averageReviews']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'landline': landline,
      'name': name,
      'taxRegistrationNo': taxRegistrationNo,
      'commercialRegistrationNo': commercialRegistrationNo,
      'admins': admins,
      'country': country.toJson(),
      'address': address.toJson(),
      'reviewsCount': reviewsCount,
      'totalReviews': totalReviews.toJson(),
      'averageReviews': averageReviews.toJson(),
    };
  }
}

class Country {
  final String id;
  final String name;

  Country({
    required this.id,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class Address {
  final String city;
  final String firstLine;

  Address({
    required this.city,
    required this.firstLine,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      firstLine: json['firstLine'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'firstLine': firstLine,
    };
  }
}

class TotalReviews {
  final int employeesBehavior;
  final int speed;
  final int honesty;
  final int fairCost;
  final int efficiency;

  TotalReviews({
    required this.employeesBehavior,
    required this.speed,
    required this.honesty,
    required this.fairCost,
    required this.efficiency,
  });

  factory TotalReviews.fromJson(Map<String, dynamic> json) {
    return TotalReviews(
      employeesBehavior: json['employeesBehavior'],
      speed: json['speed'],
      honesty: json['honesty'],
      fairCost: json['fairCost'],
      efficiency: json['efficiency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employeesBehavior': employeesBehavior,
      'speed': speed,
      'honesty': honesty,
      'fairCost': fairCost,
      'efficiency': efficiency,
    };
  }
}

class AverageReviews {
  final int employeesBehavior;
  final int speed;
  final int honesty;
  final int fairCost;
  final int efficiency;

  AverageReviews({
    required this.employeesBehavior,
    required this.speed,
    required this.honesty,
    required this.fairCost,
    required this.efficiency,
  });

  factory AverageReviews.fromJson(Map<String, dynamic> json) {
    return AverageReviews(
      employeesBehavior: json['employeesBehavior'],
      speed: json['speed'],
      honesty: json['honesty'],
      fairCost: json['fairCost'],
      efficiency: json['efficiency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employeesBehavior': employeesBehavior,
      'speed': speed,
      'honesty': honesty,
      'fairCost': fairCost,
      'efficiency': efficiency,
    };
  }
}

class UnreadNotifications {
  final int message;
  final int total;

  UnreadNotifications({
    required this.message,
    required this.total,
  });

  factory UnreadNotifications.fromJson(Map<String, dynamic> json) {
    return UnreadNotifications(
      message: json['message'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'total': total,
    };
  }
}
