class ChartResponse {
  final bool success;
  final List<ChartData> data;

  ChartResponse({required this.success, required this.data});

  factory ChartResponse.fromJson(Map<String, dynamic> json) {
    return ChartResponse(
      success: json['success'],
      data: (json['data'] as List).map((e) => ChartData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class ChartData {
  final dynamic label;
  final dynamic liters;
  final dynamic km;

  ChartData({required this.label, required this.liters, required this.km});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      label: json['label'],
      liters: json['price'],
      km: json['km'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'liters': liters,
      'km': km,
    };
  }
}