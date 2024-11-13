import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_state.dart';

class TabToggle extends StatelessWidget {
  const TabToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0, 2),
                  color: Color(0xFFD7D7D7))
            ]),
        child: BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
            builder: (context, state) {
          var cubit = ReserveAppointmentCubit.get(context);
          return Row(children: [
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      cubit.changeReservationType(0, true);
                    },
                    child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: cubit.click
                                ? AppColors.primaryColor
                                : AppColors.tertiary,
                            borderRadius: BorderRadius.circular(7.r)),
                        child: Center(
                            child: Text(
                                StringManager.serviceAppointmentManagement
                                    .tr(context),
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.secondColor,
                                    fontWeight: FontWeight.bold)))))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      cubit.changeReservationType(1, false);
                    },
                    child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: cubit.click
                                ? AppColors.tertiary
                                : AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(7.r)),
                        child: Center(
                            child: Text(
                                StringManager.productsReservationManagement
                                    .tr(context),
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.secondColor,
                                    fontWeight: FontWeight.bold))))))
          ]);
        }));
  }
}