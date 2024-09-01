import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/modules/password_recovery/cubit/password_recovery_cubit.dart';
import 'package:roadapp/modules/password_recovery/cubit/password_recovery_states.dart';
import 'package:roadapp/modules/verification/verification_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/shared/components.dart';
import 'package:roadapp/core/utils/app_assets.dart';

import 'package:roadapp/core/Theming/colors.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return BlocProvider<PasswordRecoveryCubit>(
      create: (BuildContext context) => PasswordRecoveryCubit(),
      child: BlocConsumer<PasswordRecoveryCubit,PasswordRecoveryStates>(
        listener: (BuildContext context, PasswordRecoveryStates state) {  },
        builder: (BuildContext context, PasswordRecoveryStates state) {
          final cubit = context.read<PasswordRecoveryCubit>();
          return Scaffold(
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
                            textController: cubit.phoneController,
                            type: TextInputType.phone,
                            validate: (String value) {},
                            onSubmit: (value) {},
                            inputAction: TextInputAction.next,
                            hintText: "رقم الهاتف",
                            prefix: Icons.phone),
                        SizedBox(
                          height: 20.h,
                        ),
                        defaultFormField(
                          textController: cubit.emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "ادخل البريد الإلكتروني";
                            }
                          },
                          onSubmit: (value) {},
                          inputAction: TextInputAction.next,
                          hintText: "البريد الإلكتروني",
                          prefix: Icons.email,
                          // suffix: cubit.emailController.text.isNotEmpty
                          //     ? SvgPicture.asset(AppImages.doneIcon)
                          //     : null,
                        ),
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
                            onPressed: () {
                              AppNavigation.navigate(const VerificationScreen());
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
        },
      ),
    );
  }
}
