import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/maintenance_center_details/cubit/maintenance_center_details_states.dart';
import 'package:roadapp/features/maintenance_center_details/data/models/booking_product_request.dart';
import 'package:roadapp/features/maintenance_center_details/data/repo/poking_product_repo.dart';

class MaintenanceCenterDetailsCubit
    extends Cubit<MaintenanceCenterDetailsStates> {
  MaintenanceCenterDetailsCubit(this.context, this._bookingProductRepo)
      : super(MaintenanceCenterDetailsInitStates());

  static MaintenanceCenterDetailsCubit get(context) => BlocProvider.of(context);

  final BookingProductRepo _bookingProductRepo;

  final TextEditingController commentController = TextEditingController();

  String? vehiclesId;
  String? vehiclesName;

  final BuildContext context;
  DateTime dateTime = DateTime.now();

  TimeOfDay timeOfDay = TimeOfDay.now();

  void pickupDate() {
    showDatePicker(
        keyboardType: TextInputType.name,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2025),
        builder: (_, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 12.sp))),
              child: child!);
        }).then((value) {
      if (value != null) {
        dateTime = value;
      }
      emit(MaintenanceCenterDetailsPickupDateStates());
    });
  }

  void pickupTime() {
    showTimePicker(
      context: context,
      initialTime: timeOfDay,
    ).then((value) {
      if (value != null) {
        timeOfDay = value;
      }
      emit(MaintenanceCenterDetailsPickupDateStates());
    });
  }

  void createBooking(String servicesId, String providerId) async {
    emit(BookingLoadingState());

    final response = await _bookingProductRepo.createBooking(
      BookingProductRequest(
        services: [servicesId],
        bookingTime: dateTime,
        providerId: providerId,
        vehicleId: vehiclesId,
        comment: commentController.text,
      ),
    );

    response.when(success: (createResponse) async {
      debugPrint(createResponse.toString());
      commentController.clear();

      emit(BookingSuccessState());
    }, failure: (error) {
      emit(BookingErrorState(
          bookingError: error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}
