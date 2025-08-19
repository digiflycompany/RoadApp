class DeactivateAccResponse {
  DeactivateAccResponse({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory DeactivateAccResponse.fromJson(Map<String, dynamic> json){
    return DeactivateAccResponse(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.fullName,
    required this.picture,
    required this.phoneNumber,
    required this.email,
    required this.countryId,
    required this.favoriteAds,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.isSuperAdmin,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.isSelfDeactivated,
  });

  final String? id;
  final String? fullName;
  final dynamic picture;
  final String? phoneNumber;
  final String? email;
  final String? countryId;
  final List<dynamic> favoriteAds;
  final String? role;
  final bool? isActive;
  final bool? isVerified;
  final bool? isSuperAdmin;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isSelfDeactivated;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      fullName: json["fullName"],
      picture: json["picture"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      countryId: json["countryId"],
      favoriteAds: json["favoriteAds"] == null ? [] : List<dynamic>.from(json["favoriteAds"]!.map((x) => x)),
      role: json["role"],
      isActive: json["isActive"],
      isVerified: json["isVerified"],
      isSuperAdmin: json["isSuperAdmin"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      isSelfDeactivated: json["isSelfDeactivated"],
    );
  }

}
