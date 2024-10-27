class LoginResponse {
  final bool success;
  final Data data;

  LoginResponse({required this.success, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final User user;
  final String token;

  Data({required this.user, required this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String countryId;
  final List<dynamic> favouriteAds;
  final String role;
  final bool isActive;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  User({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.countryId,
    required this.favouriteAds,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      countryId: json['countryId'],
      favouriteAds: List<dynamic>.from(json['favouriteAds']),
      role: json['role'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }
}
