class GetCodeRequestBody {
  final String email;

  GetCodeRequestBody({required this.email});

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}