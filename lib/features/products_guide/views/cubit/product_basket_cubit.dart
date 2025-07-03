import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/features/products_guide/data/models/product_request.dart';
import 'package:roadapp/features/products_guide/data/models/update_product_request.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../spare_parts/data/models/produt_response.dart';
import '../../../spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';
import '../../data/models/product_suggestion_request.dart';
import '../../data/repo/products_basket_repo.dart';

part 'product_basket_state.dart';

class ProductBasketCubit extends Cubit<ProductBasketState> {
  ProductBasketCubit(this._productsBasketRepo) : super(ProductBasketInitial());

  final ProductsBasketRepo _productsBasketRepo;
  static ProductBasketCubit get(context) => BlocProvider.of(context);


  int selectedRadio = 1;
  changeRadio(int processNumber) async{

    nameTextEditingController.clear();
    originalPriceTextEditingController.clear();
    finalPriceTextEditingController.clear();
    currencyTextEditingController.clear();
    availableQuantityTextEditingController.clear();

    selectedRadio = processNumber;
    emit(SelectProductsProcessTypeState());
  }

  //*************************************************************
  //**************          Get Products Centers      ***********
  //*************************************************************
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



  //*************************************************************
  //**************          Search Products           ***********
  //*************************************************************
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



  //*************************************************************
  //**************          Select Products Type      ***********
  //*************************************************************

  String? selectedProductTypeName;
  String? selectedProductTypeId;

  int productDropDownPage = 1;
  List<ProductType>? productTypeDropDown;

  bool isLoadingProductType = false;

  fetchProductsTypeDropDown({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      isLoadingProductType = true ;
      emit(ProductsTypeDropDawnLoadingMoreState());
    } else {
      isLoadingProductType = true ;
      emit(ProductsTypeDropDawnLoadingState());
    }
    final response =
    await _productsBasketRepo.productsTypeDropDown(
      page: page,
      limit: limit,
    );
    response.when(success: (maintenanceServiceTypeResponse) async {
      if (more != true) {
        productTypeDropDown = maintenanceServiceTypeResponse.data!.productTypes;
        productDropDownPage = 1;
      } else {
        productTypeDropDown?.addAll(maintenanceServiceTypeResponse.data!.productTypes ?? []);
        productDropDownPage ++;
      }
      isLoadingProductType = false ;
      emit(ProductsTypeDropDawnSuccessState(productTypeDropDown));
    }, failure: (error) {
      isLoadingProductType = false ;
      emit(ProductsTypeDropDawnErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


  //*************************************************************
  //**************          Add Products              ***********
  //*************************************************************


  GlobalKey<FormState> addProductKey = GlobalKey();

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController originalPriceTextEditingController = TextEditingController();
  TextEditingController finalPriceTextEditingController = TextEditingController();
  TextEditingController currencyTextEditingController = TextEditingController();
  TextEditingController availableQuantityTextEditingController = TextEditingController();

  createProduct() async {
    emit(AddProductsLoadingState());
    final response =
    await _productsBasketRepo.addProducts(ProductRequest(
      name: nameTextEditingController.text,
      nameAr: nameTextEditingController.text,
      typeId: selectedProductTypeId!,
      availableQuantity: int.parse(availableQuantityTextEditingController.text.trim()),
      price: PriceProduct(
          originalPrice: double.parse(originalPriceTextEditingController.text.trim()),
          finalPrice: double.parse(finalPriceTextEditingController.text.trim()),
      ),
      currency: 'egp',
    ),
    );

    response.when(success: (servicesResponse) async {
      await fetchProductType();
      nameTextEditingController.clear();
      originalPriceTextEditingController.clear();
      finalPriceTextEditingController.clear();
      currencyTextEditingController.clear();
      availableQuantityTextEditingController.clear();
      emit(AddProductsSuccessState());
    }, failure: (error) {
      nameTextEditingController.clear();
      originalPriceTextEditingController.clear();
      finalPriceTextEditingController.clear();
      currencyTextEditingController.clear();
      availableQuantityTextEditingController.clear();
      emit(AddProductsErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  //*************************************************************
  //**************       Products Suggestion          ***********
  //*************************************************************

  productSuggestion() async {
    emit(AddProductSuggestionLoadingState());
    final response =
    await _productsBasketRepo.productSuggestion(ProductSuggestionRequest(
      name: nameTextEditingController.text,
      nameAr: nameTextEditingController.text,
    ));

    response.when(success: (servicesResponse) async {
      await fetchProductType();
      emit(AddProductSuggestionSuccessState());
    }, failure: (error) {
      emit(AddProductSuggestionErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  //*************************************************************
  //**************       Update Products              ***********
  //*************************************************************

  GlobalKey<FormState> updateProductKey = GlobalKey();

  updateProduct(String id) async {
    emit(UpdateProductLoadingState());
    final response =
    await _productsBasketRepo.updateProduct(
      id,
        UpdateProductRequest(
            availableQuantity:int.parse(availableQuantityTextEditingController.text.trim()),
            price: PriceUpdateProduct(
              originalPrice: double.parse(originalPriceTextEditingController.text.trim()),
              finalPrice: double.parse(finalPriceTextEditingController.text.trim())
            )

    ));

    response.when(success: (servicesResponse) async {
      await fetchProductType();
      emit(UpdateProductSuccessState());
    }, failure: (error) {
      emit(UpdateProductErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  //*************************************************************
  //**************       Delete Products              ***********
  //*************************************************************


  deleteProduct(String id) async {
    emit(DeleteProductLoadingState());
    final response =
    await _productsBasketRepo.deleteProduct(
        id,
       );

    response.when(success: (servicesResponse) async {
      await fetchProductType();
      emit(DeleteProductSuccessState());
    }, failure: (error) {
      emit(DeleteProductErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

}
