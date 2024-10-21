import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class SecondFilterRow extends StatefulWidget {
  const SecondFilterRow(
      {Key? key,
      required this.month1,
      required this.month2,
      required this.is1Checked,
      required this.is2Checked})
      : super(key: key);

  final String month1;
  final String month2;
  final bool is1Checked;
  final bool is2Checked;

  @override
  State<SecondFilterRow> createState() => _SecondFilterRowState();
}

class _SecondFilterRowState extends State<SecondFilterRow> {
  late bool _is1Checked;
  late bool _is2Checked;

  @override
  void initState() {
    super.initState();
    _is1Checked = widget.is1Checked;
    _is2Checked = widget.is2Checked;
  }

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
              value: _is1Checked,
              onChanged: (val) {
                setState(() {
                  _is1Checked = val!;
                });
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
              value: _is2Checked,
              onChanged: (val) {
                setState(() {
                  _is2Checked = val!;
                });
              }))
    ]);
  }
}