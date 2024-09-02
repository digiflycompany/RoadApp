import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:roadapp/modules/reset%20password/reset_password_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.roadBackground,
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
                      child: Image.asset(AppAssets.appIcon)),
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
                    "اكتب رمز التأكيد",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    //  AppLocalizations.of(context)!.language1,
                    "من فضلك ادخل الرمز المكون من 4 أرقام المرسل على رقم الهاتف المسجل",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Row(
                    children: [Text("رمز التأكيد")],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      length: 4,
                      keyboardType: TextInputType.number,
                      defaultPinTheme: const PinTheme(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1)))),
                      focusedPinTheme: const PinTheme(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1)))),
                      textInputAction: TextInputAction.next,
                      showCursor: true,
                      onCompleted: null,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "لم يتم استلام الرمز؟",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "إعادة ارسال الرمز",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    )
                  ]),
                  SizedBox(height: 9.h),
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
                      onPressed: () {
                        AppNavigation.navigate(const ResetPasswordScreen());
                      },
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
