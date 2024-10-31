class AddVehicleResponse {
  bool? success;
  VehicleData? data;

  AddVehicleResponse({this.success, this.data});

  factory AddVehicleResponse.fromJson(Map<String, dynamic> json) {
    return AddVehicleResponse(
        success: json['success'] as bool?,
        data: json['data'] != null ? VehicleData.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class VehicleData {
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
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  VehicleData(
      {this.brandId,
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
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory VehicleData.fromJson(Map<String, dynamic> json) {
    return VehicleData(
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
        id: json['_id'] as String?,
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
      '_id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v
    };
  }
}