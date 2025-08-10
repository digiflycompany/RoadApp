class UserResponse {
  UserResponse({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.user,
    required this.unreadNotifications,
  });

  final User? user;
  final UnreadNotifications? unreadNotifications;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      unreadNotifications: json["unreadNotifications"] == null
          ? null
          : UnreadNotifications.fromJson(json["unreadNotifications"]),
    );
  }
}

class UnreadNotifications {
  UnreadNotifications({
    required this.message,
    required this.total,
  });

  final int? message;
  final int? total;

  factory UnreadNotifications.fromJson(Map<String, dynamic> json) {
    return UnreadNotifications(
      message: json["message"],
      total: json["total"],
    );
  }
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.picture,
    required this.phoneNumber,
    required this.email,
    required this.countryId,
    required this.favoriteAds,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.isSuperAdmin,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.maintenanceCenterId,
  });

  final String? id;
  final String? fullName;
  final String? picture;
  final String? phoneNumber;
  final String? email;
  final String? countryId;
  final List<dynamic> favoriteAds;
  final String? role;
  final bool? isActive;
  final bool? isVerified;
  final bool? isSuperAdmin;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final MaintenanceCenterId? maintenanceCenterId;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      fullName: json["fullName"],
      picture: json["picture"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      countryId: json["countryId"],
      favoriteAds: json["favoriteAds"] == null
          ? []
          : List<dynamic>.from(json["favoriteAds"]!.map((x) => x)),
      role: json["role"],
      isActive: json["isActive"],
      isVerified: json["isVerified"],
      isSuperAdmin: json["isSuperAdmin"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      maintenanceCenterId: json["maintenanceCenterId"] == null
          ? null
          : MaintenanceCenterId.fromJson(json["maintenanceCenterId"]),
    );
  }
}

class MaintenanceCenterId {
  MaintenanceCenterId({
    required this.id,
    required this.landline,
    required this.name,
    required this.picture,
    required this.taxRegistrationNo,
    required this.commercialRegistrationNo,
    required this.admins,
    required this.isActive,
    required this.country,
    required this.address,
    required this.reviewsCount,
    required this.totalReviews,
    required this.averageReviews,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? landline;
  final String? name;
  final dynamic picture;
  final String? taxRegistrationNo;
  final String? commercialRegistrationNo;
  final List<String> admins;
  final bool? isActive;
  final Country? country;
  final Address? address;
  final int? reviewsCount;
  final Reviews? totalReviews;
  final Reviews? averageReviews;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory MaintenanceCenterId.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenterId(
      id: json["_id"],
      landline: json["landline"],
      name: json["name"],
      picture: json["picture"],
      taxRegistrationNo: json["taxRegistrationNo"],
      commercialRegistrationNo: json["commercialRegistrationNo"],
      admins: json["admins"] == null
          ? []
          : List<String>.from(json["admins"]!.map((x) => x)),
      isActive: json["isActive"],
      country:
          json["country"] == null ? null : Country.fromJson(json["country"]),
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
      reviewsCount: json["reviewsCount"],
      totalReviews: json["totalReviews"] == null
          ? null
          : Reviews.fromJson(json["totalReviews"]),
      averageReviews: json["averageReviews"] == null
          ? null
          : Reviews.fromJson(json["averageReviews"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class Address {
  Address({
    required this.city,
    required this.firstLine,
  });

  final String? city;
  final String? firstLine;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json["city"],
      firstLine: json["firstLine"],
    );
  }
}

class Reviews {
  Reviews({
    required this.employeesBehavior,
    required this.speed,
    required this.honesty,
    required this.fairCost,
    required this.efficiency,
  });

  final int? employeesBehavior;
  final int? speed;
  final int? honesty;
  final int? fairCost;
  final int? efficiency;

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      employeesBehavior: json["employeesBehavior"],
      speed: json["speed"],
      honesty: json["honesty"],
      fairCost: json["fairCost"],
      efficiency: json["efficiency"],
    );
  }
}

class Country {
  Country({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json["_id"],
      name: json["name"],
    );
  }
}
