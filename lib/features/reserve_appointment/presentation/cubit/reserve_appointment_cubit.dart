import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:roadapp/features/reserve_appointment/data/models/reservations_response.dart';
import 'package:roadapp/features/reserve_appointment/data/models/update_booking_request.dart';
import 'package:roadapp/features/reserve_appointment/data/repos/reservations_repo.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_state.dart';

class ReserveAppointmentCubit extends Cubit<ReserveAppointmentStates> {
  ReserveAppointmentCubit(this._repo, this.context) : super(ReserveAppointmentInitStates());
  final ReservationsRepo _repo;
  static ReserveAppointmentCubit get(context) => BlocProvider.of(context);


  final BuildContext context;
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  void pickupDate() {
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
        // Update the date portion of dateTime
        dateTime = DateTime(value.year, value.month, value.day, dateTime.hour, dateTime.minute);
      }
      emit(UpdateDate());
    });
  }

  void pickupTime() {
    showTimePicker(
      context: context,
      initialTime: timeOfDay,
    ).then((value) {
      if (value != null) {
        timeOfDay = value;
        // Update the time portion of dateTime
        dateTime = DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          timeOfDay.hour,
          timeOfDay.minute,
        );
      }
      emit(UpdateDate());
    });
  }



  final List<List<String>> cells1 = [];

  List<Booking>? bookings;

  int index = 0, reservationsPage = 1;

  bool click = true;

  void changeReservationType(int index, bool click) {
    this.index = index;
    this.click = click;
    emit(ReserveAppointmentChangeReservationTypeStates());
  }

  void fetchReservations({int page = 1, int limit = 35, bool? more}) async {
    more == true? emit(MoreLoadingState()):emit(FetchingReservationsLoadingState());
    final response = await _repo.fetchReservations(page: page, limit: limit);
    response.when(success: (reservationsResponse) async {


      if (more != true) {
        bookings = reservationsResponse.data?.bookings;
        reservationsPage = 1;
      } else {
        bookings?.addAll(reservationsResponse.data?.bookings ?? []);
        reservationsPage ++;
      }
      emit(ReservationsSuccessState(
          reservationsResponse.data?.bookings ?? []));  // Pass cells1 here
    }, failure: (error) {
      emit(ReservationsErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


  List<String> convertBookingToListOfStrings(Booking booking) {
    if (booking.providerId == null ||
        booking.services == null ||
        booking.bookingTime == null) {
      return [];
    }

    DateTime bookingDate = DateTime.parse(booking.bookingTime!);

    String formattedDate = DateFormat('MM/dd/yyyy').format(bookingDate);

    String formattedTime = DateFormat('h a')
        .format(bookingDate)
        .replaceAll("AM", "ص")
        .replaceAll("PM", "م");

    String id = booking.id ?? "Unknown Provider";
    String providerName = booking.providerId?.name ?? "Unknown Provider";
    String serviceName = booking.services?.isNotEmpty == true
        ? booking.services![0].name ?? "U"
        : "";

    return [providerName, serviceName, formattedDate, formattedTime, id];
  }


  Future<void> updateBooking(String id)async{
    emit(UpdateBookingLoading());
    try{
      final response = await _repo.updateBooking(
        UpdateBookingRequest(
            bookingTime: dateTime.toString(),
        ),
        id,
      );
      response.when(success: (creationResponse) async {
        emit(UpdateBookingSuccess());
        fetchReservations();
        Navigator.pop(context);
      }, failure: (error) {
        emit(UpdateBookingError(
            error.apiErrorModel.message ?? 'Unknown Error!'));
      });

    }catch(ex){
      emit(UpdateBookingError(ex.toString()));
    }

  }
}