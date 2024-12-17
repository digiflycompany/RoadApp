class ServicesRequest {
  final String name;
  final String nameAr;
  final String typeId;
  final double cost;
  final String brandId;

  ServicesRequest({
    required this.name,
    required this.nameAr,
    required this.typeId,
    required this.cost,
    required this.brandId,
  });

  factory ServicesRequest.fromJson(Map<String, dynamic> json) {
    return ServicesRequest(
      name: json['name'] as String,
      nameAr: json['nameAr'] as String,
      typeId: json['typeId'] as String,
      cost: (json['cost'] as num).toDouble(),
      brandId: json['brandId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nameAr': nameAr,
      'typeId': typeId,
      'cost': cost,
      'brandId': brandId,
    };
  }
}
