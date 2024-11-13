class ReservationsResponse {
  bool? success;
  ReservationsData? data;

  ReservationsResponse({this.success, this.data});

  factory ReservationsResponse.fromJson(Map<String, dynamic> json) {
    return ReservationsResponse(
      success: json['success'],
      data: json['data'] != null ? ReservationsData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class ReservationsData {
  List<Booking>? bookings;
  ReservationsOptions? options;

  ReservationsData({this.bookings, this.options});

  factory ReservationsData.fromJson(Map<String, dynamic> json) {
    return ReservationsData(
      bookings: json['bookings'] != null
          ? (json['bookings'] as List)
          .map((e) => Booking.fromJson(e))
          .toList()
          : null,
      options: json['options'] != null ? ReservationsOptions.fromJson(json['options']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookings': bookings?.map((e) => e.toJson()).toList(),
      'options': options?.toJson(),
    };
  }
}

class Booking {
  String? id;
  String? status;
  List<Service>? services;
  List<Product>? products;
  ClientId? clientId;
  ProviderId? providerId;
  Price? price;
  String? bookingTime;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? couponId;
  VehicleId? vehicleId;

  Booking({
    this.id,
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
    this.vehicleId,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['_id'],
      status: json['status'],
      services: json['services'] != null
          ? (json['services'] as List)
          .map((e) => Service.fromJson(e))
          .toList()
          : null,
      products: json['products'] != null
          ? (json['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList()
          : null,
      clientId: json['clientId'] != null ? ClientId.fromJson(json['clientId']) : null,
      providerId: json['providerId'] != null ? ProviderId.fromJson(json['providerId']) : null,
      price: json['price'] != null ? Price.fromJson(json['price']) : null,
      bookingTime: json['bookingTime'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      couponId: json['couponId'],
      vehicleId: json['vehicleId'] != null ? VehicleId.fromJson(json['vehicleId']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'status': status,
      'services': services?.map((e) => e.toJson()).toList(),
      'products': products?.map((e) => e.toJson()).toList(),
      'clientId': clientId?.toJson(),
      'providerId': providerId?.toJson(),
      'price': price?.toJson(),
      'bookingTime': bookingTime,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'couponId': couponId,
      'vehicleId': vehicleId?.toJson(),
    };
  }
}

class Service {
  String? id;
  String? name;

  Service({this.id, this.name});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class Product {
  ProductId? productId;
  int? quantity;
  String? id;

  Product({this.productId, this.quantity, this.id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] != null ? ProductId.fromJson(json['productId']) : null,
      quantity: json['quantity'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId?.toJson(),
      'quantity': quantity,
      '_id': id,
    };
  }
}

class ProductId {
  String? id;
  String? name;

  ProductId({this.id, this.name});

  factory ProductId.fromJson(Map<String, dynamic> json) {
    return ProductId(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class ClientId {
  String? id;
  String? fullName;
  String? phoneNumber;

  ClientId({this.id, this.fullName, this.phoneNumber});

  factory ClientId.fromJson(Map<String, dynamic> json) {
    return ClientId(
      id: json['_id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }
}

class ProviderId {
  String? id;
  String? name;

  ProviderId({this.id, this.name});

  factory ProviderId.fromJson(Map<String, dynamic> json) {
    return ProviderId(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class Price {
  int? originalPrice;
  int? finalPrice;

  Price({this.originalPrice, this.finalPrice});

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

class VehicleId {
  String? id;
  BrandId? brandId;

  VehicleId({this.id, this.brandId});

  factory VehicleId.fromJson(Map<String, dynamic> json) {
    return VehicleId(
      id: json['_id'],
      brandId: json['brandId'] != null ? BrandId.fromJson(json['brandId']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'brandId': brandId?.toJson(),
    };
  }
}

class BrandId {
  String? id;
  String? name;

  BrandId({this.id, this.name});

  factory BrandId.fromJson(Map<String, dynamic> json) {
    return BrandId(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
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
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort?.toJson(),
      'page': page,
      'count': count,
    };
  }
}

class Sort {
  String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
    };
  }
}