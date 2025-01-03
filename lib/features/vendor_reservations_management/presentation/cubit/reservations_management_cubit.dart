// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/vendor_reservations_management/data/models/reservation_managment_model.dart';
import 'package:roadapp/features/vendor_reservations_management/data/repos/reservation_managment_repo.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_state.dart';

class ReservationManagementCubit extends Cubit<ReservationManagementStates> {
  ReservationManagementCubit(this._managementRepo)
      : super(ReservationManagementInitialStates());

  final ReservationManagementRepo _managementRepo;
  static ReservationManagementCubit get(context) => BlocProvider.of(context);

  int index = 0;
  bool click = true;

  void changeReservationType(int index, bool click) {
    this.index = index;
    this.click = click;
    emit(ReservationManagementChangeReservationTypeStates());
  }

  ///---------------------------------------
  /// Method to get reservation data
  List<Booking>? reservations;
  List<Service>? service;
  int reservationsPage = 1;

  Future<void> getReservationManagementData(
      {int page = 1, int limit = 35, bool? more}) async {
    // emit(ReservationManagementLoadingStates());  // Show loading state

    if (more == true) {
      emit(MoreLoadingState());
    } else {
      emit(ReservationManagementLoadingStates());
    }

    final response =
        await _managementRepo.getBookingData(page: page, limit: limit);

    response.when(success: (reservationsResponse) {
      if (more != true) {
        reservations = (reservationsResponse.data?.bookings ?? []);
        reservationsPage = 1;
      } else {
        reservations?.addAll(reservationsResponse.data?.bookings ?? []);
        reservationsPage++;
      }
      emit(ReservationManagementSuccessStates(reservations));
    }, failure: (error) {
      emit(ReservationManagementErrorStates(
          error: error.apiErrorModel.message ?? 'Unknown Error!'));
      print(
          "Error fetching data: $error"); // Optionally log the error for debugging
    });
  }

  ///---------------------APPROVE BOOKING---------------------///
  Map<String, bool> loadingApprovedBooking = {};
  approveBooking({required String id}) async {
    loadingApprovedBooking[id] = true;
    emit(ApproveBookingLoadingStates());

    final response = await _managementRepo.approveBooking(id: id);

    response.when(success: (bookingApproved) async {
      loadingApprovedBooking.remove(id);
      await getReservationManagementData();
      emit(ApproveBookingSuccessStates());
    }, failure: (error) {
      loadingApprovedBooking.remove(id);
      emit(
        ApproveBookingErrorStates(
            error: error.apiErrorModel.message ?? 'Unknown Error!'),
      );
    });
  }

  ///---------------------DECLINE BOOKING---------------------///
  Map<String, bool> loadingDeclinedBooking = {};
  declineBooking({required String id}) async {
    loadingDeclinedBooking[id] = true;
    emit(DeclineBookingLoadingStates());

    final response = await _managementRepo.declineBooking(id: id);

    response.when(success: (bookingDeclined) async {
      loadingDeclinedBooking.remove(id);
      await getReservationManagementData();
      emit(DeclineBookingSuccessStates());
    }, failure: (error) {
      emit(DeclineBookingErrorStates(
          error: error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}
