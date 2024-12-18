import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';
import '../../data/repo/products_basket_repo.dart';

part 'product_basket_state.dart';

class ProductBasketCubit extends Cubit<ProductBasketState> {
  ProductBasketCubit(this._productsBasketRepo) : super(ProductBasketInitial());

  final ProductsBasketRepo _productsBasketRepo;
  static ProductBasketCubit get(context) => BlocProvider.of(context);


  int productsPage = 1;
  List<Product>? productType;

  fetchProductType({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      emit(ProductsTypeLoadingMoreState());
    } else {
      emit(ProductsTypeLoadingState());
    }
    String maintenanceCenterProfileIdKey =
    CacheHelper().getData('MaintenanceCenterProfileIdKey');

    final response =
    await _productsBasketRepo.getProductType(
      page: page,
      limit: limit,
      maintenanceCenterId: maintenanceCenterProfileIdKey,
    );

    response.when(success: (productTypeResponse) async {
      if (more != true) {
        productType = productTypeResponse.data?.products;
        productsPage = 1;
      } else {
        productType?.addAll(productTypeResponse.data?.products ?? []);
        productsPage ++;
      }
      emit(ProductsTypeSuccessState(productType));
    }, failure: (error) {
      emit(ProductsTypeErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


  searchProductType({int page = 1, int limit = 10, bool? more, required String searchField}) async {
    if (more == true) {
      emit(SearchProductsTypeLoadingMoreState());
    } else {
      emit(SearchProductsTypeLoadingState());
    }
    String maintenanceCenterProfileIdKey =
    CacheHelper().getData('MaintenanceCenterProfileIdKey');
    final response =
    await _productsBasketRepo.searchProductType(page: page, limit: limit, searchField: searchField, maintenanceCenterId: maintenanceCenterProfileIdKey,);

    response.when(success: (searchMaintenanceServiceTypeResponse) async {
      if (more != true) {
        productType = searchMaintenanceServiceTypeResponse.data!.products;
        productsPage = 1;
      } else {
        productType?.addAll(searchMaintenanceServiceTypeResponse.data!.products ?? []);
        productsPage ++;
      }
      emit(SearchProductsTypeSuccessState(productType));
    }, failure: (error) {
      emit(SearchProductsTypeErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


}
