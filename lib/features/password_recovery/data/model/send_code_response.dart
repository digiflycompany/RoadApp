class SendCodeResponse {
  bool? success;
  Data? data;

  SendCodeResponse({this.success, this.data});

  factory SendCodeResponse.fromJson(Map<String, dynamic> json) {
    return SendCodeResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class Data {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  List<dynamic>? favouriteAds;
  String? role;
  bool? isActive;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.favouriteAds,
    this.role,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      favouriteAds: json['favouriteAds'] as List<dynamic>?,
      role: json['role'] as String?,
      isActive: json['isActive'] as bool?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}