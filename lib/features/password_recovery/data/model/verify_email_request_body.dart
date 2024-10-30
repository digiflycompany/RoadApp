class VerifyEmailRequestBody {
  final String code;

  VerifyEmailRequestBody({required this.code});

  Map<String, dynamic> toJson() {
    return {'verificationCode': code};
  }
}