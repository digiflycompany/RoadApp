import 'package:flutter/material.dart';
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


  /// التحقق من صحة رقم لوحة السيارة (6-10 رموز تحتوي على أرقام أو حروف عربية/إنجليزية)
  // static bool isPlateNumberValid(String plateNumber) {
  //   return RegExp(r'^[\u0600-\u06FFa-zA-Z0-9]{6,10}$').hasMatch(plateNumber);
  // }
  static bool isPlateNumberValid(String plateNumber) {
    return RegExp(r'^[a-zA-Z0-9\u0600-\u06FF\s]{6,10}$').hasMatch(plateNumber);
  }


  /// التحقق من صحة نوع ناقل الحركة (يجب أن يكون نصًا بدون أرقام)
  static bool isTransmissionTypeValid(String transmissionType) {
    return RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$').hasMatch(transmissionType);
  }

  /// التحقق من صحة سعة المحرك (يجب أن يكون بين 500 و 8000 CC)
  static bool isEngineCapacityValid(String engineCapacity) {
    final capacity = int.tryParse(engineCapacity);
    if (capacity == null) return false;
    return capacity >= 500 && capacity <= 8000;
  }


  /// التحقق من صحة رقم المحرك (10-17 رمزًا يحتوي على حروف وأرقام)
  static bool isEngineNumberValid(String engineNumber) {
    return RegExp(r'^[a-zA-Z0-9]{10,17}$').hasMatch(engineNumber);
  }

  /// التحقق من صحة رقم الهيكل (يجب أن يكون 17 رمزًا بدون الأحرف I, O, Q)
  static bool isChassisNumberValid(String chassisNumber) {
    return RegExp(r'^[A-HJ-NPR-Z0-9]{17}$').hasMatch(chassisNumber);
  }

  /// التحقق من صحة سعة خزان الوقود (يجب أن يكون بين 10 و 200 لتر)
  static bool isFuelTankCapacityValid(String fuelTankCapacity) {
    return RegExp(r'^[1-9][0-9]?$|^200$').hasMatch(fuelTankCapacity);
  }

  /*String? validatePassword(String? password) {
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
  }*/
}