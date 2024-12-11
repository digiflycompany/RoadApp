class RequestExaminationBody {
  String maintenanceCenterId;
  String vehicleNumber;
  String scanType;
  String scanDate;
  int scanPrice;
  ReportContent reportContent;

  RequestExaminationBody({
    required this.maintenanceCenterId,
    required this.vehicleNumber,
    required this.scanType,
    required this.scanDate,
    required this.scanPrice,
    required this.reportContent,
  });

  factory RequestExaminationBody.fromJson(Map<String, dynamic> json) {
    return RequestExaminationBody(
      maintenanceCenterId: json['maintenanceCenterId'],
      vehicleNumber: json['vehicleNumber'],
      scanType: json['scanType'],
      scanDate: json['scanDate'],
      scanPrice: json['scanPrice'],
      reportContent: ReportContent.fromJson(json['reportContent']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maintenanceCenterId': maintenanceCenterId,
      'vehicleNumber': vehicleNumber,
      'scanType': scanType,
      'scanDate': scanDate,
      'scanPrice': scanPrice,
      'reportContent': reportContent.toJson(),
    };
  }
}

class ReportContent {
  OuterStructure outerStructure;
  ChassisAndFrame chassisAndFrame;
  EngineAndTransmission engineAndTransmission;
  SteeringSystem steeringSystem;
  ElectricalGroup electricalGroup;
  AirConditioningSystem airConditioningSystem;
  BrakesAndSafety brakesAndSafety;
  NotesSection notesSection;

  ReportContent({
    required this.outerStructure,
    required this.chassisAndFrame,
    required this.engineAndTransmission,
    required this.steeringSystem,
    required this.electricalGroup,
    required this.airConditioningSystem,
    required this.brakesAndSafety,
    required this.notesSection,
  });

  factory ReportContent.fromJson(Map<String, dynamic> json) {
    return ReportContent(
      outerStructure: OuterStructure.fromJson(json['outerStructure']),
      chassisAndFrame: ChassisAndFrame.fromJson(json['chassisAndFrame']),
      engineAndTransmission: EngineAndTransmission.fromJson(json['engineAndTransmission']),
      steeringSystem: SteeringSystem.fromJson(json['steeringSystem']),
      electricalGroup: ElectricalGroup.fromJson(json['electricalGroup']),
      airConditioningSystem: AirConditioningSystem.fromJson(json['airConditioningSystem']),
      brakesAndSafety: BrakesAndSafety.fromJson(json['brakesAndSafety']),
      notesSection: NotesSection.fromJson(json['notesSection']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'outerStructure': outerStructure.toJson(),
      'chassisAndFrame': chassisAndFrame.toJson(),
      'engineAndTransmission': engineAndTransmission.toJson(),
      'steeringSystem': steeringSystem.toJson(),
      'electricalGroup': electricalGroup.toJson(),
      'airConditioningSystem': airConditioningSystem.toJson(),
      'brakesAndSafety': brakesAndSafety.toJson(),
      'notesSection': notesSection.toJson(),
    };
  }
}

class OuterStructure {
  int carExteriorParts;
  int interiorCondition;
  int frontAndRearGlass;
  int roof;
  int windows;
  int inch;

  OuterStructure({
    required this.carExteriorParts,
    required this.interiorCondition,
    required this.frontAndRearGlass,
    required this.roof,
    required this.windows,
    required this.inch,
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

  Map<String, dynamic> toJson() {
    return {
      'carExteriorParts': carExteriorParts,
      'interiorCondition': interiorCondition,
      'frontAndRearGlass': frontAndRearGlass,
      'roof': roof,
      'windows': windows,
      'inch': inch,
    };
  }
}

class ChassisAndFrame {
  int fourChassis;
  int frontFrame;
  int roofStructure;
  int rearFrame;
  int frontFacade;
  int rearFacade;

  ChassisAndFrame({
    required this.fourChassis,
    required this.frontFrame,
    required this.roofStructure,
    required this.rearFrame,
    required this.frontFacade,
    required this.rearFacade,
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

  Map<String, dynamic> toJson() {
    return {
      'fourChassis': fourChassis,
      'frontFrame': frontFrame,
      'roofStructure': roofStructure,
      'rearFrame': rearFrame,
      'frontFacade': frontFacade,
      'rearFacade': rearFacade,
    };
  }
}

class EngineAndTransmission {
  int electronicallyExamineAllSystems;
  int examineMainBattery;
  int electricalEngineAndItsParts;
  int electricalConverter;
  int rechargeSystems;
  int coolingSystems;

  EngineAndTransmission({
    required this.electronicallyExamineAllSystems,
    required this.examineMainBattery,
    required this.electricalEngineAndItsParts,
    required this.electricalConverter,
    required this.rechargeSystems,
    required this.coolingSystems,
  });

  factory EngineAndTransmission.fromJson(Map<String, dynamic> json) {
    return EngineAndTransmission(
      electronicallyExamineAllSystems: json['electronicallyExamineAllSystems'],
      examineMainBattery: json['examineMainBattery'],
      electricalEngineAndItsParts: json['electricalEngineAndItsParts'],
      electricalConverter: json['electricalConverter'],
      rechargeSystems: json['rechargeSystems'],
      coolingSystems: json['coolingSystems'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'electronicallyExamineAllSystems': electronicallyExamineAllSystems,
      'examineMainBattery': examineMainBattery,
      'electricalEngineAndItsParts': electricalEngineAndItsParts,
      'electricalConverter': electricalConverter,
      'rechargeSystems': rechargeSystems,
      'coolingSystems': coolingSystems,
    };
  }
}

class SteeringSystem {
  int frontPines;
  int rearPines;
  int steeringGroupAndItsParts;
  int frontAndRearAxes;
  int wheelHub;
  int engineAndTransmissionMounts;

  SteeringSystem({
    required this.frontPines,
    required this.rearPines,
    required this.steeringGroupAndItsParts,
    required this.frontAndRearAxes,
    required this.wheelHub,
    required this.engineAndTransmissionMounts,
  });

  factory SteeringSystem.fromJson(Map<String, dynamic> json) {
    return SteeringSystem(
      frontPines: json['frontPines'],
      rearPines: json['rearPines'],
      steeringGroupAndItsParts: json['steeringGroupAndItsParts'],
      frontAndRearAxes: json['frontAndRearAxes'],
      wheelHub: json['wheelHub'],
      engineAndTransmissionMounts: json['engineAndTransmissionMounts'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'frontPines': frontPines,
      'rearPines': rearPines,
      'steeringGroupAndItsParts': steeringGroupAndItsParts,
      'frontAndRearAxes': frontAndRearAxes,
      'wheelHub': wheelHub,
      'engineAndTransmissionMounts': engineAndTransmissionMounts,
    };
  }
}

class ElectricalGroup {
  int frontLightingSystems;
  int rearLightingSystems;
  int roadsideAssistanceSystems;
  int batteryAndChargingSystem;
  int accessoriesAndFittings;

  ElectricalGroup({
    required this.frontLightingSystems,
    required this.rearLightingSystems,
    required this.roadsideAssistanceSystems,
    required this.batteryAndChargingSystem,
    required this.accessoriesAndFittings,
  });

  factory ElectricalGroup.fromJson(Map<String, dynamic> json) {
    return ElectricalGroup(
      frontLightingSystems: json['frontLightingSystems'],
      rearLightingSystems: json['rearLightingSystems'],
      roadsideAssistanceSystems: json['roadsideAssistanceSystems'],
      batteryAndChargingSystem: json['batteryAndChargingSystem'],
      accessoriesAndFittings: json['accessoriesAndFittings'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'frontLightingSystems': frontLightingSystems,
      'rearLightingSystems': rearLightingSystems,
      'roadsideAssistanceSystems': roadsideAssistanceSystems,
      'batteryAndChargingSystem': batteryAndChargingSystem,
      'accessoriesAndFittings': accessoriesAndFittings,
    };
  }
}

class AirConditioningSystem {
  int airConditioningAndCompressorSystem;
  int heatingSystem;
  int engineAndFansCooling;
  int fluidSmuggling;

  AirConditioningSystem({
  required this.airConditioningAndCompressorSystem,
  required this.heatingSystem,
  required this.engineAndFansCooling,
    required this.fluidSmuggling,
  });

  factory AirConditioningSystem.fromJson(Map<String, dynamic> json) {
    return AirConditioningSystem(
      airConditioningAndCompressorSystem: json['airConditioningAndCompressorSystem'],
      heatingSystem: json['heatingSystem'],
      engineAndFansCooling: json['engineAndFansCooling'],
      fluidSmuggling: json['fluidSmuggling'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'airConditioningAndCompressorSystem': airConditioningAndCompressorSystem,
      'heatingSystem': heatingSystem,
      'engineAndFansCooling': engineAndFansCooling,
      'fluidSmuggling': fluidSmuggling,
    };
  }
}

class BrakesAndSafety {
  int airBags;
  int tires;
  int brakesAndTheirParts;
  int seatBelts;
  int antiSlipSystems;

  BrakesAndSafety({
    required this.airBags,
    required this.tires,
    required this.brakesAndTheirParts,
    required this.seatBelts,
    required this.antiSlipSystems,
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

  Map<String, dynamic> toJson() {
    return {
      'airBags': airBags,
      'tires': tires,
      'brakesAndTheirParts': brakesAndTheirParts,
      'seatBelts': seatBelts,
      'antiSlipSystems': antiSlipSystems,
    };
  }
}

class NotesSection {
  String notes;

  NotesSection({
    required this.notes,
  });

  factory NotesSection.fromJson(Map<String, dynamic> json) {
    return NotesSection(
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notes': notes,
    };
  }
}
