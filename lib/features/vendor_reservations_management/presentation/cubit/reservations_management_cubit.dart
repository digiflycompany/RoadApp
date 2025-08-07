
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/vendor_reservations_management/data/models/reservation_managment_model.dart';
import 'package:roadapp/features/vendor_reservations_management/data/repos/reservation_managment_repo.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_state.dart';

import '../../data/models/update_booking_request.dart';


class ReservationManagementCubit extends Cubit<ReservationManagementStates> {
  ReservationManagementCubit(this._managementRepo) : super(ReservationManagementInitialStates());

  final ReservationManagementRepo _managementRepo;
  static ReservationManagementCubit get(context) => BlocProvider.of(context);

  int index = 0;
  bool click = true;
  List<Booking>? reservations;
  int reservationsPage = 1;

  // خريطة لحالات اللود لكل زر
  Map<String, bool> loadingApproveMap = {};
  Map<String, bool> loadingDeclineMap = {};
  Map<String, bool> loadingUpdateMap = {};
  Map<String, bool> loadingCompletedMap = {};

  void changeReservationType(int index, bool click) {
    this.index = index;
    this.click = click;
    emit(ReservationManagementChangeReservationTypeStates());
  }

  DateTime dateTime = DateTime.now();

  void pickupDate(BuildContext context, String id) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2050),
      builder: (_, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 12.sp)),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value != null) {
        dateTime = DateTime(
          value.year,
          value.month,
          value.day,
          dateTime.hour,
          dateTime.minute,
        );
        updateBookingProvider(id: id);
      }
    });
  }

  ///----------------- جلب البيانات -----------------
  Future<void> getReservationManagementData(String status,{int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      emit(MoreLoadingState());
    } else {
      emit(ReservationManagementLoadingStates());
    }

    final response = await _managementRepo.getBookingData(
      page: page,
      limit: limit,
      status: status,
    );

    response.when(success: (reservationsResponse) {
      if (more != true) {
        reservations = reservationsResponse.data?.bookings ?? [];
        reservationsPage = 1;
      } else {
        reservations?.addAll(reservationsResponse.data?.bookings ?? []);
        reservationsPage++;
      }
      emit(ReservationManagementSuccessStates(reservations));
    }, failure: (error) {
      emit(ReservationManagementErrorStates(error: error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  ///----------------- قبول الحجز -----------------
  void approveBooking({required String id}) async {
    _setLoading(loadingApproveMap, id, true);
    final response = await _managementRepo.approveBooking(id: id);

    response.when(success: (bookingApproved) async {
      await getReservationManagementData('PENDING');
    }, failure: (error) {
      emit(ApproveBookingErrorStates(error: error.apiErrorModel.message ?? 'Unknown Error!'));
    });

    _setLoading(loadingApproveMap, id, false);
  }

  ///----------------- complete -----------------
  void completeBooking({required String id}) async {
    _setLoading(loadingCompletedMap, id, true);
    final response = await _managementRepo.completeBooking(id: id);

    response.when(success: (bookingCompeted) async {
      await getReservationManagementData('APPROVED');
    }, failure: (error) {
      emit(ApproveBookingErrorStates(error: error.apiErrorModel.message ?? 'Unknown Error!'));
    });

    _setLoading(loadingCompletedMap, id, false);
  }

  ///----------------- رفض الحجز -----------------
  void declineBooking({required String id}) async {
    _setLoading(loadingDeclineMap, id, true);
    final response = await _managementRepo.declineBooking(id: id);

    response.when(success: (bookingDeclined) async {
      await getReservationManagementData('PENDING');
    }, failure: (error) {
      emit(DeclineBookingErrorStates(error: error.apiErrorModel.message ?? 'Unknown Error!'));
    });

    _setLoading(loadingDeclineMap, id, false);
  }

  ///----------------- تحديث الحجز -----------------
  void updateBookingProvider({required String id}) async {
    _setLoading(loadingUpdateMap, id, true);
    final response = await _managementRepo.updateBookingProvider(
      id: id,
      body: UpdateBookingProviderRequest(bookingTime: dateTime),
    );

    response.when(success: (bookingUpdated) async {
      await getReservationManagementData('PENDING');
    }, failure: (error) {
      emit(UpdateBookingErrorStates(error: error.apiErrorModel.message ?? 'Unknown Error!'));
    });

    _setLoading(loadingUpdateMap, id, false);
  }

  ///----------------- إدارة اللود لكل زر -----------------
  void _setLoading(Map<String, bool> loadingMap, String id, bool isLoading) {
    loadingMap[id] = isLoading;
    emit(ReservationManagementChangeReservationTypeStates());
  }
}
