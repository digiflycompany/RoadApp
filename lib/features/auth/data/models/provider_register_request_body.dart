class ProviderRegisterRequestBody {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String password;
  final String countryId;
  final MaintenanceCenter maintenanceCenter;

  ProviderRegisterRequestBody({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.countryId,
    required this.maintenanceCenter,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'countryId': countryId,
      'maintenanceCenter': maintenanceCenter.toJson(),
    };
  }
}

class MaintenanceCenter {
  final String name;
  final Address address;
  final String landline;
  final String taxRegistrationNo;
  final String commercialRegistrationNo;
  final String countryId;

  MaintenanceCenter({
    required this.name,
    required this.address,
    required this.landline,
    required this.taxRegistrationNo,
    required this.commercialRegistrationNo,
    required this.countryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address.toJson(),
      'landline': landline,
      'taxRegistrationNo': taxRegistrationNo,
      'commercialRegistrationNo': commercialRegistrationNo,
      'countryId': countryId,
    };
  }
}

class Address {
  final String firstLine;
  final String city;

  Address({
    required this.firstLine,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstLine': firstLine,
      'city': city,
    };
  }
}