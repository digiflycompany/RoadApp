import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

extension CurrentLang on BuildContext {
  bool get isCurrentEnglish => locale == const Locale('en');
}
extension ToColorFilter on Color {
  ColorFilter? get toColorFilter {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}