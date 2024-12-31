// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/features/general_inventory/data/models/get_all_products_response.dart';
import 'package:roadapp/features/general_inventory/data/models/get_general_stock_response.dart';
import 'package:roadapp/features/general_inventory/data/repos/get_general_stock_repo.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_state.dart';

import 'dart:io';
import 'package:excel/excel.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class InventoryCubit extends Cubit<InventoryState> {
  InventoryCubit(this._generalStockRepo) : super(InventoryInitialState());
  final GetGeneralStockRepo _generalStockRepo;
  static InventoryCubit get(context) => BlocProvider.of(context);

  ///--------------------- START DATE ---------------------///
  DateTime startDateTime = DateTime.now();

  void pickStartDate(context) {
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
    ).then((value) async {
      if (value != null) {
        // Update the date portion of dateTime
        startDateTime = DateTime(
          value.year,
          value.month,
          value.day,
        );
        print(value.toString());
        getInventoryRecord();
        emit(StartDateState());
      }
    });
  }

  ///--------------------- END DATE ---------------------///
  DateTime endDateTime = DateTime.now();
  void pickEndDate(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
      builder: (_, child) {
        return Theme(
          data: Theme.of(context),
          child: child!,
        );
      },
    ).then((value) async {
      if (value != null) {
        // Update the date portion of dateTime
        endDateTime = DateTime(
          value.year,
          value.month,
          value.day,
        );
        print(value.toString());
        getInventoryRecord();
        emit(EndDateState());
      }
    });
  }

  String extractDate(String dateTime) {
    final date = DateTime.parse(dateTime);
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }

  ///--------------------- GET INVENTORY RECORD ---------------------///
  int inventoryRecordPage = 1;
  List<InventoryRecord>? inventoryRecord;

  String? productIdShare;
  getInventoryRecord({
    int page = 1,
    int limit = 10,
    bool? more,
    final String? productId,
  })
  async {
    productIdShare = productId;
    if (more == true) {
      emit(LoadingMoreState());
    } else {
      emit(InventoryLoadingState());
    }

    final token = await CacheHelper().getData(CacheVars.accessToken);
    debugPrint('Token ====> : $token');

    final response = await _generalStockRepo.getGeneralStock(
      // startDate: "2024-12-19",
      startDate: extractDate(startDateTime.toString()),
      endDate: extractDate(endDateTime.toString()),
      page: page,
      limit: limit, productId: productId,
    );

    response.when(success: (recordResponse) {
      if (more != true) {
        inventoryRecord = recordResponse.data?.records ?? [];
        debugPrint("List =====>>>" '${inventoryRecord!.length}');
        inventoryRecordPage = 1;
        debugPrint("Start Date: ${extractDate(startDateTime.toString())}");
        debugPrint("End Date: ${extractDate(endDateTime.toString())}");
        debugPrint("Data:=====>>> $inventoryRecord");
        emit(InventorySuccessState(inventoryRecord: inventoryRecord));
      } else {
        inventoryRecord?.addAll(recordResponse.data?.records ?? []);
        inventoryRecordPage++;
      }
      emit(InventorySuccessState(inventoryRecord: inventoryRecord));
    }, failure: (error) {
      emit(
          InventoryErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  ///--------------------- GET FILTRATION PRODUCT ---------------------///
  int productPage = 1;
  List<GetAllProduct>? productList;

  getAllProducts({
    int page = 1,
    int limit = 10,
    bool? more,
  })
  async {
    if (more == true) {
      emit(GetProductLoadingMoreState());
    } else {
      emit((GetProductLoadingState()));
    }
    String maintenanceCenterProfileIdKey =
        await CacheHelper().getData('MaintenanceCenterProfileIdKey');
    debugPrint("ID USER ====>>> : $maintenanceCenterProfileIdKey");

    final response = await _generalStockRepo.getProduct(
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
      emit(GetProductSuccessState(products: productList));
    }, failure: (error) {
      emit(GetProductErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  // Track selected products
  final Set<String> selectedProducts = {};

  // Toggle checkbox selection
  void toggleProductSelection(String? productId, bool isSelected) {
    if (isSelected) {
      selectedProducts.add(productId!);
    } else {
      selectedProducts.remove(productId);
    }
    print('Selected Products: $selectedProducts');
    getAllProducts();
    emit(BoxUpdatedState());
  }

  void clearSelectedProducts() {
    selectedProducts.clear();
    getAllProducts();
    emit(ClearSelectedProductsState(selectedProducts: selectedProducts));
  }
  void deselectAllClasses() {
    if (selectedProducts.isEmpty) {
      // لا شيء محدد، لا حاجة لإلغاء تحديد "كل الأصناف"
      return;
    }
    emit(DeselectAllClassesState(selectedProducts: selectedProducts));
  }



  //******************************************************
  //*********        Gat Share Data           ************
  //******************************************************

  String csvData = '';
  Future<void> getShareGeneralStock()async{

    emit(GetShareGeneralStockLoadingState());

    debugPrint(productIdShare);
    final response = await _generalStockRepo.shareGeneralStock(
      productIdType: productIdShare,
      startDate: extractDate(startDateTime.toString()),
      endDate: extractDate(endDateTime.toString()),
    );
    response.when(success: (shareWorkResponse) async {
      csvData = shareWorkResponse.data.csv.toString();

      emit(GetShareGeneralStockSuccessState());

    },failure: (error) {

      emit(GetShareGeneralStockErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  //******************************************************
  //*********        Share Pdf                ************
  //******************************************************

  Future<void> shareCsvAsPdf() async {
    final pdf = pw.Document();

    final rows = csvData.split('\n');
    if (rows.isEmpty) return;

    final headers = [
      'Supplier',
      'Product Name',
      'Quantity Before',
      'Quantity After',
      'Imported',
      'Exported',
      'Date'
    ];

    final dataRows = rows.skip(1).map((row) {
      final cells = row.split(',').map((cell) => cell.replaceAll('"', '').trim()).toList();
      return [
        cells[2], // Supplier
        cells[3], // Product Name
        cells[5], // Quantity Before
        cells[6], // Quantity After
        cells[7], // Imported
        cells[8], // Exported
        cells[9], // Date
      ];
    }).toList();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Table.fromTextArray(
            headers: headers,
            data: dataRows,
            border: pw.TableBorder.all(),
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            cellAlignment: pw.Alignment.center,
            headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
            columnWidths: {
              0: const pw.FixedColumnWidth(100), // Supplier
              1: const pw.FixedColumnWidth(100), // Product Name
              2: const pw.FixedColumnWidth(100), // Quantity Before
              3: const pw.FixedColumnWidth(100), // Quantity After
              4: const pw.FixedColumnWidth(80),  // Imported
              5: const pw.FixedColumnWidth(80),  // Exported
              6: const pw.FixedColumnWidth(120), // Date
            },
          ),
        ],
      ),
    );

    final tempDir = await getTemporaryDirectory();
    final file = File("${tempDir.path}/General_Stock_Report.pdf");
    await file.writeAsBytes(await pdf.save());

    // مشاركة الملف
    await Share.shareFiles([file.path], text: "Here is your filtered maintenance report as PDF");
  }
  //******************************************************
  //*********        share excel              ************
  //******************************************************
  Future<void> shareCsvAsExcel() async {
    final excel = Excel.createExcel();
    final sheet = excel['General Stock Report'];

    final headers = [
      'Supplier',
      'Product Name',
      'Quantity Before',
      'Quantity After',
      'Imported',
      'Exported',
      'Date'
    ];
    sheet.appendRow(headers);

    final rows = csvData.split('\n');
    rows.skip(1).forEach((row) {
      final cells = row.split(',').map((cell) => cell.replaceAll('"', '').trim()).toList();
      sheet.appendRow([
        cells[2], // Supplier
        cells[3], // Product Name
        cells[5], // Quantity Before
        cells[6], // Quantity After
        cells[7], // Imported
        cells[8], // Exported
        cells[9], // Date
      ]);
    });

    final tempDir = await getTemporaryDirectory();
    final file = File("${tempDir.path}/General_Stock_Report.xlsx");
    await file.writeAsBytes(excel.encode()!);

    await Share.shareFiles([file.path], text: "Here is your General Stock Report as Excel");
  }
}
