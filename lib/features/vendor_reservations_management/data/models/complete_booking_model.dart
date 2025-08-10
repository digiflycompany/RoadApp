class CompleteBookingResponse {
  CompleteBookingResponse({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory CompleteBookingResponse.fromJson(Map<String, dynamic> json){
    return CompleteBookingResponse(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.status,
    required this.services,
    required this.products,
    required this.vehicleId,
    required this.clientId,
    required this.providerId,
    required this.providerName,
    required this.price,
    required this.bookingTime,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.reportId,
  });

  final String? id;
  final String? status;
  final List<dynamic> services;
  final List<Product> products;
  final String? vehicleId;
  final String? clientId;
  final String? providerId;
  final String? providerName;
  final Price? price;
  final DateTime? bookingTime;
  final String? comment;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? reportId;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      status: json["status"],
      services: json["services"] == null ? [] : List<dynamic>.from(json["services"]!.map((x) => x)),
      products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
      vehicleId: json["vehicleId"],
      clientId: json["clientId"],
      providerId: json["providerId"],
      providerName: json["providerName"],
      price: json["price"] == null ? null : Price.fromJson(json["price"]),
      bookingTime: DateTime.tryParse(json["bookingTime"] ?? ""),
      comment: json["comment"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      reportId: json["reportId"],
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
