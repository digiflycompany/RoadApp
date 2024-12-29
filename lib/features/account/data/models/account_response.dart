
class AccountResponse {
  bool? success;
  UserData? data;

  AccountResponse({this.success, this.data});

  factory AccountResponse.fromJson(Map<String, dynamic> json) {
    return AccountResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class UserData {
  User? user;
  UnreadNotifications? unreadNotifications;

  UserData({this.user, this.unreadNotifications});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
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
  String? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  List<dynamic>? favouriteAds;
  String? role;
  bool? isActive;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  MaintenanceCenter? maintenanceCenter;

  User({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.favouriteAds,
    this.role,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.maintenanceCenter,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      favouriteAds: json['favouriteAds'] as List<dynamic>?,
      role: json['role'] as String?,
      isActive: json['isActive'] as bool?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      maintenanceCenter: json['maintenanceCenterId'] != null
          ? MaintenanceCenter.fromJson(json['maintenanceCenterId'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'favouriteAds': favouriteAds,
      'role': role,
      'isActive': isActive,
      'isVerified': isVerified,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'maintenanceCenterId': maintenanceCenter?.toJson(),
    };
  }
}

class MaintenanceCenter {
  String? id;
  String? landline;
  String? name;
  String? taxRegistrationNo;
  String? commercialRegistrationNo;
  List<String>? admins;
  Country? country;
  Address? address;
  int? reviewsCount;
  ReviewRatings? totalReviews;
  ReviewRatings? averageReviews;

  MaintenanceCenter({
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

  factory MaintenanceCenter.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenter(
      id: json['_id'] as String?,
      landline: json['landline'] as String?,
      name: json['name'] as String?,
      taxRegistrationNo: json['taxRegistrationNo'] as String?,
      commercialRegistrationNo: json['commercialRegistrationNo'] as String?,
      admins: (json['admins'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      country: json['country'] != null
          ? Country.fromJson(json['country'])
          : null,
      address: json['address'] != null
          ? Address.fromJson(json['address'])
          : null,
      reviewsCount: json['reviewsCount'] as int?,
      totalReviews: json['totalReviews'] != null
          ? ReviewRatings.fromJson(json['totalReviews'])
          : null,
      averageReviews: json['averageReviews'] != null
          ? ReviewRatings.fromJson(json['averageReviews'])
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
  String? id;
  String? name;

  Country({this.id, this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name};
  }
}

class Address {
  String? city;
  String? firstLine;

  Address({this.city, this.firstLine});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] as String?,
      firstLine: json['firstLine'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'city': city, 'firstLine': firstLine};
  }
}

class ReviewRatings {
  int? employeesBehavior;
  int? speed;
  int? honesty;
  int? fairCost;
  int? efficiency;

  ReviewRatings({
    this.employeesBehavior,
    this.speed,
    this.honesty,
    this.fairCost,
    this.efficiency,
  });

  factory ReviewRatings.fromJson(Map<String, dynamic> json) {
    return ReviewRatings(
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
  int? message;
  int? total;

  UnreadNotifications({this.message, this.total});

  factory UnreadNotifications.fromJson(Map<String, dynamic> json) {
    return UnreadNotifications(
      message: json['message'] as int?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'total': total};
  }
}
