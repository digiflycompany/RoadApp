import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/contact_us/views/widgets/contact_us_details_row.dart';
import 'package:roadapp/features/contact_us/views/widgets/contact_us_img.dart';
import 'package:roadapp/features/contact_us/views/widgets/contact_us_text.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.contactUs.tr(context))),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(20.r),
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const ContactUsImage(),
                          const ContactUsText(),
                          ContactUsDetailsRow(
                              detail:
                                  '${StringManager.phoneNumber.tr(context)}:',
                              value: '0123456789'),
                          ContactUsDetailsRow(
                              detail: '${StringManager.whatsApp.tr(context)}:',
                              value: '0123456789'),
                          ContactUsDetailsRow(
                              detail: '${StringManager.email.tr(context)}:',
                              value: 'Roadapp@example.com')
                        ])))));
  }
}