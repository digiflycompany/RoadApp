class ReportResponse {
  final bool? success;
  final Data? data;

  ReportResponse({this.success, this.data});

  factory ReportResponse.fromJson(Map<String, dynamic> json) {
    return ReportResponse(
      success: json['success'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  final List<Report>? reports;
  final OptionsReports? options;

  Data({this.reports, this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      reports: json['reports'] != null
          ? (json['reports'] as List).map((report) => Report.fromJson(report)).toList()
          : null,
      options: json['options'] != null ? OptionsReports.fromJson(json['options']) : null,
    );
  }
}

class Report {
  final String? id;
  final MaintenanceCenter? maintenanceCenterId;
  final String? userId;
  final String? vehicleId;
  final List<Service>? services;
  final List<Product>? products;
  final DateTime? date;
  final double? price;
  final bool? verified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;

  Report({
    this.id,
    this.maintenanceCenterId,
    this.userId,
    this.vehicleId,
    this.services,
    this.products,
    this.date,
    this.price,
    this.verified,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['_id'],
      maintenanceCenterId: json['maintenanceCenterId'] != null
          ? MaintenanceCenter.fromJson(json['maintenanceCenterId'])
          : null,
      userId: json['userId'],
      vehicleId: json['vehicleId'],
      services: json['services'] != null
          ? (json['services'] as List).map((service) => Service.fromJson(service)).toList()
          : null,
      products: json['products'] != null
          ? (json['products'] as List).map((product) => Product.fromJson(product)).toList()
          : null,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      price: json['price'] != null ? json['price'].toDouble() : null,
      verified: json['verified'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      version: json['__v'],
    );
  }
}

class MaintenanceCenter {
  final String? id;
  final String? landline;
  final String? name;

  MaintenanceCenter({this.id, this.landline, this.name});

  factory MaintenanceCenter.fromJson(Map<String, dynamic> json) {
    return MaintenanceCenter(
      id: json['_id'],
      landline: json['landline'],
      name: json['name'],
    );
  }
}

class Service {
  final String? name;
  final String? nameAr;
  final double? price;
  final int? quantity;

  Service({
    this.name,
    this.nameAr,
    this.price,
    this.quantity,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      name: json['name'],
      nameAr: json['nameAr'],
      price: json['price'] != null ? json['price'].toDouble() : null,
      quantity: json['quantity'],
    );
  }
}

class Product {
  final String? name;
  final String? nameAr;
  final double? price;
  final int? quantity;

  Product({
    this.name,
    this.nameAr,
    this.price,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      nameAr: json['nameAr'],
      price: json['price'] != null ? json['price'].toDouble() : null,
      quantity: json['quantity'],
    );
  }
}

class OptionsReports {
  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;
  final int? count;

  OptionsReports({this.limit, this.skip, this.sort, this.page, this.count});

  factory OptionsReports.fromJson(Map<String, dynamic> json) {
    return OptionsReports(
      limit: json['limit'],
      skip: json['skip'],
      sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
      page: json['page'],
      count: json['count'],
    );
  }
}

class Sort {
  final String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(createdAt: json['createdAt']);
  }
}
