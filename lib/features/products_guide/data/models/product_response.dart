class ProductResponse {
  final bool? success;
  final ProductData? data;

  ProductResponse({this.success, this.data});

  // Convert JSON to ProductResponse
  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? ProductData.fromJson(json['data']) : null,
    );
  }

  // Convert ProductResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class ProductData {
  final String? name;
  final String? nameAr;
  final int? availableQuantity;
  final Price? price;
  final String? currency;
  final List<String>? images;
  final List<String>? tags;
  final String? maintenanceCenterId;
  final String? typeId;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  ProductData({
    this.name,
    this.nameAr,
    this.availableQuantity,
    this.price,
    this.currency,
    this.images,
    this.tags,
    this.maintenanceCenterId,
    this.typeId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  // Convert JSON to ProductData
  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      availableQuantity: json['availableQuantity'] as int?,
      price: json['price'] != null ? Price.fromJson(json['price']) : null,
      currency: json['currency'] as String?,
      images: (json['images'] as List?)?.map((e) => e as String).toList(),
      tags: (json['tags'] as List?)?.map((e) => e as String).toList(),
      maintenanceCenterId: json['maintenanceCenterId'] as String?,
      typeId: json['typeId'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      v: json['__v'] as int?,
    );
  }

  // Convert ProductData to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nameAr': nameAr,
      'availableQuantity': availableQuantity,
      'price': price?.toJson(),
      'currency': currency,
      'images': images,
      'tags': tags,
      'maintenanceCenterId': maintenanceCenterId,
      'typeId': typeId,
      '_id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}

class Price {
  final double? originalPrice;
  final double? finalPrice;

  Price({this.originalPrice, this.finalPrice});

  // Convert JSON to Price
  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      finalPrice: (json['finalPrice'] as num?)?.toDouble(),
    );
  }

  // Convert Price to JSON
  Map<String, dynamic> toJson() {
    return {
      'originalPrice': originalPrice,
      'finalPrice': finalPrice,
    };
  }
}
