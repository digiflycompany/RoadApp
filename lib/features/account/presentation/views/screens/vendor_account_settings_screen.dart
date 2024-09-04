import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_elevated_button_two.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_text_field.dart';
import 'package:roadapp/features/account/presentation/views/widgets/vendor_upload_profile_image.dart';

class VendorAccountSettingsScreen extends StatelessWidget {
  const VendorAccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 76.h),
          child: const CustomAppBar(text: 'الملف الشخصي'),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const VendorUploadImageProfile(),
                      Row(
                        children: [
                          AccountTextField(
                            text: 'اسم المركز',
                            width: 150.w,
                            textColor: AppColors.greyColor5,
                          ),
                          const Spacer(),
                          AccountTextField(
                            text: 'رقم الجوال',
                            width: 150.w,
                            textColor: AppColors.greyColor5,
                            inputType: TextInputType.number,
                          ),
                        ],
                      ),
                      const AccountTextField(
                        text: 'الرقم الثابت',
                        textColor: AppColors.greyColor5,
                        inputType: TextInputType.number,
                      ),
                      const AccountTextField(
                        text: 'العنوان',
                        textColor: AppColors.greyColor5,
                      ),
                      Row(children: [
                        AccountTextField(
                            text: 'الخدمة',
                            width: 150.w,
                            textColor: AppColors.greyColor5),
                        const Spacer(),
                        AccountTextField(
                            text: 'السعر',
                            width: 150.w,
                            textColor: AppColors.greyColor5,
                            inputType: TextInputType.number)
                      ]),
                      Row(children: [
                        AccountTextField(
                            text: 'الخدمة',
                            width: 150.w,
                            textColor: AppColors.greyColor5),
                        const Spacer(),
                        AccountTextField(
                            text: 'السعر',
                            width: 150.w,
                            textColor: AppColors.greyColor5,
                            inputType: TextInputType.number)
                      ]),
                      Row(children: [
                        AccountTextField(
                            text: 'الخدمة',
                            width: 150.w,
                            textColor: AppColors.greyColor5),
                        const Spacer(),
                        AccountTextField(
                            text: 'السعر',
                            width: 150.w,
                            textColor: AppColors.greyColor5,
                            inputType: TextInputType.number)
                      ]),
                      CustomElevatedButtonTwo(
                          width: 200.w,
                          height: 60.h,
                          onTap: () {},
                          widget: Text('حفظ',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600))),
                      SizedBox(height: 40.h)
                    ]))));
  }
}