class UpdateProfileResponse {
  bool? success;
  UserData? data;

  UpdateProfileResponse({this.success, this.data});

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
        success: json['success'] as bool?,
        data: json['data'] != null ? UserData.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class UserData {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? countryId;
  List<dynamic>? favoriteAds; // Assuming this can be a list of dynamic types
  String? role;
  bool? isActive;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;

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
      this.updatedAt});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['_id'] as String?,
        fullName: json['fullName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        email: json['email'] as String?,
        countryId: json['countryId'] as String?,
        favoriteAds: json['favoriteAds'] as List<dynamic>?,
        role: json['role'] as String?,
        isActive: json['isActive'] as bool?,
        isVerified: json['isVerified'] as bool?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?);
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
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}