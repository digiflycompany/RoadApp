import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class FilterOption extends StatelessWidget {
  const FilterOption({
    super.key,
    required this.text,
    required this.value,
    this.onChanged,
  });

  final String text;
  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: CheckboxListTile(
            title: Text(text,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)),
            controlAffinity: ListTileControlAffinity.leading,
            checkColor: Colors.black,
            fillColor: WidgetStateProperty.all(AppColors.whiteColor),
            contentPadding: EdgeInsets.zero,
            value: value,
            onChanged: onChanged ?? (value) {}));
  }
}