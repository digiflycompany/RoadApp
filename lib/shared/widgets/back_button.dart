import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/shared/extensions/context_extension.dart';

import '../resources/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            angle: context.isCurrentEnglish ? 135 : 0,
            child: SvgPicture.asset('assets/icons/arrow.svg'),
          ),
        ),
      ),
    );
  }
}
