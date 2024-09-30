import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/account/presentation/views/widgets/change_pic_bottom_sheet.dart';
import 'package:roadapp/features/account/presentation/views/widgets/user_image.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return Column(children: [
      Stack(children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.whiteColor, width: 3),
                shape: BoxShape.circle),
            child: const UserImage(clickable: false)),
        Align(
            alignment: AlignmentDirectional.center,
            child: InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) =>
                      const ChangePicBottomSheet()),
              child: Padding(
                  padding: EdgeInsets.only(
                      right: currentLang == 'ar' ? 0 : 79.h,
                      top: 79.h,
                      left: currentLang == 'ar' ? 78.w : 0),
                  child: Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Transform.scale(
                          scale: 0.55,
                          child: SvgPicture.asset(AppAssets.editIcon)))),
            ))
      ]),
      SizedBox(height: 10.h),
      Text("أحمد جلال الدين",
          style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.tertiary,
              fontWeight: FontWeight.w500))
    ]);
  }
}
