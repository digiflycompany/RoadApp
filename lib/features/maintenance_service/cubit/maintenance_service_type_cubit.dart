import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/maintenance_service/data/models/maintenance_service_model.dart';
import 'package:roadapp/features/maintenance_service/data/repo/maintenance_service_type_repo.dart';


part 'maintenance_service_type_state.dart';

class MaintenanceServiceTypeCubit extends Cubit<MaintenanceServiceTypeState> {
  MaintenanceServiceTypeCubit(this._maintenanceServiceTypeRepo)
      : super(MaintenanceServiceInitial());

  final MaintenanceServiceTypeRepo _maintenanceServiceTypeRepo;

  static MaintenanceServiceTypeCubit get(context) => BlocProvider.of(context);

  String? selectedServiceType;
  ServiceTypeResponse? serviceTypeResponse;
  int currentPage = 1;
  int limit = 25;

  Future<void> getServiceType({
    bool isLoadMore = false,
  }) async {
    if (!isLoadMore) {
      emit(GetServiceTypeLoading());
    }

    final response =
        await _maintenanceServiceTypeRepo.getMaintenanceServiceType(
      page: currentPage,
      limit: limit,
    );

    response.when(
      success: (serviceResponse) {
        if (isLoadMore) {
          serviceTypeResponse?.data.serviceTypes
              .addAll(serviceResponse.data.serviceTypes);
        } else {
          serviceTypeResponse = serviceResponse;
        }

        debugPrint(serviceResponse.toString());
        emit(GetServiceTypeSuccess());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetServiceTypeError());
      },
    );
  }

  Future<void> loadMoreServiceType() async {
    if (state is GetServiceTypeMoreLoading) return;

    emit(GetServiceTypeMoreLoading());
    try {
      currentPage++;
      await getServiceType(
        isLoadMore: true,
      );
      emit(GetServiceTypeMoreSuccess());
    } catch (ex) {
      debugPrint(ex.toString());
      currentPage--;
      emit(GetServiceTypeMoreError());
    }
  }

  // Search Maintenance service
  int currentSearchPage = 1;
  int limitSearch = 25;

  Future<void> searchServiceType({
    required String searchField,
    bool isLoadMore = false,
  }) async {
    if (!isLoadMore) {
      emit(GetSearchServiceTypeLoading());
    }

    final response =
    await _maintenanceServiceTypeRepo.searchMaintenanceServiceType(
      searchField: searchField,
      page: currentSearchPage,
      limit: limitSearch,
    );

    response.when(
      success: (serviceResponse) {
        if (isLoadMore) {
          serviceTypeResponse?.data.serviceTypes
              .addAll(serviceResponse.data.serviceTypes);
        } else {
          serviceTypeResponse = serviceResponse;
        }

        debugPrint(serviceResponse.toString());
        emit(GetSearchServiceTypeSuccess());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetSearchServiceTypeError());
      },
    );
  }




}
