class BookingSpareParts {
  final String? providerId; // Nullable
  final List<Product>? products; // Nullable
  final String? vehicleId; // Nullable
  final DateTime? bookingTime; // Nullable
  final String? comment; // Nullable

  BookingSpareParts({
    this.providerId,
    this.products,
    this.vehicleId,
    this.bookingTime,
    this.comment,
  });

  // Method to convert JSON to BookingSpareParts object
  factory BookingSpareParts.fromJson(Map<String, dynamic> json) {
    return BookingSpareParts(
      providerId: json['providerId'],
      products: (json['products'] as List?)
          ?.map((product) => Product.fromJson(product))
          .toList(),
      vehicleId: json['vehicleId'],
      bookingTime: json['bookingTime'] != null
          ? DateTime.parse(json['bookingTime'])
          : null,
      comment: json['comment'],
    );
  }

  // Method to convert BookingSpareParts object to JSON
  Map<String, dynamic> toJson() {
    return {
      'providerId': providerId,
      'products': products?.map((product) => product.toJson()).toList(),
      'vehicleId': vehicleId,
      'bookingTime': bookingTime?.toIso8601String(),
      'comment': comment,
    };
  }
}

class Product {
  final String? productId; // Nullable
  final int? quantity; // Nullable

  Product({
    this.productId,
    this.quantity,
  });

  // Method to convert JSON to Product object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  // Method to convert Product object to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
