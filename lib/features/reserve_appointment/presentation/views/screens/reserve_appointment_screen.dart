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
import 'package:roadapp/features/reserve_appointment/presentation/views/widgets/service_appointment_management.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? st ;
  final List<String> statuses = [
    StringManager.pending,
    StringManager.rescheduled,
    StringManager.completed,
    StringManager.declined,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: statuses.length, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {}); // يجبر الواجهة على إعادة البناء
        _fetchDataForTab(_tabController.index);
      }
    });
  }

  void _fetchDataForTab(int index) {
    var cubit = context.read<ReserveAppointmentCubit>();
    cubit.fetchReservations(statuses[index]); // تحديث البيانات عند تغيير التبويب
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReserveAppointmentCubit(getIt.get<ReservationsRepo>(), context)
        ..fetchReservations(st ?? 'PENDING'),
      child: BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
        builder: (context, state) {
          var cubit = context.read<ReserveAppointmentCubit>();

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: preferredSize,
              child: CustomAppBar(text: StringManager.reservationsManagement.tr(context)),
            ),
            body: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.orange,
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.orange,
                  padding: const EdgeInsets.all(2),
                  // labelStyle: const TextStyle(
                  //   fontSize: 12,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  tabs: statuses.map((status) => Tab(text: status.tr(context))).toList(),
                  onTap: (v){
                    if(v==0){
                      setState(() {
                        st = 'PENDING';
                      });
                      cubit.fetchReservations('PENDING');
                    }else if(v == 1){
                      setState(() {
                        st = 'RESCHEDULED';
                      });

                      cubit.fetchReservations('RESCHEDULED');


                    } else if(v == 2){
                      setState(() {
                        st = 'APPROVED';
                      });

                      cubit.fetchReservations('APPROVED');

                    }else{
                      setState(() {
                        st = 'DECLINED';
                      });

                      cubit.fetchReservations('DECLINED');

                    }

                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: state is FetchingReservationsLoadingState
                        ? const Center(child: CustomLoadingIndicator(width: double.infinity, height: 600))
                        : state is ReservationsErrorState
                        ? Center(child: Text(state.errorMessage))
                        : cubit.bookings != null && cubit.bookings!.isNotEmpty
                        ? ServiceAppointmentManagement(
                      status: st ?? 'PENDING',
                      cells1: cubit.bookings!.map(cubit.convertBookingToListOfStrings).toList(),
                    )
                        : Center(child: Text(StringManager.youHaveNoReservationsYet.tr(context))),
                  ),
                ),

                if (state is MoreLoadingState) CustomLoadingIndicator(height: 40.h)

              ],
            ),
          );
        },
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:roadapp/core/dependency_injection/di.dart';
// import 'package:roadapp/core/helpers/localization/app_localization.dart';
// import 'package:roadapp/core/helpers/string_manager.dart';
// import 'package:roadapp/core/widgets/custom_appbar.dart';
// import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
// import 'package:roadapp/features/reserve_appointment/data/repos/reservations_repo.dart';
// import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_cubit.dart';
// import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_state.dart';
// import 'package:roadapp/features/reserve_appointment/presentation/views/widgets/reservations_shimmer.dart';
// import 'package:roadapp/features/reserve_appointment/presentation/views/widgets/service_appointment_management.dart';
//
// class AppointmentScreen extends StatelessWidget {
//   const AppointmentScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ReserveAppointmentCubit>(
//       create: (BuildContext context) =>
//           ReserveAppointmentCubit(getIt.get<ReservationsRepo>(),context)
//             ..fetchReservations('PENDING'),
//       child: BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
//         builder: (BuildContext context, ReserveAppointmentStates state) {
//           final cubit = context.read<ReserveAppointmentCubit>();
//           return Scaffold(
//             appBar: PreferredSize(
//                 preferredSize: preferredSize,
//                 child: CustomAppBar(
//                     text: StringManager.reservationsManagement.tr(context))),
//             body: Padding(
//               padding: const EdgeInsets.all(10),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 20.h),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: state is FetchingReservationsLoadingState
//                           ? const SingleChildScrollView(
//                               child: CustomLoadingIndicator(
//                                 width: double.infinity,
//                                 height: 600,
//                               ),
//                             )
//                           : state is ReservationsErrorState
//                               ? Center(
//                                   child: Text(state.errorMessage),
//                                 )
//                               : state is ReservationsSuccessState &&
//                                       cubit.bookings != null &&
//                                       cubit.bookings!.isNotEmpty
//                                   ? SingleChildScrollView(
//                                       child: ServiceAppointmentManagement(
//                                           cells1: cubit.bookings!.map(
//                                         (booking) {
//                                           return cubit
//                                               .convertBookingToListOfStrings(
//                                                   booking);
//                                         },
//                                       ).toList(),
//                                       ),
//                                     )
//                                   : Center(
//                                       child: Text(
//                                         StringManager.youHaveNoReservationsYet
//                                             .tr(context),
//                                       ),
//                                     ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
