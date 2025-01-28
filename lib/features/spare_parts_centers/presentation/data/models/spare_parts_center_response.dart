class SparePartsCenterResponse {
  final bool success;
  final Data? data;

  SparePartsCenterResponse({
    required this.success,
    this.data,
  });

  factory SparePartsCenterResponse.fromJson(Map<String, dynamic> json) {
    return SparePartsCenterResponse(
      success: json['success'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class Data {
  final List<Product>? products;
  final OptionsSparePartsCenter? options;

  Data({
    this.products,
    this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      products: json['products'] != null
          ? (json['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList()
          : null,
      options: json['options'] != null
          ? OptionsSparePartsCenter.fromJson(json['options'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((item) => item.toJson()).toList(),
      'options': options?.toJson(),
    };
  }
}

class Product {
  final String id;
  final String? name;
  final String? nameAr;
  final int? availableQuantity;
  final Price? price;
  final String? currency;
  final List<dynamic>? images;
  final List<dynamic>? tags;
  final MaintenanceCenter? maintenanceCenterId;
  final String? typeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Product({
    required this.id,
    this.name,
    this.nameAr,
    this.availableQuantity,
    this.price,
    this.currency,
    this.images,
    this.tags,
    this.maintenanceCenterId,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
      availableQuantity: json['availableQuantity'],
      price: json['price'] != null ? Price.fromJson(json['price']) : null,
      currency: json['currency'],
      images: json['images'] as List<dynamic>?,
      tags: json['tags'] as List<dynamic>?,
      maintenanceCenterId: json['maintenanceCenterId'] != null
          ? MaintenanceCenter.fromJson(json['maintenanceCenterId'])
          : null,
      typeId: json['typeId'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
      'availableQuantity': availableQuantity,
      'price': price?.toJson(),
      'currency': currency,
      'images': images,
      'tags': tags,
      'maintenanceCenterId': maintenanceCenterId?.toJson(),
      'typeId': typeId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
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

class MaintenanceCenter {
  final String? id;
  final String? landline;
  final String? name;
  final Country? country;
  final Address? address;
  final int? reviewsCount;
  final AverageReviews? averageReviews;
  final String? image;


  MaintenanceCenter({
    this.id,
    this.landline,
    this.name,
    this.country,
    this.address,
    this.reviewsCount,
    this.averageReviews,
    this.image,
  });

  factory MaintenanceCenter.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenter(
      id: json['_id'],
      landline: json['landline'],
      name: json['name'],
      country: json['country'] != null ? Country.fromJson(json['country']) : null,
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      reviewsCount: json['reviewsCount'],
      averageReviews: json['averageReviews'] != null
          ? AverageReviews.fromJson(json['averageReviews'])
          : null,
      image: json['picture'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'landline': landline,
      'name': name,
      'country': country?.toJson(),
      'address': address?.toJson(),
      'reviewsCount': reviewsCount,
      'averageReviews': averageReviews?.toJson(),
      'picture': image,

    };
  }
}

class Country {
  final String? id;
  final String? name;

  Country({
    this.id,
    this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
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

class Address {
  final String? city;
  final String? firstLine;

  Address({
    this.city,
    this.firstLine,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      firstLine: json['firstLine'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'firstLine': firstLine,
    };
  }
}

class AverageReviews {
  final int? employeesBehavior;
  final int? speed;
  final int? honesty;
  final int? fairCost;
  final int? efficiency;

  AverageReviews({
    this.employeesBehavior,
    this.speed,
    this.honesty,
    this.fairCost,
    this.efficiency,
  });

  factory AverageReviews.fromJson(Map<String, dynamic> json) {
    return AverageReviews(
      employeesBehavior: json['employeesBehavior'],
      speed: json['speed'],
      honesty: json['honesty'],
      fairCost: json['fairCost'],
      efficiency: json['efficiency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employeesBehavior': employeesBehavior,
      'speed': speed,
      'honesty': honesty,
      'fairCost': fairCost,
      'efficiency': efficiency,
    };
  }
}

class OptionsSparePartsCenter {
  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;
  final int? count;

  OptionsSparePartsCenter({
    this.limit,
    this.skip,
    this.sort,
    this.page,
    this.count,
  });

  factory OptionsSparePartsCenter.fromJson(Map<String, dynamic> json) {
    return OptionsSparePartsCenter(
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
  final String? createdAt;

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
