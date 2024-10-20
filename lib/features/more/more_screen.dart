import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/components.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(children: [
          optionItem(StringManager.login.tr(context)),
          divider(),
          optionItem(StringManager.aboutApp.tr(context)),
          divider(),
          optionItem(StringManager.contactUs.tr(context)),
          divider(),
          optionItem(
              StringManager.termsAndConditionsAndPrivacyPolicy.tr(context)),
          divider(),
          optionItem(StringManager.workshopOwner.tr(context)),
          divider(),
          optionItem(StringManager.languageSettings.tr(context)),
          divider()
        ]));
  }
}

Widget optionItem(String optionName) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(children: [
      Text(optionName,
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold)),
      const Spacer(),
      const Icon(Icons.arrow_forward_ios)
    ]));