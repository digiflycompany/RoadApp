import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SectionRow extends StatefulWidget {
  final Function(int) onValueSelected;
  final int initialValue; // إضافة القيمة الأولية

  const SectionRow({
    super.key,
    required this.onValueSelected,
    required this.initialValue, // القيمة الأولية مطلوبة
  });

  @override
  State<SectionRow> createState() => _SectionRowState();
}

class _SectionRowState extends State<SectionRow> {
  late int _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue; // تعيين القيمة الأولية
  }

  @override
  void didUpdateWidget(SectionRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setState(() {
        _selectedValue = widget.initialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        Color color = index == 0
            ? Colors.red
            : index == 1
            ? Colors.yellowAccent
            : Colors.greenAccent;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedValue = index + 1;
            });
            widget.onValueSelected(_selectedValue);
          },
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundColor: color,
              radius: 12.w,
              child: _selectedValue == index + 1
                  ? Icon(Icons.check, color: Colors.black, size: 13.w)
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
