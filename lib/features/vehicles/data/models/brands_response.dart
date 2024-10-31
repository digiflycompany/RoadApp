class BrandsResponse {
  bool? success;
  BrandsData? data;

  BrandsResponse({this.success, this.data});

  factory BrandsResponse.fromJson(Map<String, dynamic> json) {
    return BrandsResponse(
        success: json['success'] as bool?,
        data: json['data'] != null ? BrandsData.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class BrandsData {
  List<Brand>? brands;
  BrandOption? options;
  int? count;

  BrandsData({this.brands, this.options, this.count});

  factory BrandsData.fromJson(Map<String, dynamic> json) {
    return BrandsData(
        brands: (json['brands'] as List<dynamic>?)
            ?.map((e) => Brand.fromJson(e as Map<String, dynamic>))
            .toList(),
        options:
            json['options'] != null ? BrandOption.fromJson(json['options']) : null,
        count: json['count'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {
      'brands': brands?.map((e) => e.toJson()).toList(),
      'options': options?.toJson(),
      'count': count
    };
  }
}

class Brand {
  String? id;
  String? name;
  String? nameAr;

  Brand({this.id, this.name, this.nameAr});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        nameAr: json['nameAr'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'nameAr': nameAr};
  }
}

class BrandOption {
  int? limit;
  int? skip;
  Sort? sort;
  int? page;

  BrandOption({this.limit, this.skip, this.sort, this.page});

  factory BrandOption.fromJson(Map<String, dynamic> json) {
    return BrandOption(
        limit: json['limit'] as int?,
        skip: json['skip'] as int?,
        sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
        page: json['page'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {'limit': limit, 'skip': skip, 'sort': sort?.toJson(), 'page': page};
  }
}

class Sort {
  String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(createdAt: json['createdAt'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'createdAt': createdAt};
  }
}