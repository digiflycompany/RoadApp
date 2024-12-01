import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/business_models/data/models/data_row_model.dart';
import 'package:roadapp/features/business_models/data/models/product_request_body.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/string_manager.dart';
import '../../data/models/maintenance_response_model.dart';
import '../../data/models/profile_data_response.dart';
import '../../data/models/receipt_request_body.dart';
import '../../data/repo/business_models_repo.dart';

class BusinessModelsCubit extends Cubit<BusinessModelsState> {
  BusinessModelsCubit(this._businessModelsRepo)
      : super(BusinessModelsInitial());
  final BusinessModelsRepo _businessModelsRepo;

  static BusinessModelsCubit get(context) => BlocProvider.of(context);

  int selectedRadio = 1;
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  bool checked = false;
  var dialogFormKey = GlobalKey<FormState>();

  DateTime dateTime = DateTime.now();

  void pickupDate(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
      builder: (_, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 12.sp)),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value != null) {
        // Update the date portion of dateTime
        dateTime = DateTime(
          value.year,
          value.month,
          value.day,
          dateTime.hour,
          dateTime.minute,
        );
      }
      emit(DateTimeState());
    });
  }

  void clearControllers() {
    itemCodeController.clear();
    itemNameController.clear();
    unitController.clear();
    quantityController.clear();
    priceController.clear();
    valueController.clear();
  }

  toggleCheckBox() {
    checked = !checked;
    emit(CheckToggled());
  }

  changeRadio(int processNumber) {
    selectedRadio = processNumber;
    selectedClientId = null;
    selectedNameClient = null;
    selectedNameProduct = null;
    noteController.clear();
    productList?.clear();
    dataRow.clear();
    productsAdd.clear();
    fetchProducts();
    emit(ProcessTypeChanged());
  }

  List<ProductReq> productsAdd = [];
  List<DataRowModel> dataRow = [];

  addProduct(BuildContext context) {
    if (dialogFormKey.currentState!.validate()) {
      dataRow.add(
        DataRowModel(
          name: selectedNameProduct.toString(),
          quantity: quantityController.text.trim(),
          price: priceController.text.trim(),
          value:
              '${double.parse(priceController.text.trim()) * int.parse(quantityController.text.trim())}',
        ),
      );
      productsAdd.add(
        ProductReq(
          id: selectedRadio == 1 ? selectedProductTypeId! : selectedProductId!,
          price: double.parse(priceController.text.trim()),
          quantity: int.parse(quantityController.text.trim()),
        ),
      );
      Navigator.pop(context);
      emit(AddProductState());
    }
  }

  @override
  Future<void> close() {
    clearControllers();
    DefaultLogger.logger.f("CUBIT CLOSED");
    return super.close();
  }

  // get All Product
  int productPage = 1;
  List<Product>? productList;

  String? selectedProductTypeId;
  String? selectedProductId;
  String? selectedNameProduct;

  fetchProducts({int page = 1, int limit = 35, bool? more}) async {
    if (more == true) {
      emit(GetProductMoreLoading());
    } else {
      emit(GetProductLoading());
    }

    String maintenanceCenterProfileIdKey = CacheHelper().getData('MaintenanceCenterProfileIdKey');
    final response =
        await _businessModelsRepo.getProduct(
          maintenanceCenterId: maintenanceCenterProfileIdKey,
            page: page, limit: limit);

    response.when(success: (productResponse) async {
      if (more != true) {
        productList = productResponse.data?.products ?? [];
        productPage = 1;
      } else {
        productList?.addAll(productResponse.data?.products ?? []);
        productPage++;
      }

      debugPrint(productList.toString());
      emit(GetProductSuccess());
    }, failure: (error) {
      emit(GetProductError());
    });
  }

  // Get All Client (maintenance center Name & ID )
  int maintenanceCenterPage = 1;
  List<MaintenanceCenters>? maintenanceCenterList;

  String? selectedNameClient;
  String? selectedClientId;

  fetchMaintenanceCenter({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      emit(GetMaintenanceCentersMoreLoading());
    } else {
      emit(GetMaintenanceCentersLoading());
    }

    final response = await _businessModelsRepo.getMaintenanceCenter(
      page: page,
      limit: limit,
    );

    response.when(success: (maintenanceResponse) async {
      if (more != true) {
        maintenanceCenterList =
            maintenanceResponse.data?.maintenanceCenters ?? [];
        maintenanceCenterPage = 1;
      } else {
        maintenanceCenterList
            ?.addAll(maintenanceResponse.data?.maintenanceCenters ?? []);
        maintenanceCenterPage++;
      }

      emit(GetMaintenanceCentersSuccess());
    }, failure: (error) {
      emit(GetMaintenanceCentersError());
    });
  }
  // Add Payment Voucher
  createVoucher() async {
    emit(AddPaymentVoucherLoadingState());

    if (selectedRadio == 1) {
      // Add Payment Voucher
      final response =
          await _businessModelsRepo.addReceiptVoucher(ReceiptRequestBody(
       // receiverId: selectedClientId ?? '',
        date: dateTime,
        productTypes: productsAdd,
        notes: noteController.text.trim(),
      ));
      response.when(success: (registerResponse) async {
        emit(AddReceiptVoucherSuccessState());

        selectedNameProduct = null ;
        selectedNameClient = null ;
        noteController.clear();
        productList?.clear();
        dataRow.clear();
        productsAdd.clear();

      }, failure: (error) {
        emit(AddReceiptVoucherErrorState(
            error.apiErrorModel.message ?? 'Unknown Error!'));
      });
    }
    else if (selectedRadio == 2) {
      if (selectedNameClient == null) {
        showToast(
            message: 'Please Select Supplier Name', state: ToastStates.error);
        emit(AddBillOfSellVoucherErrorState('Unknown Error!'));
      } else {
        final response =
        await _businessModelsRepo.addPaymentVoucher(ProductRequestBody(
          receiverId: selectedClientId ?? '',
          date: dateTime,
          products: productsAdd,
          notes: noteController.text.trim(),
        ));
        response.when(success: (registerResponse) async {
          emit(AddPaymentVoucherSuccessState());
          selectedNameProduct = null;
          selectedNameClient = null;
          noteController.clear();
          productList?.clear();
          dataRow.clear();
          productsAdd.clear();
        }, failure: (error) {
          emit(AddPaymentVoucherErrorState(
              error.apiErrorModel.message ?? 'Unknown Error!'));
        });
      }
    }
    else{
      if (selectedNameClient == null) {
        showToast(
            message: 'Please Select Supplier Name', state: ToastStates.error);
        emit(AddBillOfSellVoucherErrorState('Unknown Error!'));
      } else {
        final response =
        await _businessModelsRepo.addBillOfSellVoucher(ProductRequestBody(
          receiverId: selectedClientId ?? '',
          date: dateTime,
          products: productsAdd,
          notes: noteController.text.trim(),
        ));
        response.when(success: (registerResponse) async {
          emit(AddBillOfSellVoucherSuccessState());
          selectedNameProduct = null;
          selectedNameClient = null;
          noteController.clear();
          productList?.clear();
          dataRow.clear();
          productsAdd.clear();
        }, failure: (error) {
          emit(AddBillOfSellVoucherErrorState(
              error.apiErrorModel.message ?? 'Unknown Error!'));
        });
      }
    }
  }



  String? maintenanceCenterProfileID;

  // Get Profile Data
  fetchProfileData() async {
      emit(GetUserDataLoading());
    final response =
    await _businessModelsRepo.getProfileUserData();
    response.when(success: (userResponse) async {
      maintenanceCenterProfileID = userResponse.data.user.maintenanceCenterId.id;
      await CacheHelper().saveData('MaintenanceCenterProfileIdKey', maintenanceCenterProfileID);
      emit(GetUserDataSuccess());
      },
     failure: (error) {
      emit(GetUserDataError());
    });
  }


}
