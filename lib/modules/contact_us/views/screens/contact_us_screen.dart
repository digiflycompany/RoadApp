import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/contact_us/views/widgets/contact_us_img.dart';
import 'package:roadapp2/modules/contact_us/views/widgets/contact_us_text.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'تواصل معنا')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: const SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContactUsImage(),
                ContactUsText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
