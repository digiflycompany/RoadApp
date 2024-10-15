import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsText extends StatelessWidget {
  const ContactUsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 40.h, bottom: 80.h),
        child: Text(
            'نحن هنا لمساعدتك والاستماع إلى استفساراتك، فلا\n تتردد في التواصل معنا في أي وقت', // النص دا غالبا هييجي من الباك إإند عشان كدا مش مترجم إلى الآن
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp)));
  }
}