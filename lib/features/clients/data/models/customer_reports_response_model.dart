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
    };
  }
}
