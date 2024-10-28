class ClientRegisterResponse {
  bool? success;
  RegisterData? data;

  ClientRegisterResponse({this.success, this.data});

  factory ClientRegisterResponse.fromJson(Map<String, dynamic> json) {
    return ClientRegisterResponse(
        success: json['success'] as bool?,
        data:
            json['data'] != null ? RegisterData.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class RegisterData {
  User? user;
  String? token;

  RegisterData({this.user, this.token});

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        token: json['token'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'user': user?.toJson(), 'token': token};
  }
}

class User {
  String? fullName;
  String? phoneNumber;
  String? email;
  String? countryId;
  List<dynamic>? favoriteAds;
  String? role;
  bool? isActive;
  bool? isVerified;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

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
      this.v});

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
        v: json['__v'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'countryId': countryId,
      'favoriteAds': favoriteAds,
      'role': role,
      'isActive': isActive,
      'isVerified': isVerified,
      '_id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v
    };
  }
}