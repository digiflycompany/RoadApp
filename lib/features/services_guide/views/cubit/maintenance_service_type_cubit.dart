import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../maintenance_centers/data/models/maintenance_center_model.dart';
import '../../../maintenance_service/data/models/maintenance_service_model.dart';
import '../../data/repo/maintenance_service_type_repo.dart';

part 'maintenance_service_type_state.dart';

class MaintenanceServiceTypeVendorCubit extends Cubit<MaintenanceServiceTypeVendorState> {
  MaintenanceServiceTypeVendorCubit(this._serviceTypeVendorRepo) : super(MaintenanceServiceTypeInitial());

  final MaintenanceServiceTypeVendorRepo _serviceTypeVendorRepo;
  static MaintenanceServiceTypeVendorCubit get(context) => BlocProvider.of(context);


  int maintenancePage = 1;
  List<Service>? serviceType;

  fetchMaintenanceServiceType({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      emit(ServicesTypeLoadingMoreState());
    } else {
      emit(ServicesTypeLoadingState());
    }
    String maintenanceCenterProfileIdKey =
    CacheHelper().getData('MaintenanceCenterProfileIdKey');

    final response =
    await _serviceTypeVendorRepo.getMaintenanceServiceType(
        page: page,
        limit: limit,
        maintenanceCenterId: maintenanceCenterProfileIdKey,
    );

    response.when(success: (maintenanceServiceTypeResponse) async {
      if (more != true) {
        serviceType = maintenanceServiceTypeResponse.data?.services;
        maintenancePage = 1;
      } else {
        serviceType?.addAll(maintenanceServiceTypeResponse.data?.services ?? []);
        maintenancePage ++;
      }
      emit(ServiceTypeSuccessState(serviceType));
    }, failure: (error) {
      emit(ServicesTypeErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  searchMaintenanceServiceType({int page = 1, int limit = 10, bool? more, required String searchField}) async {
    if (more == true) {
      emit(SearchServicesTypeLoadingMoreState());
    } else {
      emit(SearchServicesTypeLoadingState());
    }
    String maintenanceCenterProfileIdKey =
    CacheHelper().getData('MaintenanceCenterProfileIdKey');
    final response =
    await _serviceTypeVendorRepo.searchMaintenanceServiceType(page: page, limit: limit, searchField: searchField, maintenanceCenterId: maintenanceCenterProfileIdKey,);

    response.when(success: (searchMaintenanceServiceTypeResponse) async {
      if (more != true) {
        serviceType = searchMaintenanceServiceTypeResponse.data!.services;
        maintenancePage = 1;
      } else {
        serviceType?.addAll(searchMaintenanceServiceTypeResponse.data!.services ?? []);
        maintenancePage ++;
      }
      emit(SearchServiceTypeSuccessState(serviceType));
    }, failure: (error) {
      emit(SearchServicesTypeErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  String? selectedServiceTypeName;
  String? selectedTypeId;

  int maintenanceServiceDropDownPage = 1;
  List<ServiceType>? serviceTypeDropDown;

  fetchMaintenanceServiceTypeDropDown({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      emit(ServicesTypeDropDawnLoadingMoreState());
    } else {
      emit(ServicesTypeDropDawnLoadingState());
    }
    final response =
    await _serviceTypeVendorRepo.maintenanceServiceTypeDropDown(
      page: page,
      limit: limit,
    );
    response.when(success: (maintenanceServiceTypeResponse) async {
      if (more != true) {
        serviceTypeDropDown = maintenanceServiceTypeResponse.data.serviceTypes;
        maintenanceServiceDropDownPage = 1;
      } else {
        serviceTypeDropDown?.addAll(maintenanceServiceTypeResponse.data.serviceTypes ?? []);
        maintenanceServiceDropDownPage ++;
      }
      emit(ServiceTypeDropDawnSuccessState(serviceType));
    }, failure: (error) {
      emit(ServicesTypeDropDawnErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}
