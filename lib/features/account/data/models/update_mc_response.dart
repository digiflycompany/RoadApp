class UpdateMcResponse {
  bool? success;
  Data? data;

  UpdateMcResponse({this.success, this.data});

  factory UpdateMcResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMcResponse(
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
  int? version;
  String? updatedAt;

  Data({
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
    this.version,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
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
      version: json['__v'] as int?,
      updatedAt: json['updatedAt'] as String?,
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
      '__v': version,
      'updatedAt': updatedAt,
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
    return {
      '_id': id,
      'name': name,
    };
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
    return {
      'city': city,
      'firstLine': firstLine,
    };
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
