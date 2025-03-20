class DeclinedReservationClientResponse {
  final bool success;
  final ReservationData data;

  DeclinedReservationClientResponse({
    required this.success,
    required this.data,
  });

  factory DeclinedReservationClientResponse.fromJson(Map<String, dynamic> json) =>
      DeclinedReservationClientResponse(
        success: json["success"],
        data: ReservationData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class ReservationData {
  final String id;
  final String status;
  final List<String> services;
  final List<Product> products;
  final String vehicleId;
  final String clientId;
  final String providerId;
  final Price price;
  final DateTime bookingTime;
  final String comment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ReservationData({
    required this.id,
    required this.status,
    required this.services,
    required this.products,
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

  factory ReservationData.fromJson(Map<String, dynamic> json) => ReservationData(
    id: json["_id"],
    status: json["status"],
    services: List<String>.from(json["services"].map((x) => x)),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    vehicleId: json["vehicleId"],
    clientId: json["clientId"],
    providerId: json["providerId"],
    price: Price.fromJson(json["price"]),
    bookingTime: DateTime.parse(json["bookingTime"]),
    comment: json["comment"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "status": status,
    "services": List<dynamic>.from(services.map((x) => x)),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "vehicleId": vehicleId,
    "clientId": clientId,
    "providerId": providerId,
    "price": price.toJson(),
    "bookingTime": bookingTime.toIso8601String(),
    "comment": comment,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Product {
  final String productId;
  final int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "quantity": quantity,
  };
}

class Price {
  final int originalPrice;
  final int finalPrice;

  Price({
    required this.originalPrice,
    required this.finalPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    originalPrice: json["originalPrice"],
    finalPrice: json["finalPrice"],
  );

  Map<String, dynamic> toJson() => {
    "originalPrice": originalPrice,
    "finalPrice": finalPrice,
  };
}
