class ReportResponse {
  final bool? success;
  final Data? data;

  ReportResponse({
    this.success,
    this.data,
  });

  factory ReportResponse.fromJson(Map<String, dynamic> json) {
    return ReportResponse(
      success: json['success'],
      data: json['data'] != null
          ? Data.fromJson(json['data'])
          : null,
    );
  }
}

class Data {
  final List<Report>? reports;
  final OptionsReports? options;

  Data({
    this.reports,
    this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      reports: json['reports'] != null
          ? (json['reports'] as List)
          .map((report) => Report.fromJson(report))
          .toList()
          : null,
      options: json['options'] != null
          ? OptionsReports.fromJson(json['options'])
          : null,
    );
  }
}

class Report {
  // Existing fields
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
  final String? maintenanceCenterName;
  final String? maintenanceCenterLandLine;

  // New fields
  final Client? clientId;
  final String? vehicleNumber;
  final String? scanType;
  final DateTime? scanDate;
  final String? scanPrice;
  final ReportContent? reportContent;

  Report({
    // Existing fields
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
    this.maintenanceCenterName,
    this.maintenanceCenterLandLine,

    // New fields
    this.clientId,
    this.vehicleNumber,
    this.scanType,
    this.scanDate,
    this.scanPrice,
    this.reportContent,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['_id'],

      // In the new response this is a String, not an object.
      // Kept as MaintenanceCenter? to avoid removing your existing field.
      maintenanceCenterId: json['maintenanceCenterId'] is Map<String, dynamic>
          ? MaintenanceCenter.fromJson(json['maintenanceCenterId'])
          : null,

      userId: json['userId'],
      vehicleId: json['vehicleId'],

      services: json['services'] != null
          ? (json['services'] as List)
          .map((service) => Service.fromJson(service))
          .toList()
          : null,

      products: json['products'] != null
          ? (json['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList()
          : null,

      date: json['date'] != null
          ? DateTime.parse(json['date'])
          : null,

      price: json['price']?.toDouble(),
      verified: json['verified'],

      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,

      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,

      version: json['__v'],

      maintenanceCenterName:
      json['maintenanceCenterName'] as String?,

      maintenanceCenterLandLine:
      json['maintenanceCenterLandLine'] as String?,

      // New response fields
      clientId: json['clientId'] != null
          ? Client.fromJson(json['clientId'])
          : null,

      vehicleNumber: json['vehicleNumber'] as String?,

      scanType: json['scanType'] as String?,

      scanDate: json['scanDate'] != null
          ? DateTime.parse(json['scanDate'])
          : null,

      scanPrice: json['scanPrice']?.toString(),

      reportContent: json['reportContent'] != null
          ? ReportContent.fromJson(json['reportContent'])
          : null,
    );
  }
}

class Client {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? email;

  Client({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['_id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }
}

class ReportContent {
  final OuterStructure? outerStructure;
  final ChassisAndFrame? chassisAndFrame;
  final EngineAndTransmission? engineAndTransmission;
  final SteeringSystem? steeringSystem;
  final ElectricalGroup? electricalGroup;
  final AirConditioningSystem? airConditioningSystem;
  final BrakesAndSafety? brakesAndSafety;
  final NotesSection? notesSection;

  ReportContent({
    this.outerStructure,
    this.chassisAndFrame,
    this.engineAndTransmission,
    this.steeringSystem,
    this.electricalGroup,
    this.airConditioningSystem,
    this.brakesAndSafety,
    this.notesSection,
  });

  factory ReportContent.fromJson(Map<String, dynamic> json) {
    return ReportContent(
      outerStructure: json['outerStructure'] != null
          ? OuterStructure.fromJson(json['outerStructure'])
          : null,
      chassisAndFrame: json['chassisAndFrame'] != null
          ? ChassisAndFrame.fromJson(json['chassisAndFrame'])
          : null,
      engineAndTransmission: json['engineAndTransmission'] != null
          ? EngineAndTransmission.fromJson(json['engineAndTransmission'])
          : null,
      steeringSystem: json['steeringSystem'] != null
          ? SteeringSystem.fromJson(json['steeringSystem'])
          : null,
      electricalGroup: json['electricalGroup'] != null
          ? ElectricalGroup.fromJson(json['electricalGroup'])
          : null,
      airConditioningSystem: json['airConditioningSystem'] != null
          ? AirConditioningSystem.fromJson(json['airConditioningSystem'])
          : null,
      brakesAndSafety: json['brakesAndSafety'] != null
          ? BrakesAndSafety.fromJson(json['brakesAndSafety'])
          : null,
      notesSection: json['notesSection'] != null
          ? NotesSection.fromJson(json['notesSection'])
          : null,
    );
  }
}

class OuterStructure {
  final int? carExteriorParts;
  final int? interiorCondition;
  final int? frontAndRearGlass;
  final int? roof;
  final int? windows;
  final int? inch;

  OuterStructure({
    this.carExteriorParts,
    this.interiorCondition,
    this.frontAndRearGlass,
    this.roof,
    this.windows,
    this.inch,
  });

  factory OuterStructure.fromJson(Map<String, dynamic> json) {
    return OuterStructure(
      carExteriorParts: json['carExteriorParts'],
      interiorCondition: json['interiorCondition'],
      frontAndRearGlass: json['frontAndRearGlass'],
      roof: json['roof'],
      windows: json['windows'],
      inch: json['inch'],
    );
  }
}

class ChassisAndFrame {
  final int? fourChassis;
  final int? frontFrame;
  final int? roofStructure;
  final int? rearFrame;
  final int? frontFacade;
  final int? rearFacade;

  ChassisAndFrame({
    this.fourChassis,
    this.frontFrame,
    this.roofStructure,
    this.rearFrame,
    this.frontFacade,
    this.rearFacade,
  });

  factory ChassisAndFrame.fromJson(Map<String, dynamic> json) {
    return ChassisAndFrame(
      fourChassis: json['fourChassis'],
      frontFrame: json['frontFrame'],
      roofStructure: json['roofStructure'],
      rearFrame: json['rearFrame'],
      frontFacade: json['frontFacade'],
      rearFacade: json['rearFacade'],
    );
  }
}

class EngineAndTransmission {
  final int? electronicallyExamineAllSystems;
  final int? examineMainBattery;
  final int? electricalEngineAndItsParts;
  final int? electricalConverter;
  final int? rechargeSystems;
  final int? coolingSystems;

  EngineAndTransmission({
    this.electronicallyExamineAllSystems,
    this.examineMainBattery,
    this.electricalEngineAndItsParts,
    this.electricalConverter,
    this.rechargeSystems,
    this.coolingSystems,
  });

  factory EngineAndTransmission.fromJson(Map<String, dynamic> json) {
    return EngineAndTransmission(
      electronicallyExamineAllSystems:
      json['electronicallyExamineAllSystems'],
      examineMainBattery: json['examineMainBattery'],
      electricalEngineAndItsParts:
      json['electricalEngineAndItsParts'],
      electricalConverter: json['electricalConverter'],
      rechargeSystems: json['rechargeSystems'],
      coolingSystems: json['coolingSystems'],
    );
  }
}

class SteeringSystem {
  final int? frontPines;
  final int? rearPines;
  final int? steeringGroupAndItsParts;
  final int? frontAndRearAxes;
  final int? wheelHub;
  final int? engineAndTransmissionMounts;

  SteeringSystem({
    this.frontPines,
    this.rearPines,
    this.steeringGroupAndItsParts,
    this.frontAndRearAxes,
    this.wheelHub,
    this.engineAndTransmissionMounts,
  });

  factory SteeringSystem.fromJson(Map<String, dynamic> json) {
    return SteeringSystem(
      frontPines: json['frontPines'],
      rearPines: json['rearPines'],
      steeringGroupAndItsParts:
      json['steeringGroupAndItsParts'],
      frontAndRearAxes: json['frontAndRearAxes'],
      wheelHub: json['wheelHub'],
      engineAndTransmissionMounts:
      json['engineAndTransmissionMounts'],
    );
  }
}

class ElectricalGroup {
  final int? frontLightingSystems;
  final int? rearLightingSystems;
  final int? roadsideAssistanceSystems;
  final int? batteryAndChargingSystem;
  final int? accessoriesAndFittings;

  ElectricalGroup({
    this.frontLightingSystems,
    this.rearLightingSystems,
    this.roadsideAssistanceSystems,
    this.batteryAndChargingSystem,
    this.accessoriesAndFittings,
  });

  factory ElectricalGroup.fromJson(Map<String, dynamic> json) {
    return ElectricalGroup(
      frontLightingSystems: json['frontLightingSystems'],
      rearLightingSystems: json['rearLightingSystems'],
      roadsideAssistanceSystems:
      json['roadsideAssistanceSystems'],
      batteryAndChargingSystem:
      json['batteryAndChargingSystem'],
      accessoriesAndFittings:
      json['accessoriesAndFittings'],
    );
  }
}

class AirConditioningSystem {
  final int? airConditioningAndCompressorSystem;
  final int? heatingSystem;
  final int? engineAndFansCooling;
  final int? fluidSmuggling;

  AirConditioningSystem({
    this.airConditioningAndCompressorSystem,
    this.heatingSystem,
    this.engineAndFansCooling,
    this.fluidSmuggling,
  });

  factory AirConditioningSystem.fromJson(Map<String, dynamic> json) {
    return AirConditioningSystem(
      airConditioningAndCompressorSystem:
      json['airConditioningAndCompressorSystem'],
      heatingSystem: json['heatingSystem'],
      engineAndFansCooling:
      json['engineAndFansCooling'],
      fluidSmuggling: json['fluidSmuggling'],
    );
  }
}

class BrakesAndSafety {
  final int? airBags;
  final int? tires;
  final int? brakesAndTheirParts;
  final int? seatBelts;
  final int? antiSlipSystems;

  BrakesAndSafety({
    this.airBags,
    this.tires,
    this.brakesAndTheirParts,
    this.seatBelts,
    this.antiSlipSystems,
  });

  factory BrakesAndSafety.fromJson(Map<String, dynamic> json) {
    return BrakesAndSafety(
      airBags: json['airBags'],
      tires: json['tires'],
      brakesAndTheirParts: json['brakesAndTheirParts'],
      seatBelts: json['seatBelts'],
      antiSlipSystems: json['antiSlipSystems'],
    );
  }
}

class NotesSection {
  final String? notes;

  NotesSection({
    this.notes,
  });

  factory NotesSection.fromJson(Map<String, dynamic> json) {
    return NotesSection(
      notes: json['notes'],
    );
  }
}

class MaintenanceCenter {
  final String? id;
  final String? landline;
  final String? name;

  MaintenanceCenter({
    this.id,
    this.landline,
    this.name,
  });

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
      price: json['price']?.toDouble(),
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
      price: json['price']?.toDouble(),
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

  OptionsReports({
    this.limit,
    this.skip,
    this.sort,
    this.page,
    this.count,
  });

  factory OptionsReports.fromJson(Map<String, dynamic> json) {
    return OptionsReports(
      limit: json['limit'],
      skip: json['skip'],
      sort: json['sort'] != null
          ? Sort.fromJson(json['sort'])
          : null,
      page: json['page'],
      count: json['count'],
    );
  }
}

class Sort {
  final String? createdAt;

  Sort({
    this.createdAt,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'],
    );
  }
}