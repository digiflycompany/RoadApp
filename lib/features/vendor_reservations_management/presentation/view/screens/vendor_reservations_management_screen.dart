import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_cubit.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_state.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/view/widgets/vendor_reservations_managemet_person.dart';

class VendorReservationsManagementScreen extends StatelessWidget {
  const VendorReservationsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationManagementCubit, ReservationManagementStates>(
        builder: (BuildContext context, ReservationManagementStates state) {
      final cubit = context.read<ReservationManagementCubit>();
      return Scaffold(
          appBar: PreferredSize(
              preferredSize: preferredSize,
              child: CustomAppBar(
                  text: StringManager.reservationsManagement.tr(context))),
          body:  const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(children: [
                SizedBox(height: 15),
                // const ToggleServiceProduct(),
                // SizedBox(height: 20.h),
                // cubit.widgets[cubit.index]
                VendorReservationManagementsPerson(),
              ])));
    });
  }
}
