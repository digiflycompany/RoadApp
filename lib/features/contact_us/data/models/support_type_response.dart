class SupportTypeResponse {
  final bool success;
  final SupportTypeData data;

  SupportTypeResponse({
    required this.success,
    required this.data,
  });

  factory SupportTypeResponse.fromJson(Map<String, dynamic> json) {
    return SupportTypeResponse(
      success: json['success'] ?? false,
      data: SupportTypeData.fromJson(json['data'] ?? {}),
    );
  }
}

class SupportTypeData {
  final String id;
  final List<String> content;

  SupportTypeData({
    required this.id,
    required this.content,
  });

  factory SupportTypeData.fromJson(Map<String, dynamic> json) {
    return SupportTypeData(
      id: json['_id']?.toString() ?? '',
      content: List<String>.from(json['content'] ?? []),
    );
  }
}
