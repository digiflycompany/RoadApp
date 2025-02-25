import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/features/clients/data/models/customer_reports_response_model.dart';
import 'package:roadapp/features/clients/data/repo/customers_report_repo.dart';

import '../../../vehicles/data/models/vehicles_response.dart';

part 'customers_reports_state.dart';

class CustomersReportsCubit extends Cubit<CustomersReportsState> {
  CustomersReportsCubit(this._customersReportRepo)
      : super(CustomersReportsInitial());

  final CustomersReportRepo _customersReportRepo;

  static CustomersReportsCubit get(context) => BlocProvider.of(context);


  List<ClientData>? customerReportList;

  List<VehicleData>? vehiclesList = [];

  fetchCustomerReports() async {
    emit(LoadingCustomersReportsState());

    final response = await _customersReportRepo.getCustomerReports();

    response.when(success: (customerReportsResponse) async {
      customerReportList = customerReportsResponse.data;

      // تخزين المركبات لكل عميل في قائمة `vehiclesList`
      vehiclesList = customerReportList!
          .expand((client) => client.vehicles) // جميع المركبات في القائمة
          .toList();

      emit(SuccessCustomersReportsState());
    }, failure: (error) {
      emit(ErrorCustomersReportsState());
    });
  }

  List<Vehicle>? vehicles = [];

  fetchVehiclesId(String id) async {
    emit(VehiclesIdLoadingState());

    final response = await _customersReportRepo.fetchVehiclesId(id);

    response.when(success: (vehiclesResponse) async {
      vehicles = vehiclesResponse.data!.vehicles!;

      emit(VehiclesIdSuccessState());
    }, failure: (error) {
      emit(VehiclesIdErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


}
