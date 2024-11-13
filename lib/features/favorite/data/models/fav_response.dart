class FavResponse {
  bool? success;
  Data? data;

  FavResponse({this.success, this.data});

  factory FavResponse.fromJson(Map<String, dynamic> json) {
    return FavResponse(
        success: json['success'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
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
  String? createdAt;
  String? updatedAt;
  List<FavoriteAd>? favoriteAds;

  Data(
      {this.id,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.countryId,
      this.role,
      this.isActive,
      this.isVerified,
      this.createdAt,
      this.updatedAt,
      this.favoriteAds});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['_id'],
        fullName: json['fullName'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        countryId: json['countryId'],
        role: json['role'],
        isActive: json['isActive'],
        isVerified: json['isVerified'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        favoriteAds: json['favoriteAds'] != null
            ? (json['favoriteAds'] as List)
                .map((e) => FavoriteAd.fromJson(e))
                .toList()
            : null);
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'favoriteAds': favoriteAds?.map((e) => e.toJson()).toList()
    };
  }
}

class FavoriteAd {
  String? id;
  String? maintenanceCenterId;
  List<String>? images;
  bool? isActive;
  int? v;
  String? state;

  FavoriteAd(
      {this.id,
      this.maintenanceCenterId,
      this.images,
      this.isActive,
      this.v,
      this.state});

  factory FavoriteAd.fromJson(Map<String, dynamic> json) {
    return FavoriteAd(
        id: json['_id'],
        maintenanceCenterId: json['maintenanceCenterId'],
        images:
            json['images'] != null ? List<String>.from(json['images']) : null,
        isActive: json['isActive'],
        v: json['__v'],
        state: json['state']);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'maintenanceCenterId': maintenanceCenterId,
      'images': images,
      'isActive': isActive,
      '__v': v,
      'state': state
    };
  }
}