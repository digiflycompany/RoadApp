class AddMemoRequestBody {
  final String date, type, description;
  final int priority;

  AddMemoRequestBody(
      {required this.date,
      required this.type,
      required this.description,
      required this.priority});

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'type': type,
      'description': description,
      'priority': priority
    };
  }
}