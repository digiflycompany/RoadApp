class RoadServicesResponse {
  final bool success;
  final Data data;

  RoadServicesResponse({
    required this.success,
    required this.data,
  });

  factory RoadServicesResponse.fromJson(Map<String, dynamic> json) {
    return RoadServicesResponse(
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
  final List<RoadService> roadServices;
  final OptionsRoad options;

  Data({
    required this.roadServices,
    required this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      roadServices: (json['roadServices'] as List)
          .map((item) => RoadService.fromJson(item))
          .toList(),
      options: OptionsRoad.fromJson(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roadServices': roadServices.map((item) => item.toJson()).toList(),
      'options': options.toJson(),
    };
  }
}

class RoadService {
  final String id;
  final String mapsLink;
  final String address;
  final String photo;
  final String phoneNumber;
  final String name;
  final String type;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  RoadService({
    required this.id,
    required this.mapsLink,
    required this.address,
    required this.photo,
    required this.phoneNumber,
    required this.name,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory RoadService.fromJson(Map<String, dynamic> json) {
    return RoadService(
      id: json['_id'],
      mapsLink: json['mapsLink'],
      address: json['address'],
      photo: json['photo'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      type: json['type'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'mapsLink': mapsLink,
      'address': address,
      'photo': photo,
      'phoneNumber': phoneNumber,
      'name': name,
      'type': type,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}

class OptionsRoad {
  final int limit;
  final int skip;
  final Sort sort;
  final int page;
  final int count;


  OptionsRoad({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  factory OptionsRoad.fromJson(Map<String, dynamic> json) {
    return OptionsRoad(
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

  Sort({
    required this.createdAt,
  });

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
