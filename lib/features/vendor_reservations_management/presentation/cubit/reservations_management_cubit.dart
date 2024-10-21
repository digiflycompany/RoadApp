import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_state.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/view/widgets/vendor_reservations_managemet_center.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/view/widgets/vendor_reservations_managemet_person.dart';

class ReservationManagementCubit extends Cubit<ReservationManagementStates> {
  ReservationManagementCubit() : super(ReservationManagementInitStates());

  int index = 0;

  bool click = true;

  late final widgets = [
    const VendorReservationManagementsCenter(),
    const VendorReservationManagementsPerson(),
  ];

  void changeReservationType(int index, bool click) {
    this.index = index;
    this.click = click;
    emit(ReservationManagementChangeReservationTypeStates());
  }
}