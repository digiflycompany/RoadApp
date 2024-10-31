class VehiclesResponse {
  bool? success;
  Data? data;

  VehiclesResponse({this.success, this.data});

  factory VehiclesResponse.fromJson(Map<String, dynamic> json) {
    return VehiclesResponse(
        success: json['success'] as bool?,
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class Data {
  List<Vehicle>? vehicles;
  VehicleOptions? options;

  Data({this.vehicles, this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        vehicles: (json['vehicles'] as List<dynamic>?)
            ?.map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
            .toList(),
        options:
            json['options'] != null ? VehicleOptions.fromJson(json['options']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicles': vehicles?.map((e) => e.toJson()).toList(),
      'options': options?.toJson()
    };
  }
}

class Vehicle {
  String? id;
  String? brandId;
  String? model;
  String? modelAr;
  String? plateNumber;
  String? engineType;
  String? tankCapacity;
  String? motorNumber;
  String? chassisNumber;
  String? gearShiftType;
  int? ccNumber;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Vehicle(
      {this.id,
      this.brandId,
      this.model,
      this.modelAr,
      this.plateNumber,
      this.engineType,
      this.tankCapacity,
      this.motorNumber,
      this.chassisNumber,
      this.gearShiftType,
      this.ccNumber,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
        id: json['_id'] as String?,
        brandId: json['brandId'] as String?,
        model: json['model'] as String?,
        modelAr: json['modelAr'] as String?,
        plateNumber: json['plateNumber'] as String?,
        engineType: json['engineType'] as String?,
        tankCapacity: json['tankCapacity'] as String?,
        motorNumber: json['motorNumber'] as String?,
        chassisNumber: json['chassisNumber'] as String?,
        gearShiftType: json['gearShiftType'] as String?,
        ccNumber: json['CCNumber'] as int?,
        userId: json['userId'] as String?,
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        v: json['__v'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'brandId': brandId,
      'model': model,
      'modelAr': modelAr,
      'plateNumber': plateNumber,
      'engineType': engineType,
      'tankCapacity': tankCapacity,
      'motorNumber': motorNumber,
      'chassisNumber': chassisNumber,
      'gearShiftType': gearShiftType,
      'CCNumber': ccNumber,
      'userId': userId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v
    };
  }
}

class VehicleOptions {
  int? limit;
  int? skip;
  Sort? sort;
  int? page;
  int? count;

  VehicleOptions({this.limit, this.skip, this.sort, this.page, this.count});

  factory VehicleOptions.fromJson(Map<String, dynamic> json) {
    return VehicleOptions(
        limit: json['limit'] as int?,
        skip: json['skip'] as int?,
        sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
        page: json['page'] as int?,
        count: json['count'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort?.toJson(),
      'page': page,
      'count': count
    };
  }
}

class Sort {
  String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(createdAt: json['createdAt'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'createdAt': createdAt};
  }
}