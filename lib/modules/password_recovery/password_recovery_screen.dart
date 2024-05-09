import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp2/shared/components.dart';
import 'package:roadapp2/shared/const/app_images.dart';

import '../../shared/resources/colors.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();

    return Scaffold(
      // backgroundColor: Colors.grey[400],
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AppImages.roadBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Container(
              color: AppColors.tertiary,
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              // height: MediaQuery.of(context).size.height*0.80,
              width: MediaQuery.of(context).size.width * 0.80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                      width: 110.w,
                      height: 110.h,
                      child: Image.asset(AppImages.appIcon)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'طريقك أمان',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    //  AppLocalizations.of(context)!.language1,
                    "استرجاع كلمة المرور",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    //  AppLocalizations.of(context)!.language1,
                    "برجاء ادخال رقم الهاتف المسجل لإعادة ضبط كلمة المرور",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  defaultFormField(
                      textController: phoneController,
                      type: TextInputType.phone,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return "Please enter your Phone Number";
                        }
                      },
                      onSubmit: (value) {},
                      inputAction: TextInputAction.next,
                      hintText: "رقم الهاتف",
                      prefix: Icons.phone),
                  SizedBox(
                    height: 20.h,
                  ),
                  defaultFormField(
                      textController: phoneController,
                      type: TextInputType.phone,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return "Please enter your Phone Number";
                        }
                      },
                      onSubmit: (value) {},
                      inputAction: TextInputAction.next,
                      hintText: "البريد الالكتروني",
                      prefix: Icons.email),
                  SizedBox(
                    height: 46.h,
                  ),
                  SizedBox(
                    width: 202.w,
                    height: 47.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          AppColors.primaryColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r))),
                      ),
                      onPressed: () {},
                      child: Text("ارسال",
                          style: TextStyle(
                              color: AppColors.secondColor, fontSize: 11.sp)),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
