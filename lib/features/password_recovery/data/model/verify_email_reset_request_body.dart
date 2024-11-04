class VerifyEmailResetRequestBody {
  final String email, resetPasswordCode;

  VerifyEmailResetRequestBody({required this.resetPasswordCode, required this.email});

  Map<String, dynamic> toJson() {
    return {'email': email, 'resetPasswordCode': resetPasswordCode};
  }
}