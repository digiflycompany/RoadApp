import 'package:intl/intl.dart';

class AddToFavResponse {
  bool? success;
  Data? data;

  AddToFavResponse({this.success, this.data});

  factory AddToFavResponse.fromJson(Map<String, dynamic> json) {
    return AddToFavResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? countryId;
  String? role;
  bool? isActive;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? favoriteAds;

  Data({
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
    this.favoriteAds
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
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
      favoriteAds: (json['favoriteAds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['countryId'] = countryId;
    data['role'] = role;
    data['isActive'] = isActive;
    data['isVerified'] = isVerified;
    if (createdAt != null) {
      data['createdAt'] = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(createdAt!);
    }
    if (updatedAt != null) {
      data['updatedAt'] = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(updatedAt!);
    }
    data['favoriteAds'] = favoriteAds;
    return data;
  }
}