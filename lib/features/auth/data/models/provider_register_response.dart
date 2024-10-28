class ProviderRegisterResponse {
  final bool? success;
  final ProviderData? data;

  ProviderRegisterResponse({this.success, this.data});

  factory ProviderRegisterResponse.fromJson(Map<String, dynamic> json) {
    return ProviderRegisterResponse(
        success: json['success'] as bool?,
        data:
            json['data'] != null ? ProviderData.fromJson(json['data']) : null);
  }
}

class ProviderData {
  final User? user;
  final String? token;

  ProviderData({this.user, this.token});

  factory ProviderData.fromJson(Map<String, dynamic> json) {
    return ProviderData(
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        token: json['token'] as String?);
  }
}

class User {
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? countryId;
  final List<dynamic>? favoriteAds;
  final String? role;
  final bool? isActive;
  final bool? isVerified;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? maintenanceCenterId;

  User(
      {this.fullName,
      this.phoneNumber,
      this.email,
      this.countryId,
      this.favoriteAds,
      this.role,
      this.isActive,
      this.isVerified,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.maintenanceCenterId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        fullName: json['fullName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        email: json['email'] as String?,
        countryId: json['countryId'] as String?,
        favoriteAds: json['favoriteAds'] as List<dynamic>?,
        role: json['role'] as String?,
        isActive: json['isActive'] as bool?,
        isVerified: json['isVerified'] as bool?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        v: json['__v'] as int?,
        maintenanceCenterId: json['maintenanceCenterId'] as String?);
  }
}