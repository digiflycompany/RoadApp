import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/reserve_appointment/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/modules/reserve_appointment/cubit/reserve_appointment_state.dart';
import 'package:roadapp/shared/resources/colors.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReserveAppointmentCubit>(
      create: (BuildContext context) => ReserveAppointmentCubit(),
      child: BlocConsumer<ReserveAppointmentCubit, ReserveAppointmentStates>(
        listener: (BuildContext context, ReserveAppointmentStates state) {},
        builder: (BuildContext context, ReserveAppointmentStates state) {
          final cubit = context.read<ReserveAppointmentCubit>();
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
                                    "إدارة مواعيد الخدمات",
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
                                    "إدارة حجز المنتجات",
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
                  FittedBox(child: cubit.widgets[cubit.index])
                ],
              ),
            ),
          );
        },
      ),
    );
  }

// Widget serviceAppointmentManagement() {
//   return DataTable(
//     columnSpacing: 25.w,
//     headingRowColor: MaterialStateProperty.all(Colors.black),
//     columns: [
//       DataColumn(
//           label:
//               Expanded(child: Text(columns1[0], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center,))),
//       DataColumn(
//           label:
//           Expanded(child: Text(columns1[1], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center,))),
//       DataColumn(
//           label:
//           Expanded(child: Text(columns1[2], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center,))),
//       DataColumn(
//           label:
//               Expanded(child: Text(columns1[3], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center))),
//       const DataColumn(
//           label:
//               SizedBox()),
//     ],
//     rows:
//     cells1
//         .map(
//           ((element) {
//             return DataRow(
//                 color: MaterialStateProperty.all(
//                     AppColors.primaryColor.withOpacity(0.27)),
//                 cells: [
//                   DataCell(Center(child: Text(element.vendor))),
//                   DataCell(Center(child: Text(element.operation))),
//                   DataCell(Center(child: Text(element.date))),
//                   DataCell(Center(child: Text(element.time))),
//                   DataCell(Row(
//                     children: [
//                       SizedBox(
//                         width: 30.w,
//                         height: 30.h,
//                         child: Transform.scale(
//                             scale: 0.55,
//                             child: SvgPicture.asset(AppImages.editReservationIcon)),
//                       ),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       SizedBox(
//                         width: 30.w,
//                         height: 30.h,
//                         child: Transform.scale(
//                             scale: 0.55,
//                             child: SvgPicture.asset(AppImages.deleteIcon)),
//                       ),
//                     ],
//                   )),
//                 ],
//               ); } ),
//         ).
//         toList(),
//   );
// }
//
// Widget productsReservationManagement() {
//   return DataTable(
//     columnSpacing: 25,
//     headingRowColor: MaterialStateProperty.all(Colors.black),
//     columns: [
//       DataColumn(
//           label:
//               Expanded(child: Text(columns2[0], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center))),
//       DataColumn(
//           label:
//               Expanded(child: Text(columns2[1], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center))),
//       DataColumn(
//           label:
//               Expanded(child: Text(columns2[2], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center))),
//       DataColumn(
//           label:
//               Expanded(child: Text(columns2[3], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center))),
//       const DataColumn(
//           label:
//           SizedBox()),
//     ],
//     rows: cells2
//         .map(
//           ((element) => DataRow(
//                 color: MaterialStateProperty.all(
//                     AppColors.primaryColor.withOpacity(0.27)),
//                 cells: [
//                   DataCell(Center(child: Text(element.vendor))),
//                   DataCell(Center(child: Text(element.operation))),
//                   DataCell(Center(child: Text(element.date))),
//                   DataCell(Center(child: Text(element.time))),
//                   DataCell(Row(
//                     children: [
//                       SizedBox(
//                         width: 30.w,
//                         height: 30.h,
//                         child: Transform.scale(
//                             scale: 0.55,
//                             child: SvgPicture.asset(AppImages.editReservationIcon)),
//                       ),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       SizedBox(
//                         width: 30.w,
//                         height: 30.h,
//                         child: Transform.scale(
//                             scale: 0.55,
//                             child: SvgPicture.asset(AppImages.deleteIcon)),
//                       ),
//                     ],
//                   )),
//
//                 ],
//               )),
//         )
//         .toList(),
//   );
// }
}
