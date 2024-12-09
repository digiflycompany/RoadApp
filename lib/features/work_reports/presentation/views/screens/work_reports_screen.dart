import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/process_type.dart';
import 'package:roadapp/features/reserve_appointment/data/repos/reservations_repo.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_state.dart';
import 'package:roadapp/features/work_reports/presentation/views/widgets/maintenance_bill.dart';
import '../widgets/date_widget.dart';

class WorkReportsScreen extends StatefulWidget {
  const WorkReportsScreen({super.key});

  @override
  State<WorkReportsScreen> createState() => _WorkReportsScreenState();
}

class _WorkReportsScreenState extends State<WorkReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReserveAppointmentCubit(getIt.get<ReservationsRepo>()),
      child: BlocConsumer<ReserveAppointmentCubit, ReserveAppointmentStates>(
        listener: (BuildContext context, ReserveAppointmentStates state) {},
        builder: (BuildContext context, ReserveAppointmentStates state) {
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: preferredSize,
                child:
                    CustomAppBar(text: StringManager.workReports.tr(context))),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  //const ToggleBox(),
                  SizedBox(height: 20.h),
                  const ProcessDateStartAndEnd(),
                  SizedBox(height: 10.h),
                  const ProcessType(bonds: false),
                  SizedBox(height: 16.h),
                  const MaintenanceBill()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
