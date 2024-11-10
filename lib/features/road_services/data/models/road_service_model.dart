class RoadServicesResponse {
  final bool success;
  final List<RoadService> roadServices;
  final OptionsRoad options;

  RoadServicesResponse({
    required this.success,
    required this.roadServices,
    required this.options,
  });

  factory RoadServicesResponse.fromJson(Map<String, dynamic> json) {
    return RoadServicesResponse(
      success: json['success'],
      roadServices: (json['data']['roadServices'] as List)
          .map((e) => RoadService.fromJson(e))
          .toList(),
      options: OptionsRoad.fromJson(json['data']['options']),
    );
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
  final int v;

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
    required this.v,
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
      v: json['__v'],
    );
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
}

class Sort {
  final String createdAt;

  Sort({required this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'],
    );
  }
}
