import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp2/layout/views/screens/app_layout.dart';
import 'package:roadapp2/shared/const/app_images.dart';

import '../../services/navigation/navigation.dart';
import '../../shared/resources/colors.dart';

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
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    //  AppLocalizations.of(context)!.language1,
                    "اكتب رمز التأكيد",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold),
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
                    height: 33.h,
                  ),
                  // Pinput(
                  //   length: 6,
                  //   keyboardType: TextInputType.number,
                  //   controller: pinController,
                  //   defaultPinTheme: defaultPinTheme,
                  //   focusedPinTheme: focusedPinTheme,
                  //   submittedPinTheme: submittedPinTheme,
                  //   pinputAutovalidateMode: null,
                  //   textInputAction: TextInputAction.next,
                  //   showCursor: true,
                  //   validator: (s) {
                  //     print('validating code: $s');
                  //   },
                  //   onCompleted: null,
                  // ),
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
                                    borderRadius:
                                        BorderRadius.circular(15.r))),
                      ),
                      onPressed: () {
                        AppNavigation.navigateOffAll(const AppLayout());
                      },
                      child: Text("ارسال",
                          style: TextStyle(
                              color: AppColors.secondColor,
                              fontSize: 11.sp)),
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
