class ShareGeneralStockResponse {
  final bool success;
  final Data data;

  ShareGeneralStockResponse({
    required this.success,
    required this.data,
  });

  factory ShareGeneralStockResponse.fromJson(Map<String, dynamic> json) {
    return ShareGeneralStockResponse(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String csv;
  final OptionsShareGeneralStock options;

  Data({
    required this.csv,
    required this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      csv: json['csv'],
      options: OptionsShareGeneralStock.fromJson(json['options']),
    );
  }
}

class OptionsShareGeneralStock {
  final int limit;
  final int skip;
  final Sort sort;
  final int page;
  final int count;

  OptionsShareGeneralStock({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  factory OptionsShareGeneralStock.fromJson(Map<String, dynamic> json) {
    return OptionsShareGeneralStock(
      limit: json['limit'],
      skip: json['skip'],
      sort: Sort.fromJson(json['sort']),
      page: json['page'],
      count: json['count'],
    );
  }
}

class Sort {
  final String createdAt;

  Sort({
    required this.createdAt,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'],
    );
  }
}
