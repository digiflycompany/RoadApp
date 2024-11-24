import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/data/repo/spare_parts_center_repo.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_state.dart';

class SparePartsCubit extends Cubit<SparePartsState> {
  SparePartsCubit(this._sparePartsCenterRepo) : super(SparePartsInitial());
  final SparePartsCenterRepo _sparePartsCenterRepo;

  static SparePartsCubit get(context) => BlocProvider.of(context);

  bool mostAffordable = false;
  bool nearestCheckbox = false;
  bool mostRatedCheckbox = false;

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

  SparePartsCenterResponse? sparePartsCenterResponse;
  int currentPage = 1;
  int limit = 10;

  Future<void> getSparePartsCenter({
    required String typeId,
    bool isLoadMore = false,
  }) async {
    if (!isLoadMore) {
      emit(GetSparePartsCenterLoading());
    }

    debugPrint('test Falter ===>$mostAffordable');
    final response =
    await _sparePartsCenterRepo.getSparePartsCenter(
      typeId: typeId,
      page: currentPage,
      orderByCost: mostAffordable == true  ? 'asc' : 'desc',
      limit: limit,
    );

    response.when(
      success: (productCenterResponse) {
        if (isLoadMore) {
          sparePartsCenterResponse?.data?.products!
              .addAll(productCenterResponse.data!.products!);
        } else {
          sparePartsCenterResponse = productCenterResponse;
        }

        debugPrint(sparePartsCenterResponse.toString());
        emit(GetSparePartsCenterSuccess());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetSparePartsCenterError());
      },
    );
  }

  Future<void> loadMoreSparePartsCenter(String typeId) async {
    if (state is GetSparePartsCenterMoreLoading) return;

    emit(GetSparePartsCenterMoreLoading());
    try {
      currentPage++;
      await getSparePartsCenter(
        typeId: typeId,
        isLoadMore: true,
      );
      emit(GetSparePartsCenterMoreSuccess());
    } catch (ex) {
      debugPrint(ex.toString());
      currentPage--;
      emit(GetSparePartsCenterMoreError());
    }
  }


}
