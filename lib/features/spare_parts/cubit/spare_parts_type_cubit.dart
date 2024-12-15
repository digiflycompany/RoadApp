import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/spare_parts/data/models/produt_response.dart';
import 'package:roadapp/features/spare_parts/data/repo/spare_parts_type_repo.dart';

part 'spare_parts_type_state.dart';

class SparePartsTypeCubit extends Cubit<SparePartsTypeState> {
  SparePartsTypeCubit(this._sparePartsTypeRepo) : super(SparePartsTypeInitial());

  final SparePartsTypeRepo _sparePartsTypeRepo;
  static SparePartsTypeCubit get(context) => BlocProvider.of(context);

  ProductResponse? productTypeResponse;
  int currentPage = 1;
  int limit = 25;

  Future<void> getProductType({
    bool isLoadMore = false,
  }) async {
    if (!isLoadMore) {
      emit(GetProductTypeLoading());
    }

    final response =
    await _sparePartsTypeRepo.getSparePartsType(
      searchField: '',
      page: currentPage,
      limit: limit,
    );

    response.when(
      success: (productResponse) {
        if (isLoadMore) {
          productTypeResponse?.data.productTypes
              .addAll(productResponse.data.productTypes);
        } else {
          productTypeResponse = productResponse;
        }

        debugPrint(productResponse.toString());
        emit(GetProductTypeSuccess());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetProductTypeError());
      },
    );
  }

  Future<void> loadMoreProductType() async {
    if (state is GetProductTypeMoreLoading) return;

    emit(GetProductTypeMoreLoading());
    try {
      currentPage++;
      await getProductType(
        isLoadMore: true,
      );
      emit(GetProductTypeMoreSuccess());
    } catch (ex) {
      debugPrint(ex.toString());
      currentPage--;
      emit(GetProductTypeMoreError());
    }
  }


  /// Search

  int currentPageSearch = 1;
  int limitSearch = 25;

  Future<void> getSearchProductType({
    String? searchField,
    bool isLoadMore = false,
  }) async {
    if (!isLoadMore) {
      emit(GetSearchProductTypeLoading());
    }

    final response =
    await _sparePartsTypeRepo.getSparePartsType(
      searchField: searchField ?? '',
      page: currentPage,
      limit: limit,
    );

    response.when(
      success: (productResponse) {
        if (isLoadMore) {
          productTypeResponse?.data.productTypes
              .addAll(productResponse.data.productTypes);
        } else {
          productTypeResponse = productResponse;
        }

        debugPrint(productResponse.toString());
        emit(GetSearchProductTypeSuccess());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetProductTypeError());
      },
    );
  }

  Future<void> loadMoreSearchProductType() async {
    if (state is GetSearchProductTypeMoreLoading) return;

    emit(GetSearchProductTypeMoreLoading());
    try {
      currentPage++;
      await getSearchProductType(
        isLoadMore: true,
      );
      emit(GetSearchProductTypeMoreSuccess());
    } catch (ex) {
      debugPrint(ex.toString());
      currentPage--;
      emit(GetSearchProductTypeMoreError());
    }
  }


}
