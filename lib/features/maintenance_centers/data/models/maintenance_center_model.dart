class MaintenanceCenterModel {
  final bool? success;
  final Data? data;

  MaintenanceCenterModel({this.success, this.data});

  factory MaintenanceCenterModel.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenterModel(
      success: json['success'],
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
  final List<Service>? services;
  final OptionsMaintenanceCenter? options;

  Data({this.services, this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      services: json['services'] != null
          ? List<Service>.from(json['services'].map((x) => Service.fromJson(x)))
          : null,
      options: json['options'] != null
          ? OptionsMaintenanceCenter.fromJson(json['options'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'services': services?.map((x) => x.toJson()).toList(),
      'options': options?.toJson(),
    };
  }
}

class Service {
  final String? id;
  final String? name;
  final String? nameAr;
  final MaintenanceCenter? maintenanceCenterId;
  final int? cost;
  final String? brandId;
  final String? typeId;
  final int? version;

  Service({
    this.id,
    this.name,
    this.nameAr,
    this.maintenanceCenterId,
    this.cost,
    this.brandId,
    this.typeId,
    this.version,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
      maintenanceCenterId: json['maintenanceCenterId'] != null
          ? MaintenanceCenter.fromJson(json['maintenanceCenterId'])
          : null,
      cost: json['cost'],
      brandId: json['brandId'],
      typeId: json['typeId'],
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
      'maintenanceCenterId': maintenanceCenterId?.toJson(),
      'cost': cost,
      'brandId': brandId,
      'typeId': typeId,
      '__v': version,
    };
  }
}

class MaintenanceCenter {
  final String? id;
  final String? landline;
  final String? name;
  final Country? country;
  final Address? address;
  final int? reviewsCount;
  final AverageReviews? averageReviews;
  final String? image;


  MaintenanceCenter({
    this.id,
    this.landline,
    this.name,
    this.country,
    this.address,
    this.reviewsCount,
    this.averageReviews,
    this.image,
  });

  factory MaintenanceCenter.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenter(
      id: json['_id'],
      landline: json['landline'],
      name: json['name'],
      country: json['country'] != null ? Country.fromJson(json['country']) : null,
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      reviewsCount: json['reviewsCount'],
      averageReviews: json['averageReviews'] != null
          ? AverageReviews.fromJson(json['averageReviews'])
          : null,
      image: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'landline': landline,
      'name': name,
      'country': country?.toJson(),
      'address': address?.toJson(),
      'reviewsCount': reviewsCount,
      'averageReviews': averageReviews?.toJson(),
      'picture': image,

    };
  }
}

class Country {
  final String? id;
  final String? name;

  Country({this.id, this.name});

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
  final String? city;
  final String? firstLine;

  Address({this.city, this.firstLine});

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

class OptionsMaintenanceCenter {
  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;
  final int? count;

  OptionsMaintenanceCenter({
    this.limit,
    this.skip,
    this.sort,
    this.page,
    this.count,
  });

  factory OptionsMaintenanceCenter.fromJson(Map<String, dynamic> json) {
    return OptionsMaintenanceCenter(
      limit: json['limit'],
      skip: json['skip'],
      sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
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

class Sort {
  final String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
    };
  }
}
