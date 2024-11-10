import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_state.dart';

class ServiceAppointmentManagement extends StatefulWidget {
  const ServiceAppointmentManagement({super.key, required this.cells1});
  final List<List<String>> cells1;

  @override
  State<ServiceAppointmentManagement> createState() => _ServiceAppointmentManagementState();
}

class _ServiceAppointmentManagementState extends State<ServiceAppointmentManagement> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    }
  }

  void _loadMoreData() {
    var cubit = context.read<ReserveAppointmentCubit>();
    cubit.fetchReservations(page: cubit.reservationsPage + 1, more: true);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final columns1 = [
      StringManager.centerName.tr(context),
      StringManager.procedureType.tr(context),
      StringManager.date.tr(context),
      StringManager.time.tr(context)
    ];

    return SingleChildScrollView(
      controller: scrollController,
      child: BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
  builder: (context, state) {
    return Column(
        children: [
          CustomMultiRowsTable(
              columns: columns1,
              rows: widget.cells1,
              withEditIcon: true,
              withDeleteIcon: true),
          if(state is MoreLoadingState) CustomLoadingIndicator(height: 40.h)
        ]
      );
  },
)
    );
  }
}