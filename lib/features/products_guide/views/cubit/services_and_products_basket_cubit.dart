import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../maintenance_service/data/models/maintenance_service_model.dart';
import '../../data/repo/services_and_products_basket_repo.dart';

part 'services_and_products_basket_state.dart';

class ServicesAndProductsBasketCubit extends Cubit<ServicesAndProductsBasketState> {
  ServicesAndProductsBasketCubit(this._servicesAndProductsBasketRepo) : super(ServicesAndProductsBasketInitial());

  final ServicesAndProductsBasketRepo _servicesAndProductsBasketRepo;
  static ServicesAndProductsBasketCubit get(context) => BlocProvider.of(context);


  int maintenancePage = 1;
  List<ServiceType>? serviceType;

  fetchMaintenanceServiceType({int page = 1, int limit = 35, bool? more}) async {
    if (more == true) {
      emit(ServicesAndProductsBasketLoadingMoreState());
    } else {
      emit(ServicesAndProductsBasketLoadingState());
    }
    final response =
    await _servicesAndProductsBasketRepo.getMaintenanceServiceType(page: page, limit: limit);

    response.when(success: (maintenanceServiceTypeResponse) async {
      if (more != true) {
        serviceType = maintenanceServiceTypeResponse.data.serviceTypes;
        maintenancePage = 1;
      } else {
        serviceType?.addAll(maintenanceServiceTypeResponse.data.serviceTypes);
        maintenancePage ++;
      }
      emit(MaintenanceServiceSuccessState(serviceType));
    }, failure: (error) {
      emit(ServicesAndProductsBasketErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  // Search MaintenanceService Type

  searchMaintenanceServiceType({int page = 1, int limit = 35, bool? more, required String searchField}) async {
    if (more == true) {
      emit(SearchServicesAndProductsBasketLoadingMoreState());
    } else {
      emit(SearchServicesAndProductsBasketLoadingState());
    }
    final response =
    await _servicesAndProductsBasketRepo.searchMaintenanceServiceType(page: page, limit: limit, searchField: searchField);

    response.when(success: (maintenanceServiceTypeResponse) async {
      if (more != true) {
        serviceType = maintenanceServiceTypeResponse.data.serviceTypes;
        maintenancePage = 1;
      } else {
        serviceType?.addAll(maintenanceServiceTypeResponse.data.serviceTypes);
        maintenancePage ++;
      }
      emit(SearchMaintenanceServiceSuccessState(serviceType));
    }, failure: (error) {
      emit(SearchServicesAndProductsBasketErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

}
