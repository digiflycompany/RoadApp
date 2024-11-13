class FuelRatesResponse {
  bool? success;
  FuelData? data;

  FuelRatesResponse({this.success, this.data});

  factory FuelRatesResponse.fromJson(Map<String, dynamic> json) {
    return FuelRatesResponse(
        success: json['success'] as bool?,
        data: json['data'] != null
            ? FuelData.fromJson(json['data'] as Map<String, dynamic>)
            : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class FuelData {
  List<Ride>? rides;
  RidesOptions? options;

  FuelData({this.rides, this.options});

  factory FuelData.fromJson(Map<String, dynamic> json) {
    return FuelData(
        rides: (json['rides'] as List?)
            ?.map((item) => Ride.fromJson(item as Map<String, dynamic>))
            .toList(),
        options: json['options'] != null
            ? RidesOptions.fromJson(json['options'] as Map<String, dynamic>)
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'rides': rides?.map((ride) => ride.toJson()).toList(),
      'options': options?.toJson()
    };
  }
}

class Ride {
  String? id;
  num? odometerBefore;
  num? kmCount;
  num? kmPerLiter;
  num? kmPerEGP;
  num? literCount;
  num? literPrice;
  num? fullTankPrice;
  String? clientId;
  String? createdAt;
  String? updatedAt;
  int? v;

  Ride(
      {this.id,
      this.odometerBefore,
      this.kmCount,
      this.kmPerLiter,
      this.kmPerEGP,
      this.literCount,
      this.literPrice,
      this.fullTankPrice,
      this.clientId,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
        id: json['_id'] as String?,
        odometerBefore: _toNum(json['odometerBefore']),
        kmCount: _toNum(json['kmCount']),
        kmPerLiter: _toNum(json['kmPerLiter']),
        kmPerEGP: _toNum(json['kmPerEGP']),
        literCount: _toNum(json['literCount']),
        literPrice: _toNum(json['literPrice']),
        fullTankPrice: _toNum(json['fullTankPrice']),
        clientId: json['clientId'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        v: json['__v'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'odometerBefore': odometerBefore,
      'kmCount': kmCount,
      'kmPerLiter': kmPerLiter,
      'kmPerEGP': kmPerEGP,
      'literCount': literCount,
      'literPrice': literPrice,
      'fullTankPrice': fullTankPrice,
      'clientId': clientId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v
    };
  }

  static num? _toNum(dynamic value) {
    if (value == null) return null;
    if (value is num) return value;
    return null;
  }
}

class RidesOptions {
  int? limit;
  int? skip;
  Sort? sort;
  int? page;
  int? count;

  RidesOptions({this.limit, this.skip, this.sort, this.page, this.count});

  factory RidesOptions.fromJson(Map<String, dynamic> json) {
    return RidesOptions(
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