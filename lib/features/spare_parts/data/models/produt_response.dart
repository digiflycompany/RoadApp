class ProductResponse {
  final bool success;
  final Data data;

  ProductResponse({
    required this.success,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
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
  final List<ProductType> productTypes;
  final OptionsProduct options;

  Data({
    required this.productTypes,
    required this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      productTypes: (json['productTypes'] as List)
          .map((item) => ProductType.fromJson(item))
          .toList(),
      options: OptionsProduct.fromJson(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productTypes': productTypes.map((item) => item.toJson()).toList(),
      'options': options.toJson(),
    };
  }
}

class ProductType {
  final String id;
  final String name;
  final String nameAr;
  final String status;
  final String creatorId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

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

  factory ProductType.fromJson(Map<String, dynamic> json) {
    return ProductType(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
      status: json['status'],
      creatorId: json['creatorId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
      'status': status,
      'creatorId': creatorId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class OptionsProduct {
  final int limit;
  final int skip;
  final Sort sort;
  final int page;
  final int count;

  OptionsProduct({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  factory OptionsProduct.fromJson(Map<String, dynamic> json) {
    return OptionsProduct(
      limit: json['limit'],
      skip: json['skip'],
      sort: Sort.fromJson(json['sort']),
      page: json['page'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort.toJson(),
      'page': page,
      'count': count,
    };
  }
}

class Sort {
  final String createdAt;

  Sort({required this.createdAt});

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
