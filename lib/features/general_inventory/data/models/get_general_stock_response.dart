class GetGeneralStockResponse {
  GetGeneralStockResponse({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory GetGeneralStockResponse.fromJson(Map<String, dynamic> json) {
    return GetGeneralStockResponse(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.records,
    required this.options,
  });

  final List<InventoryRecord> records;
  final InventoryOptions? options;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      records: json["records"] == null
          ? []
          : List<InventoryRecord>.from(
              json["records"]!.map((x) => InventoryRecord.fromJson(x))),
      options: json["options"] == null
          ? null
          : InventoryOptions.fromJson(json["options"]),
    );
  }
}

class InventoryRecord {
  InventoryRecord({
    required this.id,
    required this.maintenanceCenterId,
    required this.supplierId,
    required this.productId,
    required this.documentId,
    required this.quantityBefore,
    required this.quantityAfter,
    required this.change,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? maintenanceCenterId;
  final SupplierId? supplierId;
  final ProductId? productId;
  final String? documentId;
  final int? quantityBefore;
  final int? quantityAfter;
  final int? change;
  final DateTime? date;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory InventoryRecord.fromJson(Map<String, dynamic> json) {
    return InventoryRecord(
      id: json["_id"],
      maintenanceCenterId: json["maintenanceCenterId"],
      supplierId: json["supplierId"] == null
          ? null
          : SupplierId.fromJson(json["supplierId"]),
      productId: json["productId"] == null
          ? null
          : ProductId.fromJson(json["productId"]),
      documentId: json["documentId"],
      quantityBefore: json["quantityBefore"],
      quantityAfter: json["quantityAfter"],
      change: json["change"],
      date: DateTime.tryParse(json["date"] ?? ""),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class ProductId {
  ProductId({
    required this.id,
    required this.name,
    required this.nameAr,
  });

  final String? id;
  final String? name;
  final String? nameAr;

  factory ProductId.fromJson(Map<String, dynamic> json) {
    return ProductId(
      id: json["_id"],
      name: json["name"],
      nameAr: json["nameAr"],
    );
  }
}

class SupplierId {
  SupplierId({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory SupplierId.fromJson(Map<String, dynamic> json) {
    return SupplierId(
      id: json["_id"],
      name: json["name"],
    );
  }
}

class InventoryOptions {
  InventoryOptions({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;
  final int? count;

  factory InventoryOptions.fromJson(Map<String, dynamic> json) {
    return InventoryOptions(
      limit: json["limit"],
      skip: json["skip"],
      sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
      page: json["page"],
      count: json["count"],
    );
  }
}

class Sort {
  Sort({
    required this.createdAt,
  });

  final String? createdAt;

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json["createdAt"],
    );
  }
}
