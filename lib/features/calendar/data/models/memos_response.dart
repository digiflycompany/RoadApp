import 'package:intl/intl.dart';

class MemosResponse {
  bool? success;
  MemosData? data;

  MemosResponse({this.success, this.data});

  factory MemosResponse.fromJson(Map<String, dynamic> json) {
    return MemosResponse(
        success: json['success'] as bool?,
        data: json['data'] != null ? MemosData.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class MemosData {
  List<Diary>? diaries;
  DiaryOptions? options;

  MemosData({this.diaries, this.options});

  factory MemosData.fromJson(Map<String, dynamic> json) {
    return MemosData(
        diaries: (json['diaries'] as List<dynamic>?)
            ?.map((e) => Diary.fromJson(e as Map<String, dynamic>))
            .toList(),
        options: json['options'] != null
            ? DiaryOptions.fromJson(json['options'])
            : null);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (diaries != null) {
      data['diaries'] = diaries?.map((e) => e.toJson()).toList();
    }
    if (options != null) {
      data['options'] = options?.toJson();
    }
    return data;
  }
}

class Diary {
  String? id;
  String? userId;
  int? priority;
  DateTime? date;
  String? type;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Diary(
      {this.id,
      this.userId,
      this.priority,
      this.date,
      this.type,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory Diary.fromJson(Map<String, dynamic> json) {
    return Diary(
        id: json['_id'] as String?,
        userId: json['userId'] as String?,
        priority: json['priority'] as int?,
        date: json['date'] != null
            ? DateTime.parse(json['date'] as String)
            : null,
        type: json['type'] as String?,
        description: json['description'] as String?,
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'] as String)
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'] as String)
            : null,
        v: json['__v'] as int?);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['userId'] = userId;
    data['priority'] = priority;
    if (date != null) {
      data['date'] = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(date!);
    }
    data['type'] = type;
    data['description'] = description;
    if (createdAt != null) {
      data['createdAt'] =
          DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(createdAt!);
    }
    if (updatedAt != null) {
      data['updatedAt'] =
          DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(updatedAt!);
    }
    data['__v'] = v;
    return data;
  }
}

class DiaryOptions {
  int? limit;
  int? skip;
  Sort? sort;
  int? page;
  int? count;

  DiaryOptions({this.limit, this.skip, this.sort, this.page, this.count});

  factory DiaryOptions.fromJson(Map<String, dynamic> json) {
    return DiaryOptions(
        limit: json['limit'] as int?,
        skip: json['skip'] as int?,
        sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
        page: json['page'] as int?,
        count: json['count'] as int?);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['limit'] = limit;
    data['skip'] = skip;
    if (sort != null) {
      data['sort'] = sort?.toJson();
    }
    data['page'] = page;
    data['count'] = count;
    return data;
  }
}

class Sort {
  String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(createdAt: json['createdAt'] as String?);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    return data;
  }
}