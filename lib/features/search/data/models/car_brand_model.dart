class CarBrandModel {
  final bool success;
  final Data data;

  CarBrandModel({
    required this.success,
    required this.data,
  });

  factory CarBrandModel.fromJson(Map<String, dynamic> json) {
    return CarBrandModel(
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
  final List<Brand> brands;
  final CarBrandOptions options;
  final int count;

  Data({
    required this.brands,
    required this.options,
    required this.count,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      brands: List<Brand>.from(json['brands'].map((x) => Brand.fromJson(x))),
      options: CarBrandOptions.fromJson(json['options']),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brands': brands.map((x) => x.toJson()).toList(),
      'options': options.toJson(),
      'count': count,
    };
  }
}

class Brand {
  final String id;
  final String name;
  final String nameAr;

  Brand({
    required this.id,
    required this.name,
    required this.nameAr,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
    };
  }
}

class CarBrandOptions {
  final int limit;
  final int skip;
  final Sort sort;
  final int page;

  CarBrandOptions({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
  });

  factory CarBrandOptions.fromJson(Map<String, dynamic> json) {
    return CarBrandOptions(
      limit: json['limit'],
      skip: json['skip'],
      sort: Sort.fromJson(json['sort']),
      page: json['page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort.toJson(),
      'page': page,
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
