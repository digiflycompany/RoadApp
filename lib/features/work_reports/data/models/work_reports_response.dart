class WorkReportsResponse {
  final bool? success;
  final Data? data;

  WorkReportsResponse({this.success, this.data});

  factory WorkReportsResponse.fromJson(Map<String, dynamic> json) {
    return WorkReportsResponse(
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
  final List<DocumentWorkReports>? documents;
  final OptionsWorkReport? options;

  Data({this.documents, this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      documents: json['documents'] != null
          ? (json['documents'] as List)
          .map((item) => DocumentWorkReports.fromJson(item))
          .toList()
          : null,
      options: json['options'] != null ? OptionsWorkReport.fromJson(json['options']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documents': documents?.map((e) => e.toJson()).toList(),
      'options': options?.toJson(),
    };
  }
}

class DocumentWorkReports {
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
  final int? version;
  final String? type;

  DocumentWorkReports({
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
    this.version,
    this.type,
  });

  factory DocumentWorkReports.fromJson(Map<String, dynamic> json) {
    return DocumentWorkReports(
      id: json['_id'],
      creatorId: json['creatorId'],
      receiverId: json['receiverId'],
      date: json['date'],
      status: json['status'],
      products: json['products'] != null
          ? (json['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList()
          : null,
      totalPrice: json['totalPrice'],
      notes: json['notes'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'],
      type: json['type'],
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
      '__v': version,
      'type': type,
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

class OptionsWorkReport {
  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;
  final int? count;

  OptionsWorkReport({this.limit, this.skip, this.sort, this.page, this.count});

  factory OptionsWorkReport.fromJson(Map<String, dynamic> json) {
    return OptionsWorkReport(
      limit: json['limit'],
      skip: json['skip'],
      sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
      page: json['page'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort?.toJson(),
      'page': page,
      'count': count,
    };
  }
}

class Sort {
  final String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
    };
  }
}
