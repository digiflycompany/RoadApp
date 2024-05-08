import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/modules/account/views/widgets/account_text_field.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 76.h),
        child: const CustomAppBar(text: 'اعدادات الحساب'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h,),
            Center(
              child: Container(
                width: 110.w,
                height: 110.h,
                decoration:const BoxDecoration(
                  color: AppColors.emptyImageColor,
                  shape: BoxShape.circle
                ),
                child: Center(child: SvgPicture.asset(AppImages.emptyImageIcon,)),
              ),
            ),
            SizedBox(height: 32.h,),
            const AccountTextField(text: 'الاسم',),
            const AccountTextField(text: 'رقم الهاتف',),
            const AccountTextField(text: 'البريد الإلكتروني',),
            const AccountTextField(text: 'كلمة المرور',),
          ],
        ),
      ),
    );
  }
}
