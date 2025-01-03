import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/features/services_guide/data/models/services_request.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../maintenance_centers/data/models/maintenance_center_model.dart';
import '../../../maintenance_service/data/models/maintenance_service_model.dart';
import '../../../search/data/models/car_brand_model.dart';
import '../../data/models/service_suggestion_request.dart';
import '../../data/repo/maintenance_service_type_repo.dart';

part 'maintenance_service_type_state.dart';

class MaintenanceServiceTypeVendorCubit extends Cubit<MaintenanceServiceTypeVendorState> {
  MaintenanceServiceTypeVendorCubit(this._serviceTypeVendorRepo) : super(MaintenanceServiceTypeInitial());

  final MaintenanceServiceTypeVendorRepo _serviceTypeVendorRepo;
  static MaintenanceServiceTypeVendorCubit get(context) => BlocProvider.of(context);


  int selectedRadio = 1;
  changeRadio(int processNumber) async{

    nameTextEditingController.clear();
    costTextEditingController.clear();

    selectedRadio = processNumber;
    emit(SelectServicesProcessTypeState());
  }


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

  bool isLoadingServiceType = false;

  fetchMaintenanceServiceTypeDropDown({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      isLoadingServiceType = true ;
      emit(ServicesTypeDropDawnLoadingMoreState());
    } else {
      isLoadingServiceType = true ;
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
      isLoadingServiceType = false ;
      emit(ServiceTypeDropDawnSuccessState(serviceType));
    }, failure: (error) {
      isLoadingServiceType = false ;
      emit(ServicesTypeDropDawnErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  // Car Brand
  String? selectedCarBrandName;
  String? selectedCarBrandId;
  int carBrandPage = 1;
  List<Brand>? carBrandList;


  bool isLoadingCarBrand = false;

  fetchCarBrand({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      isLoadingCarBrand = true;
      emit(CarBrandDropDawnLoadingMoreState());
    } else {
      isLoadingCarBrand = true;
      emit(CarBrandDropDawnLoadingState());
    }
    final response =
    await _serviceTypeVendorRepo.getCarBrand(
      page: page,
      limit: limit,
    );
    response.when(success: (maintenanceServiceTypeResponse) async {
      if (more != true) {
        carBrandList = maintenanceServiceTypeResponse.data.brands;
        carBrandPage = 1;
      } else {
        carBrandList?.addAll(maintenanceServiceTypeResponse.data.brands ?? []);
        carBrandPage ++;
      }
      isLoadingCarBrand = false;
      emit(CarBrandDropDawnSuccessState(carBrandList));
    }, failure: (error) {
      isLoadingCarBrand = false;
      emit(CarBrandDropDawnErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });

  }

  TextEditingController costTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();

  // Add Services
  createServices() async {
    emit(AddServicesLoadingState());
      final response =
      await _serviceTypeVendorRepo.addServices(ServicesRequest(
          name: nameTextEditingController.text,
          nameAr: 'No Name',
          typeId: selectedTypeId!,
          cost: double.parse(costTextEditingController.text.trim()),
          brandId: selectedCarBrandId!,
      ));

      response.when(success: (servicesResponse) async {
        await fetchMaintenanceServiceType();
        emit(AddServicesSuccessState());
      }, failure: (error) {
        emit(AddServicesErrorState(
            error.apiErrorModel.message ?? 'Unknown Error!'));
      });
    }

  servicesSuggestion() async {
    emit(AddServicesSuggestionLoadingState());
    final response =
    await _serviceTypeVendorRepo.servicesSuggestion(ServiceSuggestionRequest(
      name: nameTextEditingController.text,
      nameAr: nameTextEditingController.text,
    ));

    response.when(success: (servicesResponse) async {
      await fetchMaintenanceServiceType();
      emit(AddServicesSuggestionSuccessState());
    }, failure: (error) {
      emit(AddServicesSuggestionErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


}
