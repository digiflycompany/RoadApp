class VehiclesResponse {
  final bool? success;
  final VehiclesData? data;

  VehiclesResponse({this.success, this.data});

  factory VehiclesResponse.fromJson(Map<String, dynamic> json) {
    return VehiclesResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? VehiclesData.fromJson(json['data']) : null,
    );
  }
}

class VehiclesData {
  final List<Vehicle>? vehicles;
  final VehicleOptions? options;

  VehiclesData({this.vehicles, this.options});

  factory VehiclesData.fromJson(Map<String, dynamic> json) {
    return VehiclesData(
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((vehicle) => Vehicle.fromJson(vehicle as Map<String, dynamic>))
          .toList(),
      options: json['options'] != null ? VehicleOptions.fromJson(json['options']) : null,
    );
  }
}

class Vehicle {
  final String? id;
  final BrandId? brandId;
  final String? model;
  final String? modelAr;
  final int? manufacturingYear;
  final String? plateNumber;
  final String? engineType;
  final String? tankCapacity;
  final String? motorNumber;
  final String? chassisNumber;
  final String? gearShiftType;
  final int? ccNumber;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Vehicle({
    this.id,
    this.brandId,
    this.model,
    this.modelAr,
    this.manufacturingYear,
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
    this.v,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['_id'] as String?,
      brandId: json['brandId'] != null ? BrandId.fromJson(json['brandId']) : null,
      model: json['model'] as String?,
      modelAr: json['modelAr'] as String?,
      manufacturingYear: json['manufacturingYear'] as int?,
      plateNumber: json['plateNumber'] as String?,
      engineType: json['engineType'] as String?,
      tankCapacity: json['tankCapacity'] as String?,
      motorNumber: json['motorNumber'] as String?,
      chassisNumber: json['chassisNumber'] as String?,
      gearShiftType: json['gearShiftType'] as String?,
      ccNumber: json['CCNumber'] as int?,
      userId: json['userId'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'] as int?,
    );
  }
}

class BrandId {
  final String? id;
  final String? name;
  final String? nameAr;
  final int? v;

  BrandId({this.id, this.name, this.nameAr, this.v});

  factory BrandId.fromJson(Map<String, dynamic> json) {
    return BrandId(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      v: json['__v'] as int?,
    );
  }
}

class VehicleOptions {
  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;
  final int? count;

  VehicleOptions({this.limit, this.skip, this.sort, this.page, this.count});

  factory VehicleOptions.fromJson(Map<String, dynamic> json) {
    return VehicleOptions(
      limit: json['limit'] as int?,
      skip: json['skip'] as int?,
      sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
      page: json['page'] as int?,
      count: json['count'] as int?,
    );
  }
}

class Sort {
  final String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'] as String?,
    );
  }
}
