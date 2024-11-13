class ReportRequest {
  final String? vehicleId;
  final String? date;
  final List<ServiceReport>? services;
  final List<ProductReport>? products;

  ReportRequest({
    this.vehicleId,
    this.date,
    this.services,
    this.products,
  });

  factory ReportRequest.fromJson(Map<String, dynamic> json) {
    return ReportRequest(
      vehicleId: json['vehicleId'] as String?,
      date: json['date'] as String?,
      services: (json['services'] as List?)
          ?.map((service) => ServiceReport.fromJson(service))
          .toList(),
      products: (json['products'] as List?)
          ?.map((product) => ProductReport.fromJson(product))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleId': vehicleId,
      'date': date,
      'services': services?.map((service) => service.toJson()).toList(),
      'products': products?.map((product) => product.toJson()).toList(),
    };
  }
}

class ServiceReport {
  final String? name;
  final double? price;

  ServiceReport({
    this.name,
    this.price,
  });

  factory ServiceReport.fromJson(Map<String, dynamic> json) {
    return ServiceReport(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
}

class ProductReport {
  final String? name;
  final double? price;
  final int? quantity;

  ProductReport({
    this.name,
    this.price,
    this.quantity,
  });

  factory ProductReport.fromJson(Map<String, dynamic> json) {
    return ProductReport(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}
