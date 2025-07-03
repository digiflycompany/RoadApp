class ContactUsResponse {
  final bool success;
  final ContactUsData data;

  ContactUsResponse({
    required this.success,
    required this.data,
  });

  factory ContactUsResponse.fromJson(Map<String, dynamic> json) {
    return ContactUsResponse(
      success: json['success'],
      data: ContactUsData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class ContactUsData {
  final String name;
  final String phone;
  final String email;
  final String note;
  final String type;
  final String creatorId;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ContactUsData({
    required this.name,
    required this.phone,
    required this.email,
    required this.note,
    required this.type,
    required this.creatorId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ContactUsData.fromJson(Map<String, dynamic> json) {
    return ContactUsData(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      note: json['note'],
      type: json['type'],
      creatorId: json['creatorId'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'note': note,
      'type': type,
      'creatorId': creatorId,
      '_id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
