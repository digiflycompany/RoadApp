class AddVehicleRequestBody {
  final String make,
      model,
      modelAr,
      tankCapacity,
      motorNumber,
      chassisNumber,
      plateNumber,
      engineType,
      gearShiftType,
      brandId;
  final int CCNumber;
  final int? manufacturingYear;

  AddVehicleRequestBody(
      {required this.make,
      required this.model,
      required this.modelAr,
      required this.tankCapacity,
      required this.motorNumber,
      required this.chassisNumber,
      required this.plateNumber,
      required this.engineType,
      required this.gearShiftType,
      required this.brandId,
      required this.CCNumber,
      this.manufacturingYear});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'make': make,
      'model': model,
      'modelAr': modelAr,
      'tankCapacity': tankCapacity,
      'plateNumber': plateNumber,
      'engineType': engineType,
      'gearShiftType': gearShiftType,
      'brandId': brandId,
      'CCNumber': CCNumber,
      'manufacturingYear': manufacturingYear,
    };

    // Only add these if not empty
    if (motorNumber.isNotEmpty) {
      data['motorNumber'] = motorNumber;
    }
    if (chassisNumber.isNotEmpty) {
      data['chassisNumber'] = chassisNumber;
    }

    return data;
  }

}