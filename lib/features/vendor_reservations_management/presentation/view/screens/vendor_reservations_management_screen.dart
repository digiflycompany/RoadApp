import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_cubit.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_state.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/view/widgets/vendor_reservations_managemet_person.dart';

class VendorReservationsManagementScreen extends StatefulWidget {
  const VendorReservationsManagementScreen({super.key});

  @override
  State<VendorReservationsManagementScreen> createState() => _VendorReservationsManagementScreenState();
}

class _VendorReservationsManagementScreenState extends State<VendorReservationsManagementScreen> with SingleTickerProviderStateMixin {

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
    var cubit = context.read<ReservationManagementCubit>();
   // cubit.getReservationManagementData(statuses[index].tr(context)); // تحديث البيانات عند تغيير التبويب
  }

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
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(children: [

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
                      cubit.getReservationManagementData('PENDING');
                    }else if(v == 1){
                      setState(() {
                        st = 'RESCHEDULED';
                      });

                      cubit.getReservationManagementData('RESCHEDULED');


                    } else if(v == 2){
                      setState(() {
                        st = 'APPROVED';
                      });

                      cubit.getReservationManagementData('APPROVED');

                    }else{
                      setState(() {
                        st = 'DECLINED';
                      });

                      cubit.getReservationManagementData('DECLINED');

                    }

                  },
                ),
                const SizedBox(height: 15),
                // const ToggleServiceProduct(),
                // SizedBox(height: 20.h),
                // cubit.widgets[cubit.index]

                state is! ReservationManagementLoadingStates
                    ? cubit.reservations!.isNotEmpty
                    ? const VendorReservationManagementsPerson()
                    : const Center(
                      child: Text(
                        'No Reservation',
                        style: TextStyle(
                      fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomLoadingIndicator(
                          width: double.infinity,
                          height: 400,
                        ),
                      )
              ])));
    });
  }
}
