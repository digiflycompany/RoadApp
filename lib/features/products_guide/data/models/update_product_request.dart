class UpdateProductRequest {
  final int availableQuantity;
  final PriceUpdateProduct price;

  UpdateProductRequest({
    required this.availableQuantity,
    required this.price,
  });

  factory UpdateProductRequest.fromJson(Map<String, dynamic> json) {
    return UpdateProductRequest(
      availableQuantity: json['availableQuantity'],
      price: PriceUpdateProduct.fromJson(json['price']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'availableQuantity': availableQuantity,
      'price': price.toJson(),
    };
  }
}

class PriceUpdateProduct {
  final double originalPrice;
  final double finalPrice;

  PriceUpdateProduct({
    required this.originalPrice,
    required this.finalPrice,
  });

  factory PriceUpdateProduct.fromJson(Map<String, dynamic> json) {
    return PriceUpdateProduct(
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
