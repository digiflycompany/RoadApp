class SendCodeResponse {
  final bool? success;
  final UserData? data;

  SendCodeResponse({this.success, this.data});

  factory SendCodeResponse.fromJson(Map<String, dynamic> json) {
    return SendCodeResponse(
        success: json['success'] as bool?,
        data: json['data'] != null ? UserData.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class UserData {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? countryId;
  final List<String>? favoriteAds;
  final String? role;
  final bool? isActive;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? maintenanceCenterId;

  UserData(
      {this.id,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.countryId,
      this.favoriteAds,
      this.role,
      this.isActive,
      this.isVerified,
      this.createdAt,
      this.updatedAt,
      this.maintenanceCenterId});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['_id'] as String?,
        fullName: json['fullName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        email: json['email'] as String?,
        countryId: json['countryId'] as String?,
        favoriteAds: (json['favoriteAds'] as List<dynamic>?)
            ?.map((item) => item as String)
            .toList(),
        role: json['role'] as String?,
        isActive: json['isActive'] as bool?,
        isVerified: json['isVerified'] as bool?,
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        maintenanceCenterId: json['maintenanceCenterId'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'countryId': countryId,
      'favoriteAds': favoriteAds,
      'role': role,
      'isActive': isActive,
      'isVerified': isVerified,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'maintenanceCenterId': maintenanceCenterId
    };
  }
}