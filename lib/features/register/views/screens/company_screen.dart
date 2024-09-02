import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/layout/views/screens/app_layout.dart';
import 'package:roadapp/features/login/views/screens/login_screen.dart';
import 'package:roadapp/features/register/cubit/cubit.dart';
import 'package:roadapp/features/register/cubit/states.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/core/Theming/colors.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      builder: (BuildContext context, state) {
        var cubit = RegisterCubit.get(context);
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      defaultFormField(
                        textController: cubit.companyNameController,
                        // suffix: cubit.nameController.text.isNotEmpty
                        //     ? SvgPicture.asset(AppImages.doneIcon)
                        //     : null,
                        type: TextInputType.name,
                        validate: (String value) {
                        },
                        onSubmit: (value) {},
                        inputAction: TextInputAction.next,
                        hintText: "اسم الشركة",
                        // prefix: Icons.person,
                      ),
                      SizedBox(height: 20.h),
                      defaultFormField(
                        textController: cubit.taxRegistrationNumberController,
                        type: TextInputType.number,
                        validate: (String value) {
                        },
                        onSubmit: (value) {},
                        inputAction: TextInputAction.next,
                        hintText: "رقم السجل الضريبي",
                        // prefix: Icons.email,
                        // suffix: cubit.emailController.text.isNotEmpty
                        //     ? SvgPicture.asset(AppImages.doneIcon)
                        //     : null,
                      ),
                      SizedBox(height: 20.h),
                      defaultFormField(
                        textController: cubit.companyManagerNameController,
                        type: TextInputType.name,
                        validate: (String value) {
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
                        textController: cubit.companyPhoneController,
                        type: TextInputType.phone,
                        validate: (String value) {
                        },
                        onSubmit: (value) {},
                        inputAction: TextInputAction.next,
                        hintText: "تليفون ارضي الشركة",
                        // suffix: cubit.phoneController.text.isNotEmpty
                        //     ? SvgPicture.asset(AppImages.doneIcon)
                        //     : null,
                        // prefix: Icons.phone,
                      ),
                      SizedBox(height: 20.h),
                      defaultFormField(
                        textController: cubit.commercialRegistrationNumberController,
                        type: TextInputType.number,
                        validate: (String value) {
                        },
                        onSubmit: (value) {},
                        inputAction: TextInputAction.next,
                        hintText: "رقم السجل التجاري",
                        // prefix: Icons.email,
                        // suffix: cubit.emailController.text.isNotEmpty
                        //     ? SvgPicture.asset(AppImages.doneIcon)
                        //     : null,
                      ),
                      SizedBox(height: 20.h),
                      defaultFormField(
                        textController: cubit.managerPhoneController,
                        type: TextInputType.phone,
                        validate: (String value) {
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
              textController: cubit.companyEmailController,
              type: TextInputType.emailAddress,
              validate: (String value) {
              },
              onSubmit: (value) {},
              inputAction: TextInputAction.next,
              hintText: "البريد الالكتروني",
              // prefix: Icons.email,
              // suffix: cubit.emailController.text.isNotEmpty
              //     ? SvgPicture.asset(AppImages.doneIcon)
              //     : null,
            ),
            SizedBox(height: 20.h),
            defaultFormField(
              textController: cubit.companyPasswordController,
              isPassword: cubit.visiblePassword,
              type: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changePasswordVisibility();
                  },
                  icon: Icon(cubit.suffix)),
              validate: (String value) {
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
                  // if (cubit.formKey.currentState!.validate()) {
                  //   cubit.formKey.currentState!.save();
                    AppNavigation.navigateOffAll(const AppLayout());
     //             }
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
                  AppNavigation.navigateOffAll(const LoginScreen());

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
            SizedBox(height: 15.h),
          ],
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
