/*
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:roadapp/core/api/dio_helper/dio_helper.dart';
import '../model/appointment_model.dart';

class AppointmentRepo {
  Future<AppointmentModel?> getAppointment() async {
    // Response? response = await DioHelper().get(endPoint: '');
    log('Get AppointmentModel response $response');

    if (response?.statusCode == 200) {
      AppointmentModel appointmentModel =
          AppointmentModel.fromJson(response?.data);

      return appointmentModel;
    }
    return null;
  }
}
*/
