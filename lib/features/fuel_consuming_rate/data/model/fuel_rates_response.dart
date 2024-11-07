class FuelRatesResponse {
  final bool? success;
  final FuelRatesData? data;

  FuelRatesResponse({this.success, this.data});

  factory FuelRatesResponse.fromJson(Map<String, dynamic> json) {
    return FuelRatesResponse(
        success: json['success'] as bool?,
        data: json['data'] != null
            ? FuelRatesData.fromJson(json['data'] as Map<String, dynamic>)
            : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class FuelRatesData {
  final List<Ride>? rides;
  final RatesOptions? options;

  FuelRatesData({this.rides, this.options});

  factory FuelRatesData.fromJson(Map<String, dynamic> json) {
    return FuelRatesData(
        rides: (json['rides'] as List?)
            ?.map((e) => Ride.fromJson(e as Map<String, dynamic>))
            .toList(),
        options: json['options'] != null
            ? RatesOptions.fromJson(json['options'] as Map<String, dynamic>)
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'rides': rides?.map((e) => e.toJson()).toList(),
      'options': options?.toJson()
    };
  }
}

class Ride {
  final String? id;
  final int? odometerBefore;
  final int? kmCount;
  final double? kmPerLiter;
  final double? kmPerEGP;
  final int? literCount;
  final double? literPrice;
  final double? fullTankPrice;
  final String? clientId;
  final String? vehicleId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

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
      this.vehicleId,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
        id: json['_id'] as String?,
        odometerBefore: json['odometerBefore'] as int?,
        kmCount: json['kmCount'] as int?,
        kmPerLiter: (json['kmPerLiter'] as num?)?.toDouble(),
        kmPerEGP: (json['kmPerEGP'] as num?)?.toDouble(),
        literCount: json['literCount'] as int?,
        literPrice: (json['literPrice'] as num?)?.toDouble(),
        fullTankPrice: (json['fullTankPrice'] as num?)?.toDouble(),
        clientId: json['clientId'] as String?,
        vehicleId: json['vehicleId'] as String?,
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
      'vehicleId': vehicleId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v
    };
  }
}

class RatesOptions {
  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;
  final int? count;

  RatesOptions({this.limit, this.skip, this.sort, this.page, this.count});

  factory RatesOptions.fromJson(Map<String, dynamic> json) {
    return RatesOptions(
        limit: json['limit'] as int?,
        skip: json['skip'] as int?,
        sort: json['sort'] != null
            ? Sort.fromJson(json['sort'] as Map<String, dynamic>)
            : null,
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
  final String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(createdAt: json['createdAt'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'createdAt': createdAt};
  }
}