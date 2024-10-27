import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

class BusinessModelsCubit extends Cubit<BusinessModelsState> {
  BusinessModelsCubit() : super(BusinessModelsInitial());

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

  addProduct(BuildContext context) {
    if (dialogFormKey.currentState!.validate()) Navigator.pop(context);
    return;
  }

  @override
  Future<void> close() {
    clearControllers();
    DefaultLogger.logger.f("CUBIT CLOSED");
    return super.close();
  }
}