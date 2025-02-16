class AddMemoRequestBody {
  final String date, type, description;
  final int priority;
  final String vehicleId;

  AddMemoRequestBody({
    required this.date,
    required this.type,
    required this.description,
    required this.priority,
    required this.vehicleId,
  });

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'type': type,
      'description': description,
      'priority': priority,
      'vehicleId': vehicleId, // تمت إضافة vehicleId هنا
    };
  }
}
