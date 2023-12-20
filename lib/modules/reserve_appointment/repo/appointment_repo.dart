import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../services/dio_helper/dio_helper.dart';
import '../../../shared/const/api_consts.dart';
import '../model/appointment_model.dart';

class AppointmentRepo {
  Future<AppointmentModel?> getAppointment() async {
    Response? response = await DioHelper.getData(url: EndPoints.test);
    log('Get AppointmentModel response $response');

    if (response?.statusCode == 200) {
      AppointmentModel appointmentModel =
          AppointmentModel.fromJson(response?.data);

      return appointmentModel;
    }
    return null;
  }
}
