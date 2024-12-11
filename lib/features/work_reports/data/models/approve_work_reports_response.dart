class ApproveWorkReportsResponse {
  final bool? success;
  final Data? data;

  ApproveWorkReportsResponse({this.success, this.data});

  factory ApproveWorkReportsResponse.fromJson(Map<String, dynamic> json) {
    return ApproveWorkReportsResponse(
      success: json['success'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class Data {
  final String? id;
  final String? creatorId;
  final String? receiverId;
  final String? date;
  final String? status;
  final List<Product>? products;
  final int? totalPrice;
  final String? notes;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Data({
    this.id,
    this.creatorId,
    this.receiverId,
    this.date,
    this.status,
    this.products,
    this.totalPrice,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      creatorId: json['creatorId'],
      receiverId: json['receiverId'],
      date: json['date'],
      status: json['status'],
      products: json['products'] != null
          ? (json['products'] as List).map((e) => Product.fromJson(e)).toList()
          : null,
      totalPrice: json['totalPrice'],
      notes: json['notes'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'creatorId': creatorId,
      'receiverId': receiverId,
      'date': date,
      'status': status,
      'products': products?.map((e) => e.toJson()).toList(),
      'totalPrice': totalPrice,
      'notes': notes,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class Product {
  final String? id;
  final String? typeId;
  final String? name;
  final String? nameAr;
  final int? price;
  final int? quantity;

  Product({
    this.id,
    this.typeId,
    this.name,
    this.nameAr,
    this.price,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      typeId: json['typeId'],
      name: json['name'],
      nameAr: json['nameAr'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'typeId': typeId,
      'name': name,
      'nameAr': nameAr,
      'price': price,
      'quantity': quantity,
    };
  }
}
