import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/business_models/data/models/data_row_model.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';

import '../../data/models/maintenance_response_model.dart';
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
  bool checked = false;
  var dialogFormKey = GlobalKey<FormState>();

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
    emit(ProcessTypeChanged());
  }

  List<DataRowModel> dataRow = [];

  addProduct(BuildContext context) {
    if (dialogFormKey.currentState!.validate()) {
      dataRow.add(
        DataRowModel(
          name: selectedNameProduct.toString(),
          quantity: quantityController.text.trim(),
          price: priceController.text.trim(),
          value: valueController.text.trim(),
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

  String? selectedProductId;
  String? selectedNameProduct;

  fetchProducts({int page = 1, int limit = 35, bool? more}) async {
    if (more == true) {
      emit(GetProductMoreLoading());
    } else {
      emit(GetProductLoading());
    }

    final response =
        await _businessModelsRepo.getProduct(page: page, limit: limit);

    response.when(success: (productResponse) async {
      if (more != true) {
        productList = productResponse.data?.products ?? [];
        productPage = 1;
      } else {
        productList?.addAll(productResponse.data?.products ?? []);
        productPage++;
      }

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

    final response =
    await _businessModelsRepo.getMaintenanceCenter(page: page, limit: limit);

    response.when(success: (maintenanceResponse) async {
      if (more != true) {
        maintenanceCenterList = maintenanceResponse.data?.maintenanceCenters ?? [];
        maintenanceCenterPage = 1;
      } else {
        maintenanceCenterList?.addAll(maintenanceResponse.data?.maintenanceCenters ?? []);
        maintenanceCenterPage++;
      }

      emit(GetMaintenanceCentersSuccess());
    }, failure: (error) {
      emit(GetMaintenanceCentersError());
    });
  }


}
