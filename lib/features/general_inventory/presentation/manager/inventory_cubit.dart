// ignore_for_file: avoid_print

import 'package:flutter/material.dart'; // ✅ needed for showDatePicker
import 'package:flutter/services.dart';
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
import 'package:share_plus/share_plus.dart';

class InventoryCubit extends Cubit<InventoryState> {
  InventoryCubit(this._generalStockRepo) : super(InventoryInitialState());
  final GetGeneralStockRepo _generalStockRepo;
  static InventoryCubit get(context) => BlocProvider.of(context);

  ///--------------------- START & END DATE ---------------------///
  DateTime startDateTime = DateTime.now();
  DateTime endDateTime = DateTime.now();

  void pickStartDate(context) async {
    final value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2050),
    );
    if (value != null) {
      startDateTime = DateTime(value.year, value.month, value.day);
      getInventoryRecord();
      emit(StartDateState());
    }
  }

  void pickEndDate(context) async {
    final value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2050),
    );
    if (value != null) {
      endDateTime = DateTime(value.year, value.month, value.day);
      getInventoryRecord();
      emit(EndDateState());
    }
  }

  String extractDate(String dateTime) {
    final date = DateTime.parse(dateTime);
    return DateFormat('yyyy-MM-dd').format(date);
  }

  ///--------------------- INVENTORY RECORDS ---------------------///
  int inventoryRecordPage = 1;
  List<InventoryRecord> inventoryRecord = [];
  String? productIdShare;

  Future<void> getInventoryRecord({
    int page = 1,
    int limit = 10,
    bool? more,
    final String? productId,
  }) async {
    productIdShare = productId;
    emit(more == true ? LoadingMoreState() : InventoryLoadingState());

    final token = await CacheHelper().getData(CacheVars.accessToken);
    print("Token ===> $token");

    final response = await _generalStockRepo.getGeneralStock(
      startDate: extractDate(startDateTime.toString()),
      endDate: extractDate(endDateTime.toString()),
      page: page,
      limit: limit,
      productId: productId,
    );

    response.when(success: (recordResponse) {
      if (more != true) {
        inventoryRecord = recordResponse.data?.records ?? [];
        inventoryRecordPage = 1;
      } else {
        inventoryRecord.addAll(recordResponse.data?.records ?? []);
        inventoryRecordPage++;
      }
      emit(InventorySuccessState(inventoryRecord: inventoryRecord));
    }, failure: (error) {
      emit(InventoryErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  ///--------------------- PRODUCTS ---------------------///
  int productPage = 1;
  List<GetAllProduct>? productList;

  Future<void> getAllProducts({
    int page = 1,
    int limit = 10,
    bool? more,
  }) async {
    emit(more == true ? GetProductLoadingMoreState() : GetProductLoadingState());

    String maintenanceCenterProfileIdKey =
        await CacheHelper().getData('MaintenanceCenterProfileIdKey');

    final response = await _generalStockRepo.getProduct(
      maintenanceCenterId: maintenanceCenterProfileIdKey,
      page: page,
      limit: limit,
    );

    response.when(success: (productResponse) {
      if (more != true) {
        productList = productResponse.data?.products ?? [];
        productPage = 1;
      } else {
        productList?.addAll(productResponse.data?.products ?? []);
        productPage++;
      }
      emit(GetProductSuccessState(products: productList));
    }, failure: (error) {
      emit(GetProductErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  ///--------------------- PRODUCT SELECTION ---------------------///
  final Set<String> selectedProducts = {};

  void toggleProductSelection(String? productId, bool isSelected) {
    if (isSelected) {
      selectedProducts.add(productId!);
    } else {
      selectedProducts.remove(productId);
    }
    emit(BoxUpdatedState());
  }

  void clearSelectedProducts() {
    selectedProducts.clear();
    emit(ClearSelectedProductsState(selectedProducts: selectedProducts));
  }

  void deselectAllClasses() {
    if (selectedProducts.isEmpty) return;
    emit(DeselectAllClassesState(selectedProducts: selectedProducts));
  }

    ///--------------------- LOCAL CSV GENERATION ---------------------///
  String csvData = '';

  String generateCsvFromRecords(List<InventoryRecord> records) {
    final headers = [
      "count",
      "supplier",
      "productName",
      "quantityBefore",
      "quantityAfter",
      "change"
    ];

    final buffer = StringBuffer();
    buffer.writeln(headers.join(','));

    for (int i = 0; i < records.length; i++) {
      final r = records[i];
      buffer.writeln([
        (i + 1), // ✅ row counter
        r.supplierName ?? "",
        r.product?.name ?? "", // ✅ product name
        r.quantityBefore,
        r.quantityAfter,
        r.change,
      ].join(','));
    }

    return buffer.toString();
  }


    //******************************************************
  //*********        Get Share Data (LOCAL)   ************
  //******************************************************

Future<void> getShareGeneralStock() async {
  try {
    if (inventoryRecord.isEmpty) {
      await getInventoryRecord(productId: productIdShare);
    }
    csvData = generateCsvFromRecords(inventoryRecord);
    print("Generated CSV Data:\n$csvData");
    // ❌ don’t emit anything here
  } catch (e) {
    print("Error generating CSV: $e");
  }
}


  ///--------------------- SHARE AS PDF (with Arabic) ---------------------///
 Future<void> shareCsvAsPdf() async {
  if (inventoryRecord.isEmpty) return;

  final csvData = generateCsvFromRecords(inventoryRecord);
  final rows =
      csvData.split('\n').where((r) => r.trim().isNotEmpty).toList();

  final headers = rows.first.split(',');
  final dataRows = rows.skip(1).map((r) => r.split(',')).toList();

  // ✅ load Arabic font properly
  final arabicFont = pw.Font.ttf(
    await rootBundle.load("assets/font/NotoKufiArabic-Regular.ttf"),
  );

  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        pw.Table(
          border: pw.TableBorder.all(),
          columnWidths: {
            0: const pw.FixedColumnWidth(40), // count
            1: const pw.FixedColumnWidth(100), // supplier
            2: const pw.FlexColumnWidth(3),   // productName expands
            3: const pw.FixedColumnWidth(60), // quantityBefore
            4: const pw.FixedColumnWidth(60), // quantityAfter
            5: const pw.FixedColumnWidth(50), // change
          },
          children: [
            // Header row
            pw.TableRow(
              decoration: const pw.BoxDecoration(color: PdfColors.grey300),
              children: headers.map((h) {
                return pw.Padding(
                  padding: const pw.EdgeInsets.all(4),
                  child: pw.Text(
                    h,
                    style: pw.TextStyle(
                      font: arabicFont,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 10,
                    ),
                    textDirection: pw.TextDirection.rtl, // ✅ Arabic direction
                  ),
                );
              }).toList(),
            ),
            // Data rows
            ...dataRows.map((row) {
              return pw.TableRow(
                children: row.map((cell) {
                  return pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text(
                      cell,
                      style: pw.TextStyle(font: arabicFont, fontSize: 10),
                      textDirection: pw.TextDirection.rtl, // ✅ Arabic support
                    ),
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ],
    ),
  );

  final tempDir = await getTemporaryDirectory();
  final file = File("${tempDir.path}/General_Stock_Report.pdf");
  await file.writeAsBytes(await pdf.save());

  await Share.shareXFiles(
    [XFile(file.path)],
    text: "Here is your General Stock Report as PDF",
  );
}


  ///--------------------- SHARE AS EXCEL (with Arabic) ---------------------///
  Future<void> shareCsvAsExcel() async {
    if (inventoryRecord.isEmpty) return;

    final csvData = generateCsvFromRecords(inventoryRecord);
    final rows =
        csvData.split('\n').where((r) => r.trim().isNotEmpty).toList();

    final excel = Excel.createExcel();
    final sheet = excel['General Stock Report'];

    // ✅ add rows (Arabic characters are preserved)
    for (final row in rows) {
      if (row.trim().isEmpty) continue;

      sheet.appendRow(
        row
            .split(',')
            .map((c) => TextCellValue(c.trim()))
            .toList(),
      );
    }
    // ✅ optional: style header row
    final headerCellStyle = CellStyle(
      bold: true,
      fontFamily: getFontFamily(FontFamily.Calibri), // Excel supports Arabic fonts like Calibri/Arial
    );

    for (int i = 0; i < rows.first.split(',').length; i++) {
      final cell = sheet.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0));
      cell.cellStyle = headerCellStyle;
    }

    final tempDir = await getTemporaryDirectory();
    final file = File("${tempDir.path}/General_Stock_Report.xlsx");
    await file.writeAsBytes(excel.encode()!);

    await Share.shareXFiles(
      [XFile(file.path)],
      text: "Here is your General Stock Report as Excel",
    );
  }


}
