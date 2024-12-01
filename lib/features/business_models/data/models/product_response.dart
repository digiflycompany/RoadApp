class ProductAddResponse {
  final bool? success;
  final Data? data;

  ProductAddResponse({
    this.success,
    this.data,
  });

  factory ProductAddResponse.fromJson(Map<String, dynamic> json) {
    return ProductAddResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (success != null) data['success'] = success;
    if (this.data != null) data['data'] = this.data!.toJson();
    return data;
  }
}

class Data {
  final String? creatorId;
  final String? receiverId;
  final DateTime? date;
  final String? type;
  final String? status;
  final List<ProductAdd>? products;
  final double? totalPrice;
  final String? notes;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;

  Data({
    this.creatorId,
    this.receiverId,
    this.date,
    this.type,
    this.status,
    this.products,
    this.totalPrice,
    this.notes,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      creatorId: json['creatorId'] as String?,
      receiverId: json['receiverId'] as String?,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      type: json['type'] as String?,
      status: json['status'] as String?,
      products: json['products'] != null
          ? List<ProductAdd>.from(
          json['products'].map((product) => ProductAdd.fromJson(product)))
          : null,
      totalPrice: json['totalPrice'] != null ? json['totalPrice'].toDouble() : null,
      notes: json['notes'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      version: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (creatorId != null) data['creatorId'] = creatorId;
    if (receiverId != null) data['receiverId'] = receiverId;
    if (date != null) data['date'] = date!.toIso8601String();
    if (type != null) data['type'] = type;
    if (status != null) data['status'] = status;
    if (products != null) {
      data['products'] = products!.map((product) => product.toJson()).toList();
    }
    if (totalPrice != null) data['totalPrice'] = totalPrice;
    if (notes != null) data['notes'] = notes;
    if (id != null) data['_id'] = id;
    if (createdAt != null) data['createdAt'] = createdAt!.toIso8601String();
    if (updatedAt != null) data['updatedAt'] = updatedAt!.toIso8601String();
    if (version != null) data['__v'] = version;
    return data;
  }
}

class ProductAdd {
  final String? id;
  final String? typeId;
  final String? name;
  final String? nameAr;
  final double? price;
  final int? quantity;

  ProductAdd({
    this.id,
    this.typeId,
    this.name,
    this.nameAr,
    this.price,
    this.quantity,
  });

  factory ProductAdd.fromJson(Map<String, dynamic> json) {
    return ProductAdd(
      id: json['_id'] as String?,
      typeId: json['typeId'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      price: json['price'] != null ? json['price'].toDouble() : null,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) data['_id'] = id;
    if (typeId != null) data['typeId'] = typeId;
    if (name != null) data['name'] = name;
    if (nameAr != null) data['nameAr'] = nameAr;
    if (price != null) data['price'] = price;
    if (quantity != null) data['quantity'] = quantity;
    return data;
  }
}
