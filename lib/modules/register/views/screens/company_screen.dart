import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/layout/views/screens/app_layout.dart';
import 'package:roadapp2/modules/login/views/screens/login_screen.dart';
import 'package:roadapp2/modules/register/cubit/cubit.dart';
import 'package:roadapp2/modules/register/cubit/states.dart';
import 'package:roadapp2/services/navigation/navigation.dart';
import 'package:roadapp2/shared/components.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      builder: (BuildContext context, state){
        var cubit = RegisterCubit.get(context);
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      defaultFormField(
                        textController: cubit.nameController,
                        suffix: cubit.nameController.text.isNotEmpty
                            ? SvgPicture.asset(AppImages.doneIcon)
                            : null,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "ادخل الاسم";
                          }
                        },
                        onSubmit: (value) {},
                        inputAction: TextInputAction.next,
                        hintText: "اسم الشركة",
                        // prefix: Icons.person,
                      ),
                      SizedBox(height: 20.h),
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
                        hintText: "رقم السجل الضريبي",
                        // prefix: Icons.email,
                        suffix: cubit.emailController.text.isNotEmpty
                            ? SvgPicture.asset(AppImages.doneIcon)
                            : null,
                      ),
                      SizedBox(height: 20.h),
                      defaultFormField(
                        textController: cubit.passwordController,
                        isPassword: cubit.visiblePassword,
                        type: TextInputType.visiblePassword,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "لا يوجد كلمة مرور";
                          }
                        },
                        hintText: "اسم المسئول عن الشركة",
                        // prefix: Icons.lock,
                      ),
                  //    SizedBox(height: 33.h),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      defaultFormField(
                        textController: cubit.phoneController,
                        type: TextInputType.phone,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "ادخل رقم الهاتف";
                          }
                        },
                        onSubmit: (value) {},
                        inputAction: TextInputAction.next,
                        hintText: "تليفون ارضي الشركة",
                        suffix: cubit.phoneController.text.isNotEmpty
                            ? SvgPicture.asset(AppImages.doneIcon)
                            : null,
                        // prefix: Icons.phone,
                      ),
                      SizedBox(height: 20.h),
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
                        hintText: "رقم السجل التجاري",
                        // prefix: Icons.email,
                        suffix: cubit.emailController.text.isNotEmpty
                            ? SvgPicture.asset(AppImages.doneIcon)
                            : null,
                      ),
                      SizedBox(height: 20.h),
                      defaultFormField(
                        textController: cubit.passwordController,
                        isPassword: cubit.visiblePassword,
                        type: TextInputType.visiblePassword,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "لا يوجد كلمة مرور";
                          }
                        },
                        hintText: "رقم هاتف المسئول",
                        // prefix: Icons.lock,
                      ),
                     // SizedBox(height: 33.h),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
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
              hintText: "البريد الالكتروني",
              // prefix: Icons.email,
              suffix: cubit.emailController.text.isNotEmpty
                  ? SvgPicture.asset(AppImages.doneIcon)
                  : null,
            ),
            SizedBox(height: 20.h),
            defaultFormField(
              textController: cubit.passwordController,
              isPassword: cubit.visiblePassword,
              type: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    cubit.visiblePassword = !cubit.visiblePassword;
                  },
                  icon: Icon(cubit.visiblePassword
                      ? Icons.visibility_off
                      : Icons.visibility)),
              validate: (String value) {
                if (value.isEmpty) {
                  return "لا يوجد كلمة مرور";
                }
              },
              hintText: "كلمة المرور",
              // prefix: Icons.lock,
            ),
            SizedBox(height: 33.h),
            SizedBox(
              width: 202.w,
              height: 47.h,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    AppColors.primaryColor,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r))),
                ),
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.formKey.currentState!.save();
                    AppNavigation.navigateOffAll(const AppLayout());
                  }
                },
                child: Text("انشاء حساب",
                    style: TextStyle(
                        color: AppColors.secondColor, fontSize: 11.sp)),
              ),
            ),
            SizedBox(height: 9.h),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "لديك حساب بالفعل؟",
                style:
                TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
              ),
              TextButton(
                onPressed: () {
                  AppNavigation.navigate(const LoginScreen());
                },
                child: Text(
                  "تسجيل دخول",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              )
            ]),
          ],
        );
      },
      listener: (BuildContext context, state) {  },
    );
  }
}
