class CustomerReportsResponseModel {
  final bool success;
  final List<ClientData> data;

  CustomerReportsResponseModel({
    required this.success,
    required this.data,
  });

  factory CustomerReportsResponseModel.fromJson(Map<String, dynamic> json) {
    return CustomerReportsResponseModel(
      success: json['success'],
      data: List<ClientData>.from(
        json['data'].map((item) => ClientData.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
class ClientData {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String countryId;
  final String role;
  final bool isActive;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final List<String> favoriteAds;
  final String picture; // تم إضافته
  final List<VehicleData> vehicles; // تم إضافته

  ClientData({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.countryId,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.favoriteAds,
    required this.picture,
    required this.vehicles,
  });

  factory ClientData.fromJson(Map<String, dynamic> json) {
    return ClientData(
      id: json['_id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      countryId: json['countryId'],
      role: json['role'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
      favoriteAds: List<String>.from(json['favoriteAds']),
      picture: json['picture'], // تم إضافته
      vehicles: json['vehicles'] != null
          ? List<VehicleData>.from(
          json['vehicles'].map((item) => VehicleData.fromJson(item)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'countryId': countryId,
      'role': role,
      'isActive': isActive,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
      'favoriteAds': favoriteAds,
      'picture': picture, // تم إضافته
      'vehicles': vehicles.map((v) => v.toJson()).toList(),
    };
  }
}

class VehicleData {
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
  final int? ccNumber;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  VehicleData({
    required this.id,
    required this.brandId,
    required this.model,
    required this.modelAr,
    this.manufacturingYear,
    required this.plateNumber,
    required this.engineType,
    required this.tankCapacity,
    required this.motorNumber,
    required this.chassisNumber,
    required this.gearShiftType,
    this.ccNumber,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory VehicleData.fromJson(Map<String, dynamic> json) {
    return VehicleData(
      id: json['_id'],
      brandId: json['brandId'],
      model: json['model'],
      modelAr: json['modelAr'],
      manufacturingYear: json['manufacturingYear'],
      plateNumber: json['plateNumber'],
      engineType: json['engineType'],
      tankCapacity: json['tankCapacity'],
      motorNumber: json['motorNumber'],
      chassisNumber: json['chassisNumber'],
      gearShiftType: json['gearShiftType'],
      ccNumber: json['CCNumber'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'brandId': brandId,
      'model': model,
      'modelAr': modelAr,
      'manufacturingYear': manufacturingYear,
      'plateNumber': plateNumber,
      'engineType': engineType,
      'tankCapacity': tankCapacity,
      'motorNumber': motorNumber,
      'chassisNumber': chassisNumber,
      'gearShiftType': gearShiftType,
      'CCNumber': ccNumber,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}



// class CustomerReportsResponseModel {
//   final bool success;
//   final List<ClientData> data;
//
//   CustomerReportsResponseModel({
//     required this.success,
//     required this.data,
//   });
//
//   factory CustomerReportsResponseModel.fromJson(Map<String, dynamic> json) {
//     return CustomerReportsResponseModel(
//       success: json['success'],
//       data: List<ClientData>.from(
//         json['data'].map((item) => ClientData.fromJson(item)),
//       ),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'data': data.map((item) => item.toJson()).toList(),
//     };
//   }
// }
//
// class ClientData {
//   final String id;
//   final String fullName;
//   final String phoneNumber;
//   final String email;
//   final String countryId;
//   final String role;
//   final bool isActive;
//   final bool isVerified;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int version;
//   final List<String> favoriteAds;
//
//   ClientData({
//     required this.id,
//     required this.fullName,
//     required this.phoneNumber,
//     required this.email,
//     required this.countryId,
//     required this.role,
//     required this.isActive,
//     required this.isVerified,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.version,
//     required this.favoriteAds,
//   });
//
//   factory ClientData.fromJson(Map<String, dynamic> json) {
//     return ClientData(
//       id: json['_id'],
//       fullName: json['fullName'],
//       phoneNumber: json['phoneNumber'],
//       email: json['email'],
//       countryId: json['countryId'],
//       role: json['role'],
//       isActive: json['isActive'],
//       isVerified: json['isVerified'],
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//       version: json['__v'],
//       favoriteAds: List<String>.from(json['favoriteAds']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'fullName': fullName,
//       'phoneNumber': phoneNumber,
//       'email': email,
//       'countryId': countryId,
//       'role': role,
//       'isActive': isActive,
//       'isVerified': isVerified,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//       '__v': version,
//       'favoriteAds': favoriteAds,
//     };
//   }
// }
