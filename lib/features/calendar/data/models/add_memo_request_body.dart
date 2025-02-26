class AddMemoClientRequestBody {
  final String date, type, description;
  final int priority;
  final String? vehicleId; // اجعل vehicleId اختياريًا

  AddMemoClientRequestBody({
    required this.date,
    required this.type,
    required this.description,
    required this.priority,
    this.vehicleId, // اجعله غير مطلوب
  });

  Map<String, dynamic> toJson() {
    final data = {
      'date': date,
      'type': type,
      'description': description,
      'priority': priority,
    };

    if (vehicleId != null && vehicleId!.isNotEmpty) {
      data['vehicleId'] = vehicleId!;
    }


    return data;
  }
}


class AddMemoProviderRequestBody {
  final String date, type, description;
  final int priority;
  final String? clientId; // اجعل vehicleId اختياريًا

  AddMemoProviderRequestBody({
    required this.date,
    required this.type,
    required this.description,
    required this.priority,
    this.clientId, // اجعله غير مطلوب
  });

  Map<String, dynamic> toJson() {
    final data = {
      'date': date,
      'type': type,
      'description': description,
      'priority': priority,
    };


    if (clientId != null && clientId!.isNotEmpty) {
      data['clientId'] = clientId!;
    }

    return data;
  }
}