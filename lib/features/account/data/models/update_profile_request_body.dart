class UpdateProfileRequestBody {
  final String? fullName, phoneNumber, email, password, countryId,picture;

  UpdateProfileRequestBody(
      {this.email, this.password, this.fullName, this.phoneNumber, this.countryId,this.picture});

  Map<String, dynamic> toJson() {
    return {
      if(email != null) 'email': email,
      if(password != null) 'password': password,
      if(fullName!= null) 'fullName': fullName,
      if(phoneNumber!= null) 'phoneNumber': phoneNumber,
      if(countryId!= null) "countryId": countryId,
      if(picture!= null) "picture": picture,
    };
  }
}