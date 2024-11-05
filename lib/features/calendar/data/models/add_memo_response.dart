class AddMemoResponse {
  bool? success;
  Data? data;

  AddMemoResponse({this.success, this.data});

  factory AddMemoResponse.fromJson(Map<String, dynamic> json) {
    return AddMemoResponse(
        success: json['success'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class Data {
  String? userId;
  int? priority;
  String? date;
  String? type;
  String? description;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data(
      {this.userId,
      this.priority,
      this.date,
      this.type,
      this.description,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        userId: json['userId'],
        priority: json['priority'],
        date: json['date'],
        type: json['type'],
        description: json['description'],
        id: json['_id'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        v: json['__v']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'priority': priority,
      'date': date,
      'type': type,
      'description': description,
      '_id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v
    };
  }
}