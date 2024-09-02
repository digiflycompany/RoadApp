import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        border: Border.all(
          color: AppColors.greyColor,
        ),
        boxShadow: const [
          BoxShadow(color: AppColors.greyColor, blurRadius: 6),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Center(
          child: Transform.rotate(
            angle: currentLang == 'en' ? 135 : 0,
            child: SvgPicture.asset('assets/icons/arrow.svg'),
          ),
        ),
      ),
    );
  }
}
