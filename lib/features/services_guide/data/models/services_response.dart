class ServicesResponse {
  final bool? success;
  final MaintenanceData? data;

  ServicesResponse({this.success, this.data});

  factory ServicesResponse.fromJson(Map<String, dynamic> json) {
    return ServicesResponse(
      success: json['success'] as bool?,
      data: json['data'] != null
          ? MaintenanceData.fromJson(json['data'])
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

class MaintenanceData {
  final String? name;
  final String? nameAr;
  final String? maintenanceCenterId;
  final double? cost;
  final String? model;
  final String? typeId;
  final String? id;
  final int? v;

  MaintenanceData({
    this.name,
    this.nameAr,
    this.maintenanceCenterId,
    this.cost,
    this.model,
    this.typeId,
    this.id,
    this.v,
  });

  factory MaintenanceData.fromJson(Map<String, dynamic> json) {
    return MaintenanceData(
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      maintenanceCenterId: json['maintenanceCenterId'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      model: json['model'] as String?,
      typeId: json['typeId'] as String?,
      id: json['_id'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nameAr': nameAr,
      'maintenanceCenterId': maintenanceCenterId,
      'cost': cost,
      'model': model,
      'typeId': typeId,
      '_id': id,
      '__v': v,
    };
  }
}
