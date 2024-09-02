import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/modules/contact_us/views/widgets/contact_us_details_row.dart';
import 'package:roadapp/modules/contact_us/views/widgets/contact_us_img.dart';
import 'package:roadapp/modules/contact_us/views/widgets/contact_us_text.dart';

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
                ContactUsDetailsRow(detail: 'رقم الهاتف:',value: '0123456789',),
                ContactUsDetailsRow(detail: 'واتسآب:',value: '0123456789',),
                ContactUsDetailsRow(detail: 'البريد الالكتروني:',value: 'Roadapp@example.com',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
