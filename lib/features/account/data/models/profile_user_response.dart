class ProfileUserResponse {
  final bool? success; // يمكن أن يكون null
  final UserDataUser? data;

  ProfileUserResponse({this.success, this.data});

  factory ProfileUserResponse.fromJson(Map<String, dynamic> json) {
    return ProfileUserResponse(
      success: json['success'], // يدعم null الآن
      data: json['data'] != null ? UserDataUser.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class UserDataUser {
  final UserUser? user;
  final Notifications? unreadNotifications;

  UserDataUser({this.user, this.unreadNotifications});

  factory UserDataUser.fromJson(Map<String, dynamic> json) {
    return UserDataUser(
      user: json['user'] != null ? UserUser.fromJson(json['user']) : null,
      unreadNotifications: json['unreadNotifications'] != null
          ? Notifications.fromJson(json['unreadNotifications'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'unreadNotifications': unreadNotifications?.toJson(),
    };
  }
}

class UserUser {
  final String? id; // يمكن أن يكون null
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? countryId;
  final String? role;
  final bool? isActive;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? favoriteAds; // قائمة قد تكون null
  final String? picture;

  UserUser({
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
    this.favoriteAds,
    this.picture,
  });

  factory UserUser.fromJson(Map<String, dynamic> json) {
    return UserUser(
      id: json['_id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      countryId: json['countryId'],
      role: json['role'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      picture: json['picture'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      favoriteAds: json['favoriteAds'] != null ? List<String>.from(json['favoriteAds']) : null,
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'favoriteAds': favoriteAds,
      'picture': picture,
    };
  }
}

class Notifications {
  final int? message; // يمكن أن يكون null
  final int? total;

  Notifications({this.message, this.total});

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      message: json['message'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'total': total,
    };
  }
}
