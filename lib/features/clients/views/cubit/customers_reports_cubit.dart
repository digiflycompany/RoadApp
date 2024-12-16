import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/features/clients/data/models/customer_reports_response_model.dart';
import 'package:roadapp/features/clients/data/repo/customers_report_repo.dart';

part 'customers_reports_state.dart';

class CustomersReportsCubit extends Cubit<CustomersReportsState> {
  CustomersReportsCubit(this._customersReportRepo) : super(CustomersReportsInitial());

  final CustomersReportRepo _customersReportRepo;
  static CustomersReportsCubit get(context) => BlocProvider.of(context);


  List<ClientData>? customerReportList;
  fetchCustomerReports() async {

      emit(LoadingCustomersReportsState());

    final response = await _customersReportRepo.getCustomerReports();

    response.when(success: (customerReportsResponse) async {

      customerReportList = customerReportsResponse.data ;

      emit(SuccessCustomersReportsState());
    }, failure: (error) {
      emit(ErrorCustomersReportsState());
    });
  }

}
