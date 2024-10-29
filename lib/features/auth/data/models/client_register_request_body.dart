class ClientRegisterRequestBody {
  final String email, password, fullName, phoneNumber, countryId;

  ClientRegisterRequestBody(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.phoneNumber,
      required this.countryId});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'countryId': countryId
    };
  }
}