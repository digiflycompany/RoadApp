class ContactUsRequest {
  final String name;
  final String phone;
  final String email;
  final String note;
  final String type;

  ContactUsRequest({
    required this.name,
    required this.phone,
    required this.email,
    required this.note,
    required this.type,
  });

  // لتحويل JSON إلى كائن Dart
  factory ContactUsRequest.fromJson(Map<String, dynamic> json) {
    return ContactUsRequest(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      note: json['note'],
      type: json['type'],
    );
  }

  // لتحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'note': note,
      'type': type,
    };
  }
}
