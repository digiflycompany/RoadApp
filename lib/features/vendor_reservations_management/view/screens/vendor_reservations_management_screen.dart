import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/vendor_reservations_management/cubit/reservations_management_cubit.dart';
import 'package:roadapp/features/vendor_reservations_management/cubit/reservations_management_state.dart';
import 'package:roadapp/core/Theming/colors.dart';

class VendorReservationsManagementScreen extends StatelessWidget {
  const VendorReservationsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReservationManagementCubit>(
        create: (BuildContext context) => ReservationManagementCubit(),
        child: BlocBuilder<ReservationManagementCubit,
                ReservationManagementStates>(
            builder: (BuildContext context, ReservationManagementStates state) {
          final cubit = context.read<ReservationManagementCubit>();
          return Scaffold(
              appBar: PreferredSize(
                  preferredSize: preferredSize,
                  child: CustomAppBar(
                      text: StringManager.reservationsManagement.tr(context))),
              body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(children: [
                    const SizedBox(height: 15),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 3.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                  color: Color(0xFFD7D7D7))
                            ]),
                        child: Row(children: [
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
                                          borderRadius:
                                              BorderRadius.circular(7.r)),
                                      child: Center(
                                          child: Text(
                                              StringManager.otherCenter
                                                  .tr(context),
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: AppColors.secondColor,
                                                  fontWeight:
                                                      FontWeight.bold)))))),
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
                                          borderRadius:
                                              BorderRadius.circular(7.r)),
                                      child: Center(
                                          child: Text(
                                              StringManager.serviceUser
                                                  .tr(context),
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: AppColors.secondColor,
                                                  fontWeight:
                                                      FontWeight.bold))))))
                        ])),
                    SizedBox(height: 20.h),
                    cubit.widgets[cubit.index]
                  ])));
        }));
  }
}