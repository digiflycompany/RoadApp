import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class SecondFilterRow extends StatefulWidget {
  SecondFilterRow(
      {super.key,
      required this.month1,
      required this.month2,
      required this.is1Checked,
      required this.is2Checked});
  final String month1, month2;
  bool? is1Checked, is2Checked;

  @override
  State<SecondFilterRow> createState() => _SecondFilterRowState();
}

class _SecondFilterRowState extends State<SecondFilterRow> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Flexible(
          child: CheckboxListTile(
              title: Text(widget.month1,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)),
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.black,
              fillColor: const WidgetStatePropertyAll(AppColors.whiteColor),
              contentPadding: EdgeInsets.zero,
              value: widget.is1Checked,
              onChanged: (val) {
                widget.is1Checked = val!;
                setState(() {});
              })),
      Flexible(
          child: CheckboxListTile(
              title: Text(widget.month2,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)),
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.black,
              fillColor: const WidgetStatePropertyAll(AppColors.whiteColor),
              contentPadding: EdgeInsets.zero,
              value: widget.is2Checked,
              onChanged: (val) {
                widget.is2Checked = val!;
                setState(() {});
              }))
    ]);
  }
}