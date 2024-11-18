class AdsResponse {
  bool? success;
  Data? data;

  AdsResponse({this.success, this.data});

  factory AdsResponse.fromJson(Map<String, dynamic> json) {
    return AdsResponse(
        success: json['success'] as bool?,
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class Data {
  List<AD>? ads;
  AdsOptions? options;

  Data({this.ads, this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        ads: (json['ADs'] as List?)
            ?.map((item) => AD.fromJson(item as Map<String, dynamic>))
            .toList(),
        options:
            json['options'] != null ? AdsOptions.fromJson(json['options']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'ADs': ads?.map((ad) => ad.toJson()).toList(),
      'options': options?.toJson()
    };
  }
}

class AD {
  String? id;
  String? maintenanceCenterId;
  List<String>? images;
  bool? isActive;
  int? v;
  String? status;

  AD(
      {this.id,
      this.maintenanceCenterId,
      this.images,
      this.isActive,
      this.v,
      this.status});

  factory AD.fromJson(Map<String, dynamic> json) {
    return AD(
        id: json['_id'] as String?,
        maintenanceCenterId: json['maintenanceCenterId'] as String?,
        images:
            (json['images'] as List?)?.map((item) => item as String).toList(),
        isActive: json['isActive'] as bool?,
        v: json['__v'] as int?,
        status: json['status'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'maintenanceCenterId': maintenanceCenterId,
      'images': images,
      'isActive': isActive,
      '__v': v,
      'status': status
    };
  }
}

class AdsOptions {
  int? limit;
  int? skip;
  Sort? sort;
  int? page;
  int? count;

  AdsOptions({this.limit, this.skip, this.sort, this.page, this.count});

  factory AdsOptions.fromJson(Map<String, dynamic> json) {
    return AdsOptions(
        limit: json['limit'] as int?,
        skip: json['skip'] as int?,
        sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
        page: json['page'] as int?,
        count: json['count'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort?.toJson(),
      'page': page,
      'count': count
    };
  }
}

class Sort {
  String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(createdAt: json['createdAt'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'createdAt': createdAt};
  }
}