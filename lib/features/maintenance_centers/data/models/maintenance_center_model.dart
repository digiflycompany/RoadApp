class MaintenanceCenterModel {
  final bool success;
  final Data data;

  MaintenanceCenterModel({required this.success, required this.data});

  factory MaintenanceCenterModel.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenterModel(
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
  final List<Service> services;
  final OptionsMaintenanceCenter options;

  Data({required this.services, required this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      services: List<Service>.from(json['services'].map((x) => Service.fromJson(x))),
      options: OptionsMaintenanceCenter.fromJson(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'services': services.map((x) => x.toJson()).toList(),
      'options': options.toJson(),
    };
  }
}

class Service {
  final String id;
  final String name;
  final String nameAr;
  final MaintenanceCenter maintenanceCenterId;
  final int cost;
  final String brandId;
  final String typeId;
  final int version;

  Service({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.maintenanceCenterId,
    required this.cost,
    required this.brandId,
    required this.typeId,
    required this.version,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
      maintenanceCenterId: MaintenanceCenter.fromJson(json['maintenanceCenterId']),
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
      'maintenanceCenterId': maintenanceCenterId.toJson(),
      'cost': cost,
      'brandId': brandId,
      'typeId': typeId,
      '__v': version,
    };
  }
}

class MaintenanceCenter {
  final String id;
  final String landline;
  final String name;
  final Country country;
  final Address address;
  final int reviewsCount;
  final AverageReviews averageReviews;

  MaintenanceCenter({
    required this.id,
    required this.landline,
    required this.name,
    required this.country,
    required this.address,
    required this.reviewsCount,
    required this.averageReviews,
  });

  factory MaintenanceCenter.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenter(
      id: json['_id'],
      landline: json['landline'],
      name: json['name'],
      country: Country.fromJson(json['country']),
      address: Address.fromJson(json['address']),
      reviewsCount: json['reviewsCount'],
      averageReviews: AverageReviews.fromJson(json['averageReviews']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'landline': landline,
      'name': name,
      'country': country.toJson(),
      'address': address.toJson(),
      'reviewsCount': reviewsCount,
      'averageReviews': averageReviews.toJson(),
    };
  }
}

class Country {
  final String id;
  final String name;

  Country({required this.id, required this.name});

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

  Address({required this.city, required this.firstLine});

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

class OptionsMaintenanceCenter {
  final int limit;
  final int skip;
  final Sort sort;
  final int page;
  final int count;

  OptionsMaintenanceCenter({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  factory OptionsMaintenanceCenter.fromJson(Map<String, dynamic> json) {
    return OptionsMaintenanceCenter(
      limit: json['limit'],
      skip: json['skip'],
      sort: Sort.fromJson(json['sort']),
      page: json['page'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort.toJson(),
      'page': page,
      'count': count,
    };
  }
}

class Sort {
  final String createdAt;

  Sort({required this.createdAt});

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
