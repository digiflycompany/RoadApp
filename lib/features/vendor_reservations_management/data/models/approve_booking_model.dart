class ApproveBookingResponse {
  ApproveBookingResponse({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory ApproveBookingResponse.fromJson(Map<String, dynamic> json){
    return ApproveBookingResponse(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.status,
    required this.couponId,
    required this.services,
    required this.products,
    required this.vehicleId,
    required this.clientId,
    required this.providerId,
    required this.price,
    required this.bookingTime,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? status;
  final String? couponId;
  final List<String> services;
  final List<Product> products;
  final String? vehicleId;
  final String? clientId;
  final String? providerId;
  final Price? price;
  final DateTime? bookingTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      status: json["status"],
      couponId: json["couponId"],
      services: json["services"] == null ? [] : List<String>.from(json["services"]!.map((x) => x)),
      products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
      vehicleId: json["vehicleId"],
      clientId: json["clientId"],
      providerId: json["providerId"],
      price: json["price"] == null ? null : Price.fromJson(json["price"]),
      bookingTime: DateTime.tryParse(json["bookingTime"] ?? ""),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class Price {
  Price({
    required this.originalPrice,
    required this.finalPrice,
  });

  final int? originalPrice;
  final int? finalPrice;

  factory Price.fromJson(Map<String, dynamic> json){
    return Price(
      originalPrice: json["originalPrice"],
      finalPrice: json["finalPrice"],
    );
  }

}

class Product {
  Product({
    required this.productId,
    required this.quantity,
  });

  final String? productId;
  final int? quantity;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      productId: json["productId"],
      quantity: json["quantity"],
    );
  }

}
