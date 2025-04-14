class UpdateBookingProviderResponse {
  final bool success;
  final BookingData data;

  UpdateBookingProviderResponse({required this.success, required this.data});

  factory UpdateBookingProviderResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBookingProviderResponse(
      success: json['success'],
      data: BookingData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class BookingData {
  final String id;
  final String status;
  final List<String>? services;
  final List<Product>? products;
  final String vehicleId;
  final String clientId;
  final String providerId;
  final Price price;
  final DateTime bookingTime;
  final String comment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  BookingData({
    required this.id,
    required this.status,
    this.services,
    this.products,
    required this.vehicleId,
    required this.clientId,
    required this.providerId,
    required this.price,
    required this.bookingTime,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      id: json['_id'],
      status: json['status'],
      services: json['services'] != null ? List<String>.from(json['services']) : null,
      products: json['products'] != null
          ? (json['products'] as List).map((product) => Product.fromJson(product)).toList()
          : null,
      vehicleId: json['vehicleId'],
      clientId: json['clientId'],
      providerId: json['providerId'],
      price: Price.fromJson(json['price']),
      bookingTime: DateTime.parse(json['bookingTime']),
      comment: json['comment'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'status': status,
      'services': services,
      'products': products?.map((product) => product.toJson()).toList(),
      'vehicleId': vehicleId,
      'clientId': clientId,
      'providerId': providerId,
      'price': price.toJson(),
      'bookingTime': bookingTime.toIso8601String(),
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class Product {
  final String productId;
  final int quantity;

  Product({required this.productId, required this.quantity});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}

class Price {
  final double originalPrice;
  final double finalPrice;

  Price({required this.originalPrice, required this.finalPrice});

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
