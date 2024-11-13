class AddRateResponse {
  final bool? success;
  final RateData? data;

  AddRateResponse({this.success, this.data});

  factory AddRateResponse.fromJson(Map<String, dynamic> json) {
    return AddRateResponse(
        success: json['success'] as bool?,
        data: json['data'] != null
            ? RateData.fromJson(json['data'] as Map<String, dynamic>)
            : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class RateData {
  final num? odometerBefore;
  final num? kmCount;
  final num? kmPerLiter;
  final num? kmPerEGP;
  final num? literCount;
  final num? literPrice;
  final num? fullTankPrice;
  final String? clientId;
  final String? vehicleId;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  RateData(
      {this.odometerBefore,
      this.kmCount,
      this.kmPerLiter,
      this.kmPerEGP,
      this.literCount,
      this.literPrice,
      this.fullTankPrice,
      this.clientId,
      this.vehicleId,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory RateData.fromJson(Map<String, dynamic> json) {
    return RateData(
        odometerBefore: _toNum(json['odometerBefore']),
        kmCount: _toNum(json['kmCount']),
        kmPerLiter: _toNum(json['kmPerLiter']),
        kmPerEGP: _toNum(json['kmPerEGP']),
        literCount: _toNum(json['literCount']),
        literPrice: _toNum(json['literPrice']),
        fullTankPrice: _toNum(json['fullTankPrice']),
        clientId: json['clientId'] as String?,
        vehicleId: json['vehicleId'] as String?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        v: json['__v'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {
      'odometerBefore': odometerBefore,
      'kmCount': kmCount,
      'kmPerLiter': kmPerLiter,
      'kmPerEGP': kmPerEGP,
      'literCount': literCount,
      'literPrice': literPrice,
      'fullTankPrice': fullTankPrice,
      'clientId': clientId,
      'vehicleId': vehicleId,
      '_id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v
    };
  }

  static num? _toNum(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value;
    return null;
  }
}
