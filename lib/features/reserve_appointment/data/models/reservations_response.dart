class ReservationsResponse {
  bool? success;
  Data? data;

  ReservationsResponse({this.success, this.data});

  factory ReservationsResponse.fromJson(Map<String, dynamic> json) {
    return ReservationsResponse(
        success: json['success'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class Data {
  List<Booking>? bookings;
  ReservationsOptions? options;

  Data({this.bookings, this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        bookings: json['bookings'] != null
            ? (json['bookings'] as List)
                .map((e) => Booking.fromJson(e))
                .toList()
            : null,
        options:
            json['options'] != null ? ReservationsOptions.fromJson(json['options']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'bookings': bookings?.map((e) => e.toJson()).toList(),
      'options': options?.toJson()
    };
  }
}

class Booking {
  String? id;
  String? status;
  List<String>? services;
  List<Product>? products;
  String? clientId;
  String? providerId;
  Price? price;
  String? bookingTime;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? couponId;
  String? vehicleId;

  Booking(
      {this.id,
      this.status,
      this.services,
      this.products,
      this.clientId,
      this.providerId,
      this.price,
      this.bookingTime,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.couponId,
      this.vehicleId});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
        id: json['_id'],
        status: json['status'],
        services: json['services'] != null
            ? List<String>.from(json['services'])
            : null,
        products: json['products'] != null
            ? (json['products'] as List)
                .map((e) => Product.fromJson(e))
                .toList()
            : null,
        clientId: json['clientId'],
        providerId: json['providerId'],
        price: json['price'] != null ? Price.fromJson(json['price']) : null,
        bookingTime: json['bookingTime'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        v: json['__v'],
        couponId: json['couponId'],
        vehicleId: json['vehicleId']);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'status': status,
      'services': services,
      'products': products?.map((e) => e.toJson()).toList(),
      'clientId': clientId,
      'providerId': providerId,
      'price': price?.toJson(),
      'bookingTime': bookingTime,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'couponId': couponId,
      'vehicleId': vehicleId
    };
  }
}

class Product {
  String? productId;
  int? quantity;
  String? id;

  Product({this.productId, this.quantity, this.id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        productId: json['productId'],
        quantity: json['quantity'],
        id: json['_id']);
  }

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity, '_id': id};
  }
}

class Price {
  int? originalPrice;
  int? finalPrice;

  Price({this.originalPrice, this.finalPrice});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
        originalPrice: json['originalPrice'], finalPrice: json['finalPrice']);
  }

  Map<String, dynamic> toJson() {
    return {'originalPrice': originalPrice, 'finalPrice': finalPrice};
  }
}

class ReservationsOptions {
  int? limit;
  int? skip;
  Sort? sort;
  int? page;
  int? count;

  ReservationsOptions({this.limit, this.skip, this.sort, this.page, this.count});

  factory ReservationsOptions.fromJson(Map<String, dynamic> json) {
    return ReservationsOptions(
        limit: json['limit'],
        skip: json['skip'],
        sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
        page: json['page'],
        count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort?.toJson(),
      'page': page,
      'count': count
    };
  }
}

class Sort {
  String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() {
    return {'createdAt': createdAt};
  }
}