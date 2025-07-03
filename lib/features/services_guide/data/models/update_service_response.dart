class UpdateServiceResponse {
  final bool? success;
  final ServiceData? data;

  UpdateServiceResponse({this.success, this.data});

  factory UpdateServiceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServiceResponse(
      success: json['success'],
      data: json['data'] != null ? ServiceData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class ServiceData {
  final String? id;
  final String? name;
  final String? nameAr;
  final String? maintenanceCenterId;
  final int? cost;
  final String? brandId;
  final String? typeId;
  final int? v;

  ServiceData({
    this.id,
    this.name,
    this.nameAr,
    this.maintenanceCenterId,
    this.cost,
    this.brandId,
    this.typeId,
    this.v,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) {
    return ServiceData(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
      maintenanceCenterId: json['maintenanceCenterId'],
      cost: json['cost'],
      brandId: json['brandId'],
      typeId: json['typeId'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
      'maintenanceCenterId': maintenanceCenterId,
      'cost': cost,
      'brandId': brandId,
      'typeId': typeId,
      '__v': v,
    };
  }
}
