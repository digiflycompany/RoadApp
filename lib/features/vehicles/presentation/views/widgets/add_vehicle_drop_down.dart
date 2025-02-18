import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//
class AddVehicleDropDown extends StatelessWidget {
  const AddVehicleDropDown({
    super.key,
    required this.title,
    required this.items,
    this.onChanged,
    required this.hint,
  });

  final String title, hint;
  final List<DropdownMenuItem<String>> items;  // تعديل هنا ليقبل قائمة من DropdownMenuItem<String>
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        DropdownButton<String>(
          items: items,  // عرض القائمة هنا
          onChanged: onChanged,
          hint: Text(hint,style: const TextStyle(fontSize: 9),),
        ),
      ],
    );
  }
}

// class AddVehicleDropDown extends StatelessWidget {
//   const AddVehicleDropDown({
//     super.key,
//     required this.title,
//     required this.items,
//     this.onChanged,
//     required this.hint,
//   });
//
//   final String title, hint;
//   final List<String> items;
//   final void Function(String?)? onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 11.sp,
//             fontWeight: FontWeight.w600,
//           ),
//           overflow: TextOverflow.ellipsis,
//           maxLines: 1,
//         ),
//         DropdownButton<String>(
//           items: items
//               .map((item) => DropdownMenuItem<String>(
//             value: item,
//             child: Text(item),
//           ))
//               .toList(),
//           onChanged: onChanged,
//           hint: Text(hint),
//         ),
//       ],
//     );
//   }
// }

class AddVehicleTwoDropDown extends StatelessWidget {
  const AddVehicleTwoDropDown(
      {super.key,
      required this.title,
      required this.items,
      this.onChanged,
      required this.hint});
  final String title, hint;
  final List items;
  final void Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
          maxLines: 1),
      DropdownButton<String>(
          items: items.map((item) {
                return DropdownMenuItem<String>(
                    value: item, child: Text(item));
              }).toList(),
          onChanged: onChanged,
          hint: Text(hint))
    ]);
  }
}