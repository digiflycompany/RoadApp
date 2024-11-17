import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/maintenance_centers/data/models/maintenance_center_model.dart';
import 'package:roadapp/features/maintenance_centers/data/repo/maintenance_center_repo.dart';
import 'package:roadapp/features/maintenance_centers/presentation/cubit/maintenance_state.dart';

class MaintenanceCubit extends Cubit<MaintenanceState> {
  MaintenanceCubit(this._maintenanceCenterRepo) : super(MaintenanceInitial());

  final MaintenanceCenterRepo _maintenanceCenterRepo;

  static MaintenanceCubit get(context) => BlocProvider.of(context);

  bool mostAffordable = false;
  bool nearestCheckbox = false;
  bool mostRatedCheckbox = false;

  String? brandId;
  String? typeId;

  void changeCheckBox(bool value, String box) {
    switch (box) {
      case 'affordable':
        mostAffordable = value;
        break;
      case 'closest':
        nearestCheckbox = value;
        break;
      case 'highest':
        mostRatedCheckbox = value;
        break;
    }
    emit(BoxUpdatedState());
  }

  MaintenanceCenterModel? maintenanceCenterModel;
  int currentPage = 1;
  int limit = 10;

  Future<void> getMaintenanceCenter({
    required String brandId,
    required String typeId,
    bool isLoadMore = false,
  }) async {
    if (!isLoadMore) {
      emit(GetMaintenanceCenterLoading());
    }

    print('bolllllllllllllll===>$mostAffordable');
    final response =
    await _maintenanceCenterRepo.getMaintenanceCenter(
      brandId: brandId,
      typeId: typeId,
      page: currentPage,
      orderByCost: mostAffordable == true  ? 'asc' : 'desc',
      limit: limit,
    );

    response.when(
      success: (serviceCenterResponse) {
        if (isLoadMore) {
          maintenanceCenterModel?.data?.services!
              .addAll(serviceCenterResponse.data!.services!);
        } else {
          maintenanceCenterModel = serviceCenterResponse;
        }

        debugPrint(serviceCenterResponse.toString());
        emit(GetMaintenanceCenterSuccess());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetMaintenanceCenterError());
      },
    );
  }

  Future<void> loadMoreMaintenanceCenter(String brandId,String typeId) async {
    if (state is GetMaintenanceCenterMoreLoading) return;

    emit(GetMaintenanceCenterMoreLoading());
    try {
      currentPage++;
      await getMaintenanceCenter(
        brandId: brandId,
        typeId: typeId,
        isLoadMore: true,
      );
      emit(GetMaintenanceCenterMoreSuccess());
    } catch (ex) {
      debugPrint(ex.toString());
      currentPage--;
      emit(GetMaintenanceCenterMoreError());
    }
  }



}