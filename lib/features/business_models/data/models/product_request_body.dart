class ProductRequestBody {
  final String? receiverId;
  final DateTime date;
  final List<ProductReq> products;
  final String notes;

  ProductRequestBody({
    this.receiverId,
    required this.date,
    required this.products,
    required this.notes,
  });

  /// إنشاء كائن من JSON
  factory ProductRequestBody.fromJson(Map<String, dynamic> json) {
    return ProductRequestBody(
      receiverId: json['receiverId'],
      date: DateTime.parse(json['date']),
      products: List<ProductReq>.from(
        json['products'].map((product) => ProductReq.fromJson(product)),
      ),
      notes: json['notes'],
    );
  }

  /// تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'date': date.toIso8601String(),
      'products': products.map((product) => product.toJson()).toList(),
      'notes': notes,
    };

    // إضافة receiverId فقط إذا لم تكن null
    if (receiverId != null) {
      data['receiverId'] = receiverId;
    }

    return data;
  }
}

class ProductReq {
  final String id;
  final double price;
  final int quantity;

  ProductReq({
    required this.id,
    required this.price,
    required this.quantity,
  });

  /// إنشاء كائن من JSON
  factory ProductReq.fromJson(Map<String, dynamic> json) {
    return ProductReq(
      id: json['_id'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
    );
  }

  /// تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'price': price,
      'quantity': quantity,
    };
  }
}
