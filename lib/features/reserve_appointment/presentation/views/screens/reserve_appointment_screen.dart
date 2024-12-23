import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/reserve_appointment/data/repos/reservations_repo.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_state.dart';
import 'package:roadapp/features/reserve_appointment/presentation/views/widgets/reservations_shimmer.dart';
import 'package:roadapp/features/reserve_appointment/presentation/views/widgets/service_appointment_management.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReserveAppointmentCubit>(
        create: (BuildContext context) =>
        ReserveAppointmentCubit(getIt.get<ReservationsRepo>())
          ..fetchReservations(),
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
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(height: 20.h),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: state is FetchingReservationsLoadingState
                                  ? const SingleChildScrollView(child: CustomLoadingIndicator(width: double.infinity,height: 600,))
                                  : state is ReservationsErrorState
                                  ? Center(
                                child: Text(state.errorMessage),
                              )
                                  : state is ReservationsSuccessState && cubit.bookings != null && cubit.bookings!.isNotEmpty
                                  ? SingleChildScrollView(
                                    child: ServiceAppointmentManagement(
                                        cells1:
                                        cubit.bookings!.map((booking) {
                                          return cubit
                                              .convertBookingToListOfStrings(
                                              booking);
                                        }).toList()),
                                  )
                                  : Center(
                                child: Text(StringManager.youHaveNoReservationsYet.tr(context))
                              ))
                        ]),
                      )));
            }));
  }
}