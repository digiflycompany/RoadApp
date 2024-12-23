class UpdateMcRequestBody {
  String? name;
  String? landline;
  AddressMc? address;

  UpdateMcRequestBody({this.name, this.landline, this.address});

  factory UpdateMcRequestBody.fromJson(Map<String, dynamic> json) {
    return UpdateMcRequestBody(
      name: json['name'] as String?,
      landline: json['landline'] as String?,
      address: json['address'] != null
          ? AddressMc.fromJson(json['address'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'landline': landline,
      'address': address?.toJson(),
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
