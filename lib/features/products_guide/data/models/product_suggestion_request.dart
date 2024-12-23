class ProductSuggestionRequest {
  final String name;
  final String nameAr;

  ProductSuggestionRequest({required this.name, required this.nameAr});

  factory ProductSuggestionRequest.fromJson(Map<String, dynamic> json) {
    return ProductSuggestionRequest(
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
