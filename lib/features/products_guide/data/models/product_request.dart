class ProductRequest {
  final String name;
  final String nameAr;
  final String typeId;
  final int availableQuantity;
  final PriceProduct price;
  final String currency;

  ProductRequest({
    required this.name,
    required this.nameAr,
    required this.typeId,
    required this.availableQuantity,
    required this.price,
    required this.currency,
  });

  // Convert JSON to Product
  factory ProductRequest.fromJson(Map<String, dynamic> json) {
    return ProductRequest(
      name: json['name'],
      nameAr: json['nameAr'],
      typeId: json['typeId'],
      availableQuantity: json['availableQuantity'],
      price: PriceProduct.fromJson(json['price']),
      currency: json['currency'],
    );
  }

  // Convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nameAr': nameAr,
      'typeId': typeId,
      'availableQuantity': availableQuantity,
      'price': price.toJson(),
      'currency': currency,
    };
  }
}

class PriceProduct {
  final double originalPrice;
  final double finalPrice;

  PriceProduct({
    required this.originalPrice,
    required this.finalPrice,
  });

  // Convert JSON to Price
  factory PriceProduct.fromJson(Map<String, dynamic> json) {
    return PriceProduct(
      originalPrice: json['originalPrice'].toDouble(),
      finalPrice: json['finalPrice'].toDouble(),
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
