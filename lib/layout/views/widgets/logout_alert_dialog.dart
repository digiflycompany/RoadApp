import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/modules/login/views/screens/login_screen.dart';
import 'package:roadapp/services/navigation/navigation.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/widgets/custom_button.dart';

class LogoutALerDialog extends StatelessWidget {
  const LogoutALerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10.h,),
        SvgPicture.asset(AppImages.alertYellowIcon),
        SizedBox(height: 16.h,),
        Text('لم يتم ارسال اشعارات عند الخروج، هل انت متأكد؟',style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w700
        ),),
        SizedBox(height: 20.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                  onTap: ()=>AppNavigation.navigate(const LoginScreen()),
                  widget: Text(
                    'موافق',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  )),
              CustomElevatedButton(
                  onTap: ()=>Navigator.pop(context),
                  widget: Text(
                    'الغاء',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
