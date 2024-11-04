class UpdateProfileRequestBody {
  final String? fullName, phoneNumber, email, password;

  UpdateProfileRequestBody(
      {this.email, this.password, this.fullName, this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'phoneNumber': phoneNumber
    };
  }
}