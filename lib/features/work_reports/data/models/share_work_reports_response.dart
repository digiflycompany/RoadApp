
class ShareWorkReportsResponse {
  final bool success;
  final Data data;

  ShareWorkReportsResponse({required this.success, required this.data});

  factory ShareWorkReportsResponse.fromJson(Map<String, dynamic> json) {
    return ShareWorkReportsResponse(
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
  final String csv;
  final OptionsShareWorkReports options;

  Data({required this.csv, required this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      csv: json['csv'],
      options: OptionsShareWorkReports.fromJson(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'csv': csv,
      'options': options.toJson(),
    };
  }
}

class OptionsShareWorkReports {
  final int limit;
  final int skip;
  final Sort sort;
  final int page;
  final int count;

  OptionsShareWorkReports({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  factory OptionsShareWorkReports.fromJson(Map<String, dynamic> json) {
    return OptionsShareWorkReports(
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
