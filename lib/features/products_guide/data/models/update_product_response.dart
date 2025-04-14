class UpdateProductResponse {
  final bool success;
  final ProductData data;

  UpdateProductResponse({
    required this.success,
    required this.data,
  });

  factory UpdateProductResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProductResponse(
      success: json['success'],
      data: ProductData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class ProductData {
  final String id;
  final String name;
  final String nameAr;
  final int availableQuantity;
  final Price price;
  final String currency;
  final List<String> images;
  final List<String> tags;
  final String maintenanceCenterId;
  final String typeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  ProductData({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.availableQuantity,
    required this.price,
    required this.currency,
    required this.images,
    required this.tags,
    required this.maintenanceCenterId,
    required this.typeId,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
      availableQuantity: json['availableQuantity'],
      price: Price.fromJson(json['price']),
      currency: json['currency'],
      images: List<String>.from(json['images']),
      tags: List<String>.from(json['tags']),
      maintenanceCenterId: json['maintenanceCenterId'],
      typeId: json['typeId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
      'availableQuantity': availableQuantity,
      'price': price.toJson(),
      'currency': currency,
      'images': images,
      'tags': tags,
      'maintenanceCenterId': maintenanceCenterId,
      'typeId': typeId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}

class Price {
  final double originalPrice;
  final double finalPrice;

  Price({
    required this.originalPrice,
    required this.finalPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      originalPrice: (json['originalPrice'] as num).toDouble(),
      finalPrice: (json['finalPrice'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originalPrice': originalPrice,
      'finalPrice': finalPrice,
    };
  }
}
