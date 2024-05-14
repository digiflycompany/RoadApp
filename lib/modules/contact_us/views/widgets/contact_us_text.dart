import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsText extends StatelessWidget {
  const ContactUsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('نحن هنا لمساعدتك والاستماع إلى استفساراتك، فلا\n تتردد في التواصل معنا في أي وقت',textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 11.sp,
      ),
    );
  }
}
