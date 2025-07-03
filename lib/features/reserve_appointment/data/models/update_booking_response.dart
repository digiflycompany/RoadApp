class UpdateBookingResponse {
  final bool success;
  final Data data;

  UpdateBookingResponse({required this.success, required this.data});

  factory UpdateBookingResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBookingResponse(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class Data {
  final String id;
  final String status;
  final List<String> services;
  final String vehicleId;
  final String clientId;
  final String providerId;
  final Price price;
  final DateTime bookingTime;
  final String comment;
  final List<dynamic> products;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Data({
    required this.id,
    required this.status,
    required this.services,
    required this.vehicleId,
    required this.clientId,
    required this.providerId,
    required this.price,
    required this.bookingTime,
    required this.comment,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      status: json['status'],
      services: List<String>.from(json['services']),
      vehicleId: json['vehicleId'],
      clientId: json['clientId'],
      providerId: json['providerId'],
      price: Price.fromJson(json['price']),
      bookingTime: DateTime.parse(json['bookingTime']),
      comment: json['comment'],
      products: List<dynamic>.from(json['products']),
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
      'vehicleId': vehicleId,
      'clientId': clientId,
      'providerId': providerId,
      'price': price.toJson(),
      'bookingTime': bookingTime.toIso8601String(),
      'comment': comment,
      'products': products,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class Price {
  final int originalPrice;
  final int finalPrice;

  Price({required this.originalPrice, required this.finalPrice});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      originalPrice: json['originalPrice'],
      finalPrice: json['finalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originalPrice': originalPrice,
      'finalPrice': finalPrice,
    };
  }
}
