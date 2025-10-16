import 'package:roadapp/features/business_models/data/models/product_request_body.dart';


class ReceiptRequestBody {
  final DateTime date;
  final List<ProductReq> productTypes;
  final String notes;
  final String client;
  final String? receiverId; // ✅ optional (for future-proofing)

  ReceiptRequestBody({
    required this.date,
    required this.productTypes,
    required this.notes,
    required this.client,
    this.receiverId,
  });

  // ✅ Factory constructor for creating from JSON
  factory ReceiptRequestBody.fromJson(Map<String, dynamic> json) {
    return ReceiptRequestBody(
      date: DateTime.parse(json['date']),
      productTypes: List<ProductReq>.from(
        json['productTypes'].map((product) => ProductReq.fromJson(product)),
      ),
      notes: json['notes'],
      client: json['client'],
      receiverId: json['receiverId'], // Optional — ignored by backend currently
    );
  }

  // ✅ Safe toJson with conditional receiverId exclusion
  Map<String, dynamic> toJson() {
    final data = {
      'date': date.toIso8601String(),
      'productTypes': productTypes.map((product) => product.toJson()).toList(),
      'notes': notes,
      'client': client,
    };

    // ✅ Only include receiverId if not null or empty (future-proof)
    if (receiverId != null && receiverId!.isNotEmpty) {
      data['receiverId'] = receiverId!;
    }

    return data;
  }

  @override
  String toString() {
    return '''
ReceiptRequestBody(
  date: $date,
  productTypes: $productTypes,
  notes: $notes,
  client: $client,
  receiverId: $receiverId
)
''';
  }
}

//
// class ReceiptRequestBody {
//   final DateTime date;
//   final List<ProductReq> productTypes;
//   final String notes;
//
//   ReceiptRequestBody({
//     required this.date,
//     required this.productTypes,
//     required this.notes,
//   });
//
//   factory ReceiptRequestBody.fromJson(Map<String, dynamic> json) {
//     return ReceiptRequestBody(
//       date: DateTime.parse(json['date']),
//       productTypes: List<ProductReq>.from(
//         json['productTypes'].map((product) => ProductReq.fromJson(product)),
//       ),
//       notes: json['notes'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'date': date.toIso8601String(),
//       'productTypes': productTypes.map((product) => product.toJson()).toList(),
//       'notes': notes,
//     };
//   }
// }
//
