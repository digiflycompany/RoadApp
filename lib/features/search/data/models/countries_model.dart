class CountriesModel {
  final bool success;
  final Data data;

  CountriesModel({
    required this.success,
    required this.data,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
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
  final List<Country> countries;
  final CountriesOptions options;

  Data({
    required this.countries,
    required this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      countries: List<Country>.from(
          json['countries'].map((x) => Country.fromJson(x))),
      options: CountriesOptions.fromJson(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'countries': countries.map((x) => x.toJson()).toList(),
      'options': options.toJson(),
    };
  }
}

class Country {
  final String id;
  final String name;
  final String nameAr;
  final int version;

  Country({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.version,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
      '__v': version,
    };
  }
}

class CountriesOptions {
  final int limit;
  final int skip;
  final Sort sort;
  final int page;
  final int count;

  CountriesOptions({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  factory CountriesOptions.fromJson(Map<String, dynamic> json) {
    return CountriesOptions(
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
