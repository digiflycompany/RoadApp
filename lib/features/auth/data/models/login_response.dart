class LoginResponse {
  final bool? success;
  final LoginData? data;

  LoginResponse({this.success, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }
}

class LoginData {
  final User? user;
  final String? token;

  LoginData({this.user, this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'] as String?,
    );
  }
}

class User {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? countryId;
  final String? role;
  final bool? isActive;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final List<String>? favoriteAds;
  final String? picture;

  User({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.countryId,
    this.role,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.favoriteAds,
    this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      picture: json['picture'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      countryId: json['countryId'] as String?,
      role: json['role'] as String?,
      isActive: json['isActive'] as bool?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      v: json['__v'] as int?,
      favoriteAds: (json['favoriteAds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }
}