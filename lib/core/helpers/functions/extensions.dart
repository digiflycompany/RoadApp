import 'package:flutter/material.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
  AppLocalizations get strings => AppLocalizations.of(this)!;
  String get language => Localizations.localeOf(this).languageCode;
  bool get isArabic => language == 'ar';
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension NumberTranslation on String {
  /*String numTr() {
    final isArabic = navigatorKey.currentContext!.isArabic;

    String value = this;

    // 🔹 حذف .000
    if (value.contains('.')) {
      value = value.replaceAll(RegExp(r'\.0+$'), '');
    }

    if (!isArabic) {
      return value;
    }

    // 🔥 استبدال . بين أرقام بـ ,
    value = value.replaceAllMapped(RegExp(r'(?<=\d)\.(?=\d)'), (match) => ',');

    final arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    value = value.replaceAll('%', '٪');

    return value
        .replaceAllMapped(
          RegExp(r'\d'),
          (match) => arabicNumbers[int.parse(match[0]!)],
        )
        .replaceAll(',', '،'); // الفاصلة العربية
  }*/

  String handleEgyptianNumber() {
    final String phone = trim();

    if (phone.startsWith("+201")) {
      return phone.substring(3); // remove +20
    } else if (phone.startsWith("201")) {
      return phone.substring(2); // remove 20
    } else if (phone.startsWith("0201")) {
      return phone.substring(3); // remove 020
    } else if (phone.startsWith("01")) {
      return phone.substring(1); // remove 0
    }

    return phone; // unchanged
  }
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension SplitDoubleExtension on double {
  List<String> splitDouble({int maxDecimalLength = 2}) {
    final parts = toString().split('.');

    final integerPart = parts[0];

    String decimalPart = parts.length > 1 ? parts[1] : '0';

    if (decimalPart.length > maxDecimalLength) {
      decimalPart = decimalPart.substring(0, maxDecimalLength);
    }

    return [integerPart, decimalPart];
  }
}
