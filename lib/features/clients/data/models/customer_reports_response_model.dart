class CustomerReportsResponseModel {
  CustomerReportsResponseModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final List<ClientData> data;

  factory CustomerReportsResponseModel.fromJson(Map<String, dynamic> json) {
    return CustomerReportsResponseModel(
      success: json["success"],
      data: json["data"] == null
          ? []
          : List<ClientData>.from(
              json["data"]!.map((x) => ClientData.fromJson(x))),
    );
  }
}

class ClientData {
  ClientData({
    required this.id,
    required this.fullName,
    required this.picture,
    required this.phoneNumber,
    required this.email,
    required this.countryId,
    required this.favoriteAds,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.isSuperAdmin,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.vehicles,
  });

  final String id;
  final String fullName;
  final dynamic picture;
  final String phoneNumber;
  final String email;
  final String countryId;
  final List<dynamic> favoriteAds;
  final String role;
  final bool isActive;
  final bool isVerified;
  final bool isSuperAdmin;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final List<VehicleData> vehicles;

  factory ClientData.fromJson(Map<String, dynamic> json) {
    return ClientData(
      id: json["_id"],
      fullName: json["fullName"],
      picture: json["picture"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      countryId: json["countryId"],
      favoriteAds: json["favoriteAds"] == null
          ? []
          : List<dynamic>.from(json["favoriteAds"]!.map((x) => x)),
      role: json["role"],
      isActive: json["isActive"],
      isVerified: json["isVerified"],
      isSuperAdmin: json["isSuperAdmin"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json["__v"],
      vehicles: json["vehicles"] == null
          ? []
          : List<VehicleData>.from(
              json["vehicles"]!.map((x) => VehicleData.fromJson(x))),
    );
  }
}

class VehicleData {
  VehicleData({
    required this.id,
    required this.brandId,
    required this.model,
    required this.modelAr,
    required this.manufacturingYear,
    required this.plateNumber,
    required this.engineType,
    required this.tankCapacity,
    required this.motorNumber,
    required this.chassisNumber,
    required this.gearShiftType,
    required this.ccNumber,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String brandId;
  final String model;
  final String modelAr;
  final int? manufacturingYear;
  final String plateNumber;
  final String engineType;
  final String tankCapacity;
  final String motorNumber;
  final String chassisNumber;
  final String gearShiftType;
  final int ccNumber;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;

  factory VehicleData.fromJson(Map<String, dynamic> json) {
    return VehicleData(
      id: json["_id"],
      brandId: json["brandId"],
      model: json["model"],
      modelAr: json["modelAr"],
      manufacturingYear: json["manufacturingYear"],
      plateNumber: json["plateNumber"],
      engineType: json["engineType"],
      tankCapacity: json["tankCapacity"],
      motorNumber: json["motorNumber"],
      chassisNumber: json["chassisNumber"],
      gearShiftType: json["gearShiftType"],
      ccNumber: json["CCNumber"],
      userId: json["userId"],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json["__v"],
    );
  }
}
