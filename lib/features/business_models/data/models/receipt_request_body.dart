import 'package:roadapp/features/business_models/data/models/product_request_body.dart';

class ReceiptRequestBody {
  final DateTime date;
  final List<ProductReq> productTypes;
  final String notes;

  ReceiptRequestBody({
    required this.date,
    required this.productTypes,
    required this.notes,
  });

  factory ReceiptRequestBody.fromJson(Map<String, dynamic> json) {
    return ReceiptRequestBody(
      date: DateTime.parse(json['date']),
      productTypes: List<ProductReq>.from(
        json['productTypes'].map((product) => ProductReq.fromJson(product)),
      ),
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'productTypes': productTypes.map((product) => product.toJson()).toList(),
      'notes': notes,
    };
  }
}

