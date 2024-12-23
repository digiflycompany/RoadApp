class GetAllProductResponse {
  GetAllProductResponse({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory GetAllProductResponse.fromJson(Map<String, dynamic> json){
    return GetAllProductResponse(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.products,
    required this.options,
  });

  final List<GetAllProduct> products;
  final GetAllProductsOptions? options;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      products: json["products"] == null ? [] : List<GetAllProduct>.from(json["products"]!.map((x) => GetAllProduct.fromJson(x))),
      options: json["options"] == null ? null : GetAllProductsOptions.fromJson(json["options"]),
    );
  }

}

class GetAllProduct {
  GetAllProduct({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.availableQuantity,
    required this.price,
    required this.currency,
    required this.images,
    required this.tags,
    required this.maintenanceCenterId,
    required this.typeId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? name;
  final String? nameAr;
  final int? availableQuantity;
  final Price? price;
  final String? currency;
  final List<dynamic> images;
  final List<dynamic> tags;
  final MaintenanceCenterId? maintenanceCenterId;
  final String? typeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory GetAllProduct.fromJson(Map<String, dynamic> json){
    return GetAllProduct(
      id: json["_id"],
      name: json["name"],
      nameAr: json["nameAr"],
      availableQuantity: json["availableQuantity"],
      price: json["price"] == null ? null : Price.fromJson(json["price"]),
      currency: json["currency"],
      images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
      tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
      maintenanceCenterId: json["maintenanceCenterId"] == null ? null : MaintenanceCenterId.fromJson(json["maintenanceCenterId"]),
      typeId: json["typeId"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class MaintenanceCenterId {
  MaintenanceCenterId({
    required this.id,
    required this.landline,
    required this.name,
    required this.country,
    required this.address,
    required this.reviewsCount,
    required this.averageReviews,
  });

  final String? id;
  final String? landline;
  final String? name;
  final Country? country;
  final Address? address;
  final int? reviewsCount;
  final AverageReviews? averageReviews;

  factory MaintenanceCenterId.fromJson(Map<String, dynamic> json){
    return MaintenanceCenterId(
      id: json["_id"],
      landline: json["landline"],
      name: json["name"],
      country: json["country"] == null ? null : Country.fromJson(json["country"]),
      address: json["address"] == null ? null : Address.fromJson(json["address"]),
      reviewsCount: json["reviewsCount"],
      averageReviews: json["averageReviews"] == null ? null : AverageReviews.fromJson(json["averageReviews"]),
    );
  }

}

class Address {
  Address({
    required this.city,
    required this.firstLine,
  });

  final String? city;
  final String? firstLine;

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      city: json["city"],
      firstLine: json["firstLine"],
    );
  }

}

class AverageReviews {
  AverageReviews({
    required this.employeesBehavior,
    required this.speed,
    required this.honesty,
    required this.fairCost,
    required this.efficiency,
  });

  final int? employeesBehavior;
  final int? speed;
  final int? honesty;
  final int? fairCost;
  final int? efficiency;

  factory AverageReviews.fromJson(Map<String, dynamic> json){
    return AverageReviews(
      employeesBehavior: json["employeesBehavior"],
      speed: json["speed"],
      honesty: json["honesty"],
      fairCost: json["fairCost"],
      efficiency: json["efficiency"],
    );
  }

}

class Country {
  Country({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      id: json["_id"],
      name: json["name"],
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

class GetAllProductsOptions {
  GetAllProductsOptions({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;
  final int? count;

  factory GetAllProductsOptions.fromJson(Map<String, dynamic> json){
    return GetAllProductsOptions(
      limit: json["limit"],
      skip: json["skip"],
      sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
      page: json["page"],
      count: json["count"],
    );
  }

}

class Sort {
  Sort({
    required this.createdAt,
  });

  final String? createdAt;

  factory Sort.fromJson(Map<String, dynamic> json){
    return Sort(
      createdAt: json["createdAt"],
    );
  }

}