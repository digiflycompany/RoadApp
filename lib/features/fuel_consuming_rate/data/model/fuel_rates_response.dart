class FuelRatesResponse {
  bool? success;
  FuelData? data;

  FuelRatesResponse({this.success, this.data});

  factory FuelRatesResponse.fromJson(Map<String, dynamic> json) {
    return FuelRatesResponse(
      success: json['success'] as bool?,
      data: json['data'] != null
          ? FuelData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
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
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rides': rides?.map((ride) => ride.toJson()).toList(),
      'options': options?.toJson(),
    };
  }
}

class Ride {
  String? id;
  double? odometerBefore;
  double? kmCount;
  double? kmPerLiter;
  double? kmPerEGP;
  double? literCount;
  double? literPrice;
  double? fullTankPrice;
  String? clientId;
  String? createdAt;
  String? updatedAt;
  int? v;

  Ride({
    this.id,
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
    this.v,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['_id'] as String?,
      odometerBefore: _toDouble(json['odometerBefore']),
      kmCount: _toDouble(json['kmCount']),
      kmPerLiter: _toDouble(json['kmPerLiter']),
      kmPerEGP: _toDouble(json['kmPerEGP']),
      literCount: _toDouble(json['literCount']),
      literPrice: _toDouble(json['literPrice']),
      fullTankPrice: _toDouble(json['fullTankPrice']),
      clientId: json['clientId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );
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
      '__v': v,
    };
  }

  // Helper function to convert int or double to double
  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is int) return value.toDouble();
    return value as double?;
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
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort?.toJson(),
      'page': page,
      'count': count,
    };
  }
}

class Sort {
  String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
    };
  }
}