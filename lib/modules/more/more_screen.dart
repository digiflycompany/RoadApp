import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/shared/components.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        children: [
          optionItem("تسجيل الدخول"),
          divider(),
          optionItem("عن التطبيق"),
          divider(),
          optionItem("تواصل معنا"),
          divider(),
          optionItem("الشروط والاحكام وسياسة الخصوصية"),
          divider(),
          optionItem("مالك الورشة"),
          divider(),
          optionItem("اعدادات الللغة"),
          divider(),
        ],
      ),
    );
  }
}

Widget optionItem(String optionName) => Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Row(
        children: [
          Text(
            optionName,
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
);
