import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SearchDropDown extends StatelessWidget {
  const SearchDropDown({super.key, required this.label, required this.hint});
  final String label, hint;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,children: [
      Text(label, style: const TextStyle(fontSize: 10)),
      const Gap(4),
      Container(
          height: 31.2,
          decoration: BoxDecoration(
              color: const Color(0xFFECECEC),
              borderRadius: BorderRadius.circular(6.r)),
          child: DropdownButton<String>(
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              isExpanded: true,
              underline: const SizedBox.shrink(),
              hint: Text(hint,
                  style: TextStyle(
                      fontSize: 10.sp, color: const Color(0xffAAAAAA))),
              items: ['الدولة', 'الدولة', 'الدولة']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {}))
    ]);
  }
}