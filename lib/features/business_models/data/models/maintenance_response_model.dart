class MaintenanceResponse {
  final bool? success;
  final MaintenanceData? data;

  MaintenanceResponse({this.success, this.data});

  factory MaintenanceResponse.fromJson(Map<String, dynamic> json) {
    return MaintenanceResponse(
      success: json['success'],
      data: json['data'] != null ? MaintenanceData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class MaintenanceData {
  final List<MaintenanceCenters>? maintenanceCenters;
  final MaintenanceOptions? options;

  MaintenanceData({this.maintenanceCenters, this.options});

  factory MaintenanceData.fromJson(Map<String, dynamic> json) {
    return MaintenanceData(
      maintenanceCenters: json['maintenanceCenters'] != null
          ? (json['maintenanceCenters'] as List)
          .map((e) => MaintenanceCenters.fromJson(e))
          .toList()
          : null,
      options: json['options'] != null
          ? MaintenanceOptions.fromJson(json['options'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maintenanceCenters': maintenanceCenters?.map((e) => e.toJson()).toList(),
      'options': options?.toJson(),
    };
  }
}

class MaintenanceCenters {
  final String? id;
  final String? landline;
  final String? name;
  final String? picture;
  final String? taxRegistrationNo;
  final String? commercialRegistrationNo;
  final List<String>? admins;
  final MaintenanceCountry? country;
  final MaintenanceAddress? address;
  final int? reviewsCount;
  final MaintenanceReviews? totalReviews;
  final MaintenanceReviews? averageReviews;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  MaintenanceCenters({
    this.id,
    this.landline,
    this.name,
    this.picture,
    this.taxRegistrationNo,
    this.commercialRegistrationNo,
    this.admins,
    this.country,
    this.address,
    this.reviewsCount,
    this.totalReviews,
    this.averageReviews,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MaintenanceCenters.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenters(
      id: json['_id'],
      landline: json['landline'],
      name: json['name'],
      picture: json['picture'],
      taxRegistrationNo: json['taxRegistrationNo'],
      commercialRegistrationNo: json['commercialRegistrationNo'],
      admins: json['admins'] != null ? List<String>.from(json['admins']) : null,
      country: json['country'] != null
          ? MaintenanceCountry.fromJson(json['country'])
          : null,
      address: json['address'] != null
          ? MaintenanceAddress.fromJson(json['address'])
          : null,
      reviewsCount: json['reviewsCount'],
      totalReviews: json['totalReviews'] != null
          ? MaintenanceReviews.fromJson(json['totalReviews'])
          : null,
      averageReviews: json['averageReviews'] != null
          ? MaintenanceReviews.fromJson(json['averageReviews'])
          : null,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'landline': landline,
      'name': name,
      'picture': picture,
      'taxRegistrationNo': taxRegistrationNo,
      'commercialRegistrationNo': commercialRegistrationNo,
      'admins': admins,
      'country': country?.toJson(),
      'address': address?.toJson(),
      'reviewsCount': reviewsCount,
      'totalReviews': totalReviews?.toJson(),
      'averageReviews': averageReviews?.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class MaintenanceCountry {
  final String? id;
  final String? name;

  MaintenanceCountry({this.id, this.name});

  factory MaintenanceCountry.fromJson(Map<String, dynamic> json) {
    return MaintenanceCountry(
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

class MaintenanceAddress {
  final String? city;
  final String? firstLine;

  MaintenanceAddress({this.city, this.firstLine});

  factory MaintenanceAddress.fromJson(Map<String, dynamic> json) {
    return MaintenanceAddress(
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

class MaintenanceReviews {
  final int? employeesBehavior;
  final int? speed;
  final int? honesty;
  final int? fairCost;
  final int? efficiency;

  MaintenanceReviews({
    this.employeesBehavior,
    this.speed,
    this.honesty,
    this.fairCost,
    this.efficiency,
  });

  factory MaintenanceReviews.fromJson(Map<String, dynamic> json) {
    return MaintenanceReviews(
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

class MaintenanceOptions {
  final int? limit;
  final int? skip;
  final MaintenanceSort? sort;
  final int? page;
  final int? count;

  MaintenanceOptions({this.limit, this.skip, this.sort, this.page, this.count});

  factory MaintenanceOptions.fromJson(Map<String, dynamic> json) {
    return MaintenanceOptions(
      limit: json['limit'],
      skip: json['skip'],
      sort: json['sort'] != null ? MaintenanceSort.fromJson(json['sort']) : null,
      page: json['page'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort?.toJson(),
      'page': page,
      'count': count,
    };
  }
}

class MaintenanceSort {
  final String? createdAt;

  MaintenanceSort({this.createdAt});

  factory MaintenanceSort.fromJson(Map<String, dynamic> json) {
    return MaintenanceSort(
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
    };
  }
}
