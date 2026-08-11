class UpdateMcRequestBody {
  String? name;
  String? landline;
  dynamic picture;
  AddressMc? address;

  UpdateMcRequestBody({this.name, this.landline, this.picture, this.address});

  factory UpdateMcRequestBody.fromJson(Map<String, dynamic> json) {
    return UpdateMcRequestBody(
      name: json['name'] as String?,
      landline: json['landline'] as String?,
      picture: json['picture'],
      address:
          json['address'] != null ? AddressMc.fromJson(json['address']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (landline != null) 'landline': landline,
      if (picture != null) 'picture': picture,
      if (address != null) 'address': address?.toJson(),
    };
  }
}

class AddressMc {
  String? firstLine;
  String? city;

  AddressMc({this.firstLine, this.city});

  factory AddressMc.fromJson(Map<String, dynamic> json) {
    return AddressMc(
      firstLine: json['firstLine'] as String?,
      city: json['city'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstLine': firstLine,
      'city': city,
    };
  }
}
