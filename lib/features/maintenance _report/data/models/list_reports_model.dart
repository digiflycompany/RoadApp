
class ListReportsModel {
  final bool success;
  final Data data;

  ListReportsModel({required this.success, required this.data});

  factory ListReportsModel.fromJson(Map<String, dynamic> json) {
    return ListReportsModel(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<Report> reports;
  final Options options;

  Data({required this.reports, required this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      reports: List<Report>.from(json['reports'].map((x) => Report.fromJson(x))),
      options: Options.fromJson(json['options']),
    );
  }
}

class Report {
  final String id;
  final String? maintenanceCenterId;
  final String userId;
  final String vehicleId;
  final List<Service> services;
  final List<Product> products;
  final DateTime date;
  final int price;
  final bool verified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  Report({
    required this.id,
    this.maintenanceCenterId,
    required this.userId,
    required this.vehicleId,
    required this.services,
    required this.products,
    required this.date,
    required this.price,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['_id'],
      maintenanceCenterId: json['maintenanceCenterId'],
      userId: json['userId'],
      vehicleId: json['vehicleId'],
      services: List<Service>.from(json['services'].map((x) => Service.fromJson(x))),
      products: List<Product>.from(json['products'].map((x) => Product.fromJson(x))),
      date: DateTime.parse(json['date']),
      price: json['price'],
      verified: json['verified'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }
}

class Service {
  final String name;
  final String? nameAr;
  final int price;
  final int quantity;

  Service({
    required this.name,
    this.nameAr,
    required this.price,
    required this.quantity,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      name: json['name'],
      nameAr: json['nameAr'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}

class Product {
  final String name;
  final String? nameAr;
  final int price;
  final int quantity;

  Product({
    required this.name,
    this.nameAr,
    required this.price,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      nameAr: json['nameAr'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}

class Options {
  final int limit;
  final int skip;
  final Sort sort;
  final int page;
  final int count;

  Options({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
    required this.count,
  });

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      limit: json['limit'],
      skip: json['skip'],
      sort: Sort.fromJson(json['sort']),
      page: json['page'],
      count: json['count'],
    );
  }
}

class Sort {
  final String createdAt;

  Sort({required this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'],
    );
  }
}

// // مثال استخدام
// void main() {
//   // بافتراض أن `jsonString` هو النص JSON الذي زودتنا به
//   final jsonString = '{...}'; // ضَع JSON هنا
//   final Map<String, dynamic> jsonData = jsonDecode(jsonString);
//   final reportResponse = ReportResponse.fromJson(jsonData);
//
//   // لعرض بيانات أحد التقارير
//   print(reportResponse.data.reports[0].services[0].name);
// }
