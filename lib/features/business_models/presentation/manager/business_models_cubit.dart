import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/business_models/data/models/data_row_model.dart';
import 'package:roadapp/features/business_models/data/models/product_request_body.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../data/models/maintenance_response_model.dart';
import '../../data/models/receipt_request_body.dart';
import '../../data/models/request_examination_body.dart';
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

    String maintenanceCenterProfileIdKey =
        CacheHelper().getData('MaintenanceCenterProfileIdKey');
    final response = await _businessModelsRepo.getProduct(
        maintenanceCenterId: maintenanceCenterProfileIdKey,
        page: page,
        limit: limit);

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

  // Add  Voucher
  createVoucher() async {
    emit(AddPaymentVoucherLoadingState());

    if (selectedRadio == 1) {
      // Add Payment Voucher
      final response =
          await _businessModelsRepo.addReceiptVoucher(ReceiptRequestBody(
         //receiverId: selectedClientId ?? '',
        date: dateTime,
        productTypes: productsAdd,
        notes: noteController.text.trim(),
      ));
      response.when(success: (registerResponse) async {
        emit(AddReceiptVoucherSuccessState());

        selectedNameProduct = null;
        selectedNameClient = null;
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
    } else {
        final response =
            await _businessModelsRepo.addBillOfSellVoucher(ProductRequestBody(
          receiverId: null,
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


  //*******************************************************************
  //*****                 Full Scan Report ... !                 ******
  //*******************************************************************
  final formKeyFullScan = GlobalKey<FormState>();
  TextEditingController licensePlateNumberController = TextEditingController();
  TextEditingController examinationTypeController = TextEditingController();
  TextEditingController examinationDateController = TextEditingController();
  TextEditingController priceFullScanController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  final Map<String, int> _pointValues = {};

  Map<String, int> get pointValues => _pointValues;

  void updatePointValue(String key, int value) {
    debugPrint("Updating key: $key with value: $value");
    _pointValues[key] = value;
    emit(ReportValuesUpdated(_pointValues));
  }

  ReportContent buildReportContent(String? notes) {
    return ReportContent(
      outerStructure: OuterStructure(
        carExteriorParts: _pointValues['carExteriorParts'] ?? 1,
        interiorCondition: _pointValues['interiorCondition'] ?? 1,
        frontAndRearGlass: _pointValues['frontAndRearGlass'] ?? 1,
        roof: _pointValues['roof'] ?? 1,
        windows: _pointValues['windows'] ?? 1,
        inch: _pointValues['inch'] ?? 1,
      ),
      chassisAndFrame: ChassisAndFrame(
        fourChassis: _pointValues['fourChassis'] ?? 1,
        frontFrame: _pointValues['frontFrame'] ?? 1,
        roofStructure: _pointValues['roofStructure'] ?? 1,
        rearFrame: _pointValues['rearFrame'] ?? 1,
        frontFacade: _pointValues['frontFacade'] ?? 1,
        rearFacade: _pointValues['rearFacade'] ?? 1,
      ),
      engineAndTransmission: EngineAndTransmission(
        electronicallyExamineAllSystems:
            _pointValues['electronicallyExamineAllSystems'] ?? 1,
        examineMainBattery: _pointValues['examineMainBattery'] ?? 1,
        electricalEngineAndItsParts:
            _pointValues['electricalEngineAndItsParts'] ?? 1,
        electricalConverter: _pointValues['electricalConverter'] ?? 1,
        rechargeSystems: _pointValues['rechargeSystems'] ?? 1,
        coolingSystems: _pointValues['coolingSystems'] ?? 1,
      ),
      steeringSystem: SteeringSystem(
        frontPines: _pointValues['frontPines'] ?? 1,
        rearPines: _pointValues['rearPines'] ?? 1,
        steeringGroupAndItsParts: _pointValues['steeringGroupAndItsParts'] ?? 1,
        frontAndRearAxes: _pointValues['frontAndRearAxes'] ?? 1,
        wheelHub: _pointValues['wheelHub'] ?? 1,
        engineAndTransmissionMounts:
            _pointValues['engineAndTransmissionMounts'] ?? 1,
      ),
      electricalGroup: ElectricalGroup(
        frontLightingSystems: _pointValues['frontLightingSystems'] ?? 1,
        rearLightingSystems: _pointValues['rearLightingSystems'] ?? 1,
        roadsideAssistanceSystems:
            _pointValues['roadsideAssistanceSystems'] ?? 1,
        batteryAndChargingSystem: _pointValues['batteryAndChargingSystem'] ?? 1,
        accessoriesAndFittings: _pointValues['accessoriesAndFittings'] ?? 1,
      ),
      airConditioningSystem: AirConditioningSystem(
        airConditioningAndCompressorSystem:
            _pointValues['airConditioningAndCompressorSystem'] ?? 1,
        heatingSystem: _pointValues['heatingSystem'] ?? 1,
        engineAndFansCooling: _pointValues['engineAndFansCooling'] ?? 1,
        fluidSmuggling: _pointValues['fluidSmuggling'] ?? 1,
      ),
      brakesAndSafety: BrakesAndSafety(
        airBags: _pointValues['airBags'] ?? 1,
        tires: _pointValues['tires'] ?? 1,
        brakesAndTheirParts: _pointValues['brakesAndTheirParts'] ?? 1,
        seatBelts: _pointValues['seatBelts'] ?? 1,
        antiSlipSystems: _pointValues['antiSlipSystems'] ?? 1,
      ),
      notesSection: NotesSection(
        notes: notes ?? "No Notes",
      ),
    );
  }

  createFullScanReport() async {
    emit(AddFullScanReportLoadingState());

    String maintenanceCenterProfileIdKey =
        await CacheHelper().getData('MaintenanceCenterProfileIdKey');
    // Add Full Scan Report
    final response = await _businessModelsRepo.addFullScanReport(
      RequestExaminationBody(
        maintenanceCenterId: maintenanceCenterProfileIdKey,
        vehicleNumber: licensePlateNumberController.text.trim(),
        scanType: examinationTypeController.text.trim(),
        scanDate: dateTime.toString(),
        scanPrice: int.parse(priceFullScanController.text.trim()),
        reportContent: buildReportContent(notesController.text),
      ),
    );
    response.when(success: (registerResponse) async {
      emit(AddFullScanReportSuccessState());

      licensePlateNumberController.clear();
      examinationDateController.clear();
      examinationTypeController.clear();
      priceFullScanController.clear();
      notesController.clear();
      dateTime = DateTime.now();
    }, failure: (error) {
      emit(AddFullScanReportErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


}
