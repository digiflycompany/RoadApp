import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/features/layout/presentation/cubit/app_layout_states.dart';
import 'package:roadapp/features/layout/presentation/cubit/applayout_cubit.dart';

class BottomNavBarComponent extends StatelessWidget {
  const BottomNavBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit, AppLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppLayoutCubit.get(context);
          return ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.r),
                  topRight: Radius.circular(18.r)),
              child: BottomAppBar(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 70.h,
                  color: Colors.black,
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 5,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              cubit.changeBottomNavBar(0);
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.home,
                                      color: Colors.white, size: 25.sp)
                                ])),
                        InkWell(
                            onTap: () {
                              cubit.changeBottomNavBar(1);
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.search,
                                      color: Colors.white, size: 25.sp)
                                ])),
                        SizedBox(width: 5.w),
                        InkWell(
                            onTap: () {
                              cubit.changeBottomNavBar(2);
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.chat,
                                      color: Colors.white, size: 25.sp)
                                ])),
                        InkWell(
                            onTap: () {
                              cubit.changeBottomNavBar(3);
                            },
                            child: const Icon(CupertinoIcons.person_alt, color: AppColors.whiteColor))
                      ])));
        });
  }
}