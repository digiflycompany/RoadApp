class ProductTypesResponse {
  ProductTypesResponse({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory ProductTypesResponse.fromJson(Map<String, dynamic> json){
    return ProductTypesResponse(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.productTypes,
    required this.options,
  });

  final List<ProductType> productTypes;
  final ProductTypesOptions? options;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      productTypes: json["productTypes"] == null ? [] : List<ProductType>.from(json["productTypes"]!.map((x) => ProductType.fromJson(x))),
      options: json["options"] == null ? null : ProductTypesOptions.fromJson(json["options"]),
    );
  }

}

class ProductType {
  ProductType({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.status,
    required this.creatorId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? name;
  final String? nameAr;
  final String? status;
  final String? creatorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory ProductType.fromJson(Map<String, dynamic> json){
    return ProductType(
      id: json["_id"],
      name: json["name"],
      nameAr: json["nameAr"],
      status: json["status"],
      creatorId: json["creatorId"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class ProductTypesOptions {
  ProductTypesOptions({
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

  factory ProductTypesOptions.fromJson(Map<String, dynamic> json){
    return ProductTypesOptions(
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