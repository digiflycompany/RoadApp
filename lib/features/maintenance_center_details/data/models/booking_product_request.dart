class BookingProductRequest {
  String? providerId;
  List<String>? services;
  List<Product>? products;
  String? vehicleId;
  DateTime? bookingTime;
  String? couponId;

  BookingProductRequest({
    this.providerId,
    this.services,
    this.products,
    this.vehicleId,
    this.bookingTime,
    this.couponId,
  });

  // Factory method to create a Booking from a JSON map
  factory BookingProductRequest.fromJson(Map<String, dynamic> json) {
    return BookingProductRequest(
      providerId: json['providerId'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((service) => service as String)
          .toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((product) => Product.fromJson(product as Map<String, dynamic>))
          .toList(),
      vehicleId: json['vehicleId'] as String?,
      bookingTime: json['bookingTime'] != null
          ? DateTime.parse(json['bookingTime'] as String)
          : null,
      couponId: json['couponId'] as String?,
    );
  }

  // Method to convert a Booking object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'providerId': providerId,
      'services': services,
      'products': products?.map((product) => product.toJson()).toList(),
      'vehicleId': vehicleId,
      'bookingTime': bookingTime?.toIso8601String(),
      'couponId': couponId,
    };
  }
}

class Product {
  String? productId;
  int? quantity;

  Product({
    this.productId,
    this.quantity,
  });

  // Factory method to create a Product from a JSON map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] as String?,
      quantity: json['quantity'] as int?,
    );
  }

  // Method to convert a Product object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
