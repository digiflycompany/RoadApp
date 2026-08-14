import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/extensions.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_cubit.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_state.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/view/widgets/reservation_item_widget.dart';

class VendorReservationManagementsPerson extends StatefulWidget {
  const VendorReservationManagementsPerson({super.key});

  @override
  State<VendorReservationManagementsPerson> createState() =>
      _VendorReservationManagementsPersonState();
}

class _VendorReservationManagementsPersonState
    extends State<VendorReservationManagementsPerson> {
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
    var cubit = context.read<ReservationManagementCubit>();
    cubit.getReservationManagementData('PENDING',
        page: cubit.reservationsPage + 1, more: true);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationManagementCubit,
        ReservationManagementStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ReservationManagementCubit.get(context);
        return Expanded(
          child: Column(
            children: [
              cubit.reservations.isNullOrEmpty()
                  ? Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          DateTime? bookingDate =
                              cubit.reservations![index].bookingTime;
                          //final cubit = ReservationManagementCubit.get(context);
                          return ReservationItemWidget(
                            cubit: cubit,
                            bookingDate: bookingDate,
                            index: index,
                            state: state,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                        itemCount: cubit.reservations?.length ?? 0,
                      ),
                    )
                  : const SizedBox(),
              state is MoreLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}