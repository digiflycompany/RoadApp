class PrivacyPolicyResponse {
  final bool? success;
  final PrivacyPolicyData? data;

  PrivacyPolicyResponse({this.success, this.data});

  factory PrivacyPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyResponse(
      success: json['success'],
      data: json['data'] != null ? PrivacyPolicyData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class PrivacyPolicyData {
  final String? id;
  final String? identifier;
  final int? version;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PrivacyPolicyData({
    this.id,
    this.identifier,
    this.version,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory PrivacyPolicyData.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyData(
      id: json['_id'],
      identifier: json['identifier'],
      version: json['__v'],
      content: json['content'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'identifier': identifier,
      '__v': version,
      'content': content,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}