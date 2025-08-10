class ResetPasswordRequestBody {
  final String password;

  ResetPasswordRequestBody({required this.password});

  Map<String, dynamic> toJson() {
    return {'password': password};
  }
}