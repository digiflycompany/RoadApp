import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/reserve_appointment/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/features/reserve_appointment/cubit/reserve_appointment_state.dart';
import 'package:roadapp/features/reserve_appointment/views/widgets/tab_toggle.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReserveAppointmentCubit>(
        create: (BuildContext context) => ReserveAppointmentCubit(),
        child: BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
            builder: (BuildContext context, ReserveAppointmentStates state) {
          final cubit = context.read<ReserveAppointmentCubit>();
          return Scaffold(
              appBar: PreferredSize(
                  preferredSize: preferredSize,
                  child: CustomAppBar(
                      text: StringManager.reservationsManagement.tr(context))),
              body: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    SizedBox(height: 20.h),
                    const TabToggle(),
                    SizedBox(height: 20.h),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: FittedBox(child: cubit.widgets[cubit.index]))
                  ])));
        }));
  }
}