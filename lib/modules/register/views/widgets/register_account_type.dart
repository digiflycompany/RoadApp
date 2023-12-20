import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/modules/register/cubit/cubit.dart';
import 'package:roadapp2/modules/register/cubit/states.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class RegisterAccountType extends StatelessWidget {
  const RegisterAccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, RegisterStates state) {},
      builder: (BuildContext context, RegisterStates state) {
        var cubit = RegisterCubit.get(context);
        return Column(
          children: [
            Container(
              height: 40.h,
              width: 100.w,
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
                        },
                        icon: SvgPicture.asset(AppImages.vendorIcon),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
              width: 120.w,
              child: Row(
                children: [
                  Text("متلقي الخدمة",
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text("مقدم الخدمة",
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
