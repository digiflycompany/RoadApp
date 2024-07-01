import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/vendor_reservations_management/cubit/reservations_management_cubit.dart';
import 'package:roadapp/modules/vendor_reservations_management/cubit/reservations_management_state.dart';
import 'package:roadapp/shared/resources/colors.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';

class VendorReservationsManagementScreen extends StatelessWidget {
  const VendorReservationsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReservationManagementCubit>(
      create: (BuildContext context) => ReservationManagementCubit(),
      child:
          BlocConsumer<ReservationManagementCubit, ReservationManagementStates>(
        listener: (BuildContext context, ReservationManagementStates state) {},
        builder: (BuildContext context, ReservationManagementStates state) {
          final cubit = context.read<ReservationManagementCubit>();
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: preferredSize,
                child: const CustomAppBar(text: 'إدارة الحجوزات')),
            body: Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 2),
                            color: Color(0xFFD7D7D7),
                          )
                        ]),
                    child: Row(
                      children: [
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
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "مركز اخر",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.secondColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ),
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
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "متلقي خدمة",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.secondColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  cubit.widgets[cubit.index],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
