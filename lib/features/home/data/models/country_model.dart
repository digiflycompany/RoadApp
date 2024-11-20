class CountryModel {
  bool? success;
  CountryData? data;

  CountryModel({this.success, this.data});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
        success: json['success'] as bool?,
        data: json['data'] != null
            ? CountryData.fromJson(json['data'] as Map<String, dynamic>)
            : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class CountryData {
  String? id;
  String? name;
  String? nameAr;
  int? v;
  String? flag;

  CountryData({this.id, this.name, this.nameAr, this.v, this.flag});

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        nameAr: json['nameAr'] as String?,
        v: json['__v'] as int?,
        flag: json['flag'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'nameAr': nameAr, '__v': v, 'flag': flag};
  }
}