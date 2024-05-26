import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/modules/login/cubit/cubit.dart';
import 'package:roadapp/modules/login/cubit/states.dart';
import 'package:roadapp/services/shared_preferences/preferences_helper.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/resources/colors.dart';

class LoginAccountType extends StatelessWidget {
  const LoginAccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 14.h),
                          height: 40.h,
                          width: 65.w,
                          child: const FittedBox(
                            child: Text(
                              "طبيعة الحساب",
                              //  style: TextStyle(fontSize: 9.sp),
                            ),
                          )),
                    ],
                  ),
                  Container(
                    height: 40.h,
                    width: 100.w,
                    margin: EdgeInsets.only(top: 14.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            if (cubit.index == 0)
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                width: 30,
                                height: 30,
                              ),
                            IconButton(
                              onPressed: () {
                                cubit.changeRegisterIndex(0);
                                PreferencesHelper.saveIsVendor(isVendor: false);
                              },
                              icon: SvgPicture.asset(AppImages.userIcon),
                              color: AppColors.tertiary,
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            if (cubit.index == 1)
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                width: 30,
                                height: 30,
                              ),
                            IconButton(
                              onPressed: () {
                                cubit.changeRegisterIndex(1);
                                PreferencesHelper.saveIsVendor(isVendor: true);
                              },
                              icon: SvgPicture.asset(AppImages.vendorIcon),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
                width: 130.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (cubit.index == 0)
                      Text("متلقي الخدمة",
                          style: TextStyle(
                              fontSize: 9.sp, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    if (cubit.index == 1)
                      Text("مقدم الخدمة",
                          style: TextStyle(
                              fontSize: 9.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
