class DeleteProductResponse {
  final bool success;
  final DeleteProductData data;

  DeleteProductResponse({required this.success, required this.data});

  factory DeleteProductResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProductResponse(
      success: json['success'],
      data: DeleteProductData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class DeleteProductData {
  final bool acknowledged;
  final int deletedCount;

  DeleteProductData({required this.acknowledged, required this.deletedCount});

  factory DeleteProductData.fromJson(Map<String, dynamic> json) {
    return DeleteProductData(
      acknowledged: json['acknowledged'],
      deletedCount: json['deletedCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'acknowledged': acknowledged,
      'deletedCount': deletedCount,
    };
  }
}
