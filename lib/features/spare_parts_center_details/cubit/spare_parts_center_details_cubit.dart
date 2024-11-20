import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/spare_parts_center_details/cubit/spare_parts_center_details_states.dart';
import 'package:roadapp/features/spare_parts_center_details/data/models/booking_spare_parts.dart';

import '../data/repo/spare_parts_center_details_repo.dart';

class SparePartsCenterDetailsCubit
    extends Cubit<SparePartsCenterDetailsStates> {
  SparePartsCenterDetailsCubit(this.context, this._sparePartsCenterDetailsRepo)
      : super(SparePartsCenterDetailsInitStates());

  static SparePartsCenterDetailsCubit get(context) => BlocProvider.of(context);

  final SparePartsCenterDetailsRepo _sparePartsCenterDetailsRepo;

  final BuildContext context;

  final TextEditingController commentController = TextEditingController();

  String? vehiclesId;
  String? vehiclesName;


  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  void pickupDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
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
      emit(SparePartsCenterDetailsPickupDateStates());
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
      emit(SparePartsCenterDetailsPickupDateStates());
    });
  }



  void createSparePartsBooking(
      {required String productId, required int quantity, required String providerId}) async {
    emit(BookingSparePartsLoadingState());

    final response = await _sparePartsCenterDetailsRepo.createBookingSpareParts(
      BookingSpareParts(
        products: [
          Product(productId: productId, quantity: quantity),
        ],
        bookingTime: dateTime,
        providerId: providerId,
        vehicleId: vehiclesId!,
        comment: commentController.text,
      ),
    );

    response.when(success: (createResponse) async {
      debugPrint(createResponse.toString());
      commentController.clear();

      emit(BookingSparePartsSuccessState());
    }, failure: (error) {
      emit(BookingSparePartsErrorState(
          bookingError: error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }



}