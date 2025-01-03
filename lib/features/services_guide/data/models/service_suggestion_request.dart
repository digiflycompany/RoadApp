class ServiceSuggestionRequest {
  final String name;
  final String nameAr;

  ServiceSuggestionRequest({required this.name, required this.nameAr});

  factory ServiceSuggestionRequest.fromJson(Map<String, dynamic> json) {
    return ServiceSuggestionRequest(
      name: json['name'] as String,
      nameAr: json['nameAr'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nameAr': nameAr,
    };
  }
}
