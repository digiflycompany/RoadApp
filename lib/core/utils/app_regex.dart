/*import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRegex {
  final BuildContext context;
  final String? confirmationPassword;
  AppRegex({
    required this.context,
    this.confirmationPassword
  });
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return StringManager.emptyPassword.tr(context);
    }

    if(confirmationPassword != null && confirmationPassword!.trim().isNotEmpty && password != confirmationPassword) {
      return StringManager.twoProvidedPasswordsDoNotMatch.tr(context);
    }

    if (!hasLowerCase(password)) {
      return StringManager.noLowerCase.tr(context);
    }

    if (!hasUpperCase(password)) {
      return StringManager.noUpperCase.tr(context);
    }

    if (!hasNumber(password)) {
      return StringManager.noNumber.tr(context);
    }

    if (!hasSpecialCharacter(password)) {
      return StringManager.noSpecialCharacter.tr(context);
    }

    if (!hasMinLength(password)) {
      return StringManager.shortPassword.tr(context);
    }

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.emptyName.tr(context);
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.phoneNumberIsRequired.tr(context);
    }
    return null;
  }
}*/