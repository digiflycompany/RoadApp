class AddVehicleRequestBody {
  final String make, model, modelAr, tankCapacity, motorNumber, chassisNumber, plateNumber, engineType, gearShiftType, brandId;
  final int CCNumber;

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
        required this.CCNumber
      });

  Map<String, dynamic> toJson() {
    return {
      'make': make,
      'model': model,
     'modelAr': modelAr,
      'tankCapacity': tankCapacity,
     'motorNumber': motorNumber,
      'chassisNumber': chassisNumber,
      'plateNumber': plateNumber,
      'engineType': engineType,
      'gearShiftType': gearShiftType,
      'brandId': brandId,
      'CCNumber': CCNumber
    };
  }
}