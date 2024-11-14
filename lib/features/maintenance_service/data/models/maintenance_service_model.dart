class ServiceTypeResponse {
  final bool success;
  final Data data;

  ServiceTypeResponse({required this.success, required this.data});

  factory ServiceTypeResponse.fromJson(Map<String, dynamic> json) {
    return ServiceTypeResponse(
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
  final List<ServiceType> serviceTypes;
  final OptionsServices options;

  Data({required this.serviceTypes, required this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    var serviceTypesList = (json['serviceTypes'] as List)
        .map((item) => ServiceType.fromJson(item))
        .toList();

    return Data(
      serviceTypes: serviceTypesList,
      options: OptionsServices.fromJson(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceTypes': serviceTypes.map((item) => item.toJson()).toList(),
      'options': options.toJson(),
    };
  }
}

class ServiceType {
  final String id;
  final String name;
  final String nameAr;
  final String status;
  final String creatorId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  ServiceType({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.status,
    required this.creatorId,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) {
    return ServiceType(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
      status: json['status'],
      creatorId: json['creatorId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
      'status': status,
      'creatorId': creatorId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}

class OptionsServices {
  final int limit;
  final int skip;
  final Sort sort;
  final int page;
  final int count;

  OptionsServices({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  factory OptionsServices.fromJson(Map<String, dynamic> json) {
    return OptionsServices(
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
