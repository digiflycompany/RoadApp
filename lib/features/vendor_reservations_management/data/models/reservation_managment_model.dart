class BookingResponse {
  final bool? success;
  final BookingData? data;

  BookingResponse({
    this.success,
    this.data,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? BookingData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class BookingData {
  final List<Booking>? bookings;
  final BookingOptions? options;

  BookingData({
    this.bookings,
    this.options,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      bookings: json['bookings'] != null
          ? List<Booking>.from(json['bookings'].map((x) => Booking.fromJson(x)))
          : null,
      options: json['options'] != null ? BookingOptions.fromJson(json['options']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookings': bookings?.map((x) => x.toJson()).toList(),
      'options': options?.toJson(),
    };
  }
}

class Booking {
  final String? id;
  final String? status;
  final String? couponId;
  final List<Service>? services;
  final List<Product>? products;
  final Vehicle? vehicleId;
  final Client? clientId;
  final Provider? providerId;
  final Price? price;
  final DateTime? bookingTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? comment;

  Booking({
    this.id,
    this.status,
    this.couponId,
    this.services,
    this.products,
    this.vehicleId,
    this.clientId,
    this.providerId,
    this.price,
    this.bookingTime,
    this.createdAt,
    this.updatedAt,
    this.comment,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['_id'] as String?,
      status: json['status'] as String?,
      couponId: json['couponId'] as String?,
      services: json['services'] != null
          ? List<Service>.from(json['services'].map((x) => Service.fromJson(x)))
          : null,
      products: json['products'] != null
          ? List<Product>.from(json['products'].map((x) => Product.fromJson(x)))
          : null,
      vehicleId: json['vehicleId'] != null ? Vehicle.fromJson(json['vehicleId']) : null,
      clientId: json['clientId'] != null ? Client.fromJson(json['clientId']) : null,
      providerId: json['providerId'] != null ? Provider.fromJson(json['providerId']) : null,
      price: json['price'] != null ? Price.fromJson(json['price']) : null,
      bookingTime: json['bookingTime'] != null
          ? DateTime.parse(json['bookingTime'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      comment: json['comment'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'status': status,
      'couponId': couponId,
      'services': services?.map((x) => x.toJson()).toList(),
      'products': products?.map((x) => x.toJson()).toList(),
      'vehicleId': vehicleId?.toJson(),
      'clientId': clientId?.toJson(),
      'providerId': providerId?.toJson(),
      'price': price?.toJson(),
      'bookingTime': bookingTime?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'comment': comment,
    };
  }
}

class Service {
  final String? id;
  final String? name;

  Service({
    this.id,
    this.name,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['_id'] as String?,
      name: json['name'] as String?,
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
  final ProductId? productId;
  final int? quantity;

  Product({
    this.productId,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] != null
          ? ProductId.fromJson(json['productId'])
          : null,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId?.toJson(),
      'quantity': quantity,
    };
  }
}

class ProductId {
  final String? id;
  final String? name;

  ProductId({
    this.id,
    this.name,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) {
    return ProductId(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class Vehicle {
  final String? id;
  final BrandId? brandId;

  Vehicle({
    this.id,
    this.brandId,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['_id'] as String?,
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
  final String? id;
  final String? name;

  BrandId({
    this.id,
    this.name,
  });

  factory BrandId.fromJson(Map<String, dynamic> json) {
    return BrandId(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class Client {
  final String? id;
  final String? fullName;
  final String? phoneNumber;

  Client({
    this.id,
    this.fullName,
    this.phoneNumber,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
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

class Provider {
  final String? id;
  final String? name;

  Provider({
    this.id,
    this.name,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['_id'] as String?,
      name: json['name'] as String?,
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
  final int? originalPrice;
  final int? finalPrice;

  Price({
    this.originalPrice,
    this.finalPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      originalPrice: json['originalPrice'] as int?,
      finalPrice: json['finalPrice'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originalPrice': originalPrice,
      'finalPrice': finalPrice,
    };
  }
}

class BookingOptions {
  final int? limit;
  final int? skip;
  final Map<String, dynamic>? sort;
  final int? page;
  final int? count;

  BookingOptions({
    this.limit,
    this.skip,
    this.sort,
    this.page,
    this.count,
  });

  factory BookingOptions.fromJson(Map<String, dynamic> json) {
    return BookingOptions(
      limit: json['limit'] as int?,
      skip: json['skip'] as int?,
      sort: json['sort'] as Map<String, dynamic>?,
      page: json['page'] as int?,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort,
      'page': page,
      'count': count,
    };
  }
}
