import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp2/modules/reset%20password/cubit/cubit.dart';
import 'package:roadapp2/shared/components.dart';
import 'package:roadapp2/shared/const/app_images.dart';

import '../../shared/resources/colors.dart';
import 'cubit/state.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
        builder: (BuildContext context, ResetPasswordStates state) {
          var cubit = ResetPasswordCubit.get(context);
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
                          "اعادة ضبط كلمة المرور",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          //  AppLocalizations.of(context)!.language1,
                          "من فضلك دخل كلمة مرور جديدة",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        defaultFormField(
                          textController: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String value) {},
                          isPassword: cubit.visiblePassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changePasswordVisibility();
                              },
                              icon: Icon(cubit.suffix)),
                          hintText: "كلمة المرور",
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        defaultFormField(
                          textController: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String value) {},
                          isPassword: cubit.visiblePassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changePasswordVisibility();
                              },
                              icon: Icon(cubit.suffix)),
                          hintText: "تاكيد كلمة المرور",
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        SizedBox(
                          width: 202.w,
                          height: 47.h,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                AppColors.primaryColor,
                              ),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.r))),
                            ),
                            onPressed: () {},
                            child: Text("انتهاء",
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
        },
        listener: (BuildContext context, ResetPasswordStates state) {},
      ),
    );
  }
}
