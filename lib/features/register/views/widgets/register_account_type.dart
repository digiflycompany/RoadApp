import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/cach_helper/cache_helper.dart';
import 'package:roadapp/core/cach_helper/cache_vars.dart';
import 'package:roadapp/features/register/cubit/cubit.dart';
import 'package:roadapp/features/register/cubit/states.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class RegisterAccountType extends StatelessWidget {
  const RegisterAccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, RegisterStates state) {},
      builder: (BuildContext context, RegisterStates state) {
        var cubit = RegisterCubit.get(context);
        if(cubit.index==0){
          CacheHelper().saveData(CacheVars.isVendor, false);
        }
        if(cubit.index==1){
          CacheHelper().saveData(CacheVars.isVendor, true);
        }
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
                            },
                            icon: SvgPicture.asset(AppAssets.userIcon),
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
                            icon: SvgPicture.asset(AppAssets.vendorIcon),
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
      },
    );
  }
}
