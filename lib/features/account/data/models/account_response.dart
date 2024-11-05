class AccountResponse {
  bool? success;
  UserData? data;

  AccountResponse({this.success, this.data});

  factory AccountResponse.fromJson(Map<String, dynamic> json) {
    return AccountResponse(
        success: json['success'] as bool?,
        data: json['data'] != null ? UserData.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class UserData {
  User? user;
  UnreadNotifications? unreadNotifications;

  UserData({this.user, this.unreadNotifications});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        unreadNotifications: json['unreadNotifications'] != null
            ? UnreadNotifications.fromJson(json['unreadNotifications'])
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'unreadNotifications': unreadNotifications?.toJson()
    };
  }
}

class User {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  List<dynamic>? favouriteAds; // Updated spelling to match the new key
  String? role;
  bool? isActive;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  List<String>?
      maintenanceCenters; // Changed to List<String> to reflect the new structure

  User(
      {this.id,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.favouriteAds,
      this.role,
      this.isActive,
      this.isVerified,
      this.createdAt,
      this.updatedAt,
      this.maintenanceCenters});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'] as String?,
        fullName: json['fullName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        email: json['email'] as String?,
        favouriteAds: json['favouriteAds'] as List<dynamic>?,
        role: json['role'] as String?,
        isActive: json['isActive'] as bool?,
        isVerified: json['isVerified'] as bool?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        maintenanceCenters: (json['maintenanceCenters'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'favouriteAds': favouriteAds,
      'role': role,
      'isActive': isActive,
      'isVerified': isVerified,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'maintenanceCenters': maintenanceCenters
    };
  }
}

class UnreadNotifications {
  int? message;
  int? total;

  UnreadNotifications({this.message, this.total});

  factory UnreadNotifications.fromJson(Map<String, dynamic> json) {
    return UnreadNotifications(
        message: json['message'] as int?, total: json['total'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'total': total};
  }
}