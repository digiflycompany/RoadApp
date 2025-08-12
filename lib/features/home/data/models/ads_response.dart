

class AdsResponse {
  AdsResponse({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory AdsResponse.fromJson(Map<String, dynamic> json){
    return AdsResponse(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.ads,
    required this.options,
  });

  final List<Ad> ads;
  final AdsOptions? options;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      ads: json["ADs"] == null ? [] : List<Ad>.from(json["ADs"]!.map((x) => Ad.fromJson(x))),
      options: json["options"] == null ? null : AdsOptions.fromJson(json["options"]),
    );
  }

}

class Ad {
  Ad({
    required this.id,
    required this.maintenanceCenterId,
    required this.images,
    required this.type,
    required this.status,
    required this.v,
    required this.isInFavorite,
  });

  final String? id;
  final String? maintenanceCenterId;
  final List<String> images;
  final String? type;
  final String? status;
  final int? v;
  final bool? isInFavorite;

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json["_id"],
      maintenanceCenterId: json["maintenanceCenterId"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      type: json["type"],
      status: json["status"],
      v: json["__v"],
      isInFavorite: json["isInFavorite"],
    );
  }

  Ad copyWith({
    String? id,
    String? maintenanceCenterId,
    List<String>? images,
    String? type,
    String? status,
    int? v,
    bool? isInFavorite,
  }) {
    return Ad(
      id: id ?? this.id,
      maintenanceCenterId: maintenanceCenterId ?? this.maintenanceCenterId,
      images: images ?? this.images,
      type: type ?? this.type,
      status: status ?? this.status,
      v: v ?? this.v,
      isInFavorite: isInFavorite ?? this.isInFavorite,
    );
  }
}


class AdsOptions {
  AdsOptions({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;
  final int? count;

  factory AdsOptions.fromJson(Map<String, dynamic> json){
    return AdsOptions(
      limit: json["limit"],
      skip: json["skip"],
      sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
      page: json["page"],
      count: json["count"],
    );
  }

}

class Sort {
  Sort({
    required this.createdAt,
  });

  final String? createdAt;

  factory Sort.fromJson(Map<String, dynamic> json){
    return Sort(
      createdAt: json["createdAt"],
    );
  }

}
