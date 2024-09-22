import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class Message extends StatelessWidget {
  const Message({super.key, required this.text, required this.received});
  final String text;
  final bool received;

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return  Row(
      children: [
        if(received) const Spacer(),
        Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
                color: received? AppColors.whiteColor2:AppColors.whiteYellow,
                borderRadius: BorderRadius.circular(30.r)),
            constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.60),
            child: Text(
              text,
              style: TextStyle(fontSize: 10.sp),
              textAlign: currentLang == 'ar'? TextAlign.right: TextAlign.left,
            )),
        if(!received) const Spacer()
      ]
    );
  }
}
