class UserResponse {
  final bool? success;
  final Data? data;

  UserResponse({
    this.success,
    this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class Data {
  final User? user;
  final UnreadNotifications? unreadNotifications;

  Data({
    this.user,
    this.unreadNotifications,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      unreadNotifications: json['unreadNotifications'] != null
          ? UnreadNotifications.fromJson(json['unreadNotifications'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'unreadNotifications': unreadNotifications?.toJson(),
    };
  }
}

class User {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? countryId;
  final List<dynamic>? favouriteAds;
  final String? role;
  final bool? isActive;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final MaintenanceCenterProfile? maintenanceCenterId;

  User({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.countryId,
    this.favouriteAds,
    this.role,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.maintenanceCenterId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      countryId: json['countryId'] as String?,
      favouriteAds: json['favouriteAds'] != null
          ? List<dynamic>.from(json['favouriteAds'])
          : null,
      role: json['role'] as String?,
      isActive: json['isActive'] as bool?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      maintenanceCenterId: json['maintenanceCenterId'] != null
          ? MaintenanceCenterProfile.fromJson(json['maintenanceCenterId'])
          : null,
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'maintenanceCenterId': maintenanceCenterId?.toJson(),
    };
  }
}

// باقي الفئات مثل `MaintenanceCenterProfile` و `Country` و `Address` يتم تحديثها بنفس الطريقة.

class MaintenanceCenterProfile {
  final String? id;
  final String? landline;
  final String? name;
  final String? taxRegistrationNo;
  final String? commercialRegistrationNo;
  final List<String>? admins;
  final Country? country;
  final Address? address;
  final int? reviewsCount;
  final TotalReviews? totalReviews;
  final AverageReviews? averageReviews;

  MaintenanceCenterProfile({
    this.id,
    this.landline,
    this.name,
    this.taxRegistrationNo,
    this.commercialRegistrationNo,
    this.admins,
    this.country,
    this.address,
    this.reviewsCount,
    this.totalReviews,
    this.averageReviews,
  });

  factory MaintenanceCenterProfile.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenterProfile(
      id: json['_id'] as String?,
      landline: json['landline'] as String?,
      name: json['name'] as String?,
      taxRegistrationNo: json['taxRegistrationNo'] as String?,
      commercialRegistrationNo: json['commercialRegistrationNo'] as String?,
      admins: json['admins'] != null ? List<String>.from(json['admins']) : null,
      country: json['country'] != null ? Country.fromJson(json['country']) : null,
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      reviewsCount: json['reviewsCount'] as int?,
      totalReviews: json['totalReviews'] != null
          ? TotalReviews.fromJson(json['totalReviews'])
          : null,
      averageReviews: json['averageReviews'] != null
          ? AverageReviews.fromJson(json['averageReviews'])
          : null,
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
      'country': country?.toJson(),
      'address': address?.toJson(),
      'reviewsCount': reviewsCount,
      'totalReviews': totalReviews?.toJson(),
      'averageReviews': averageReviews?.toJson(),
    };
  }
}

class Country {
  final String? id;
  final String? name;

  Country({this.id, this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'] as String?,
      name: json['name'] as String?,
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
  final String? city;
  final String? firstLine;

  Address({this.city, this.firstLine});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] as String?,
      firstLine: json['firstLine'] as String?,
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
  final int? employeesBehavior;
  final int? speed;
  final int? honesty;
  final int? fairCost;
  final int? efficiency;

  TotalReviews({
    this.employeesBehavior,
    this.speed,
    this.honesty,
    this.fairCost,
    this.efficiency,
  });

  factory TotalReviews.fromJson(Map<String, dynamic> json) {
    return TotalReviews(
      employeesBehavior: json['employeesBehavior'] as int?,
      speed: json['speed'] as int?,
      honesty: json['honesty'] as int?,
      fairCost: json['fairCost'] as int?,
      efficiency: json['efficiency'] as int?,
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
  final int? employeesBehavior;
  final int? speed;
  final int? honesty;
  final int? fairCost;
  final int? efficiency;

  AverageReviews({
    this.employeesBehavior,
    this.speed,
    this.honesty,
    this.fairCost,
    this.efficiency,
  });

  factory AverageReviews.fromJson(Map<String, dynamic> json) {
    return AverageReviews(
      employeesBehavior: json['employeesBehavior'] as int?,
      speed: json['speed'] as int?,
      honesty: json['honesty'] as int?,
      fairCost: json['fairCost'] as int?,
      efficiency: json['efficiency'] as int?,
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
  final int? message;
  final int? total;

  UnreadNotifications({this.message, this.total});

  factory UnreadNotifications.fromJson(Map<String, dynamic> json) {
    return UnreadNotifications(
      message: json['message'] as int?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'total': total,
    };
  }
}
