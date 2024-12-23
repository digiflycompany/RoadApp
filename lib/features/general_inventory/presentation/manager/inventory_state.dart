import 'package:roadapp/features/general_inventory/data/models/get_all_products_response.dart';
import 'package:roadapp/features/general_inventory/data/models/get_general_stock_response.dart';

sealed class InventoryState {}

final class InventoryInitialState extends InventoryState {}

///------------------ DATE SELECTION ------------------///
final class StartDateState extends InventoryState {}

final class EndDateState extends InventoryState {}

///------------------ INVENTORY STATES ------------------///
final class InventoryLoadingState extends InventoryState {}

final class LoadingMoreState extends InventoryState {}

final class InventorySuccessState extends InventoryState {
  final List<InventoryRecord>? inventoryRecord;

  InventorySuccessState({required this.inventoryRecord});
}

final class InventoryErrorState extends InventoryState {
  final String error;

  InventoryErrorState(this.error);
}

///------------------ GET PRODUCTS STATES ------------------///
final class GetProductLoadingState extends InventoryState {}

final class GetProductLoadingMoreState extends InventoryState {}

final class GetProductSuccessState extends InventoryState {
  final List<GetAllProduct>? products;

  GetProductSuccessState({required this.products});
}

final class GetProductErrorState extends InventoryState {
  final String error;

  GetProductErrorState(this.error);
}

///------------------ CHECKBOX STATES ------------------///
final class BoxUpdatedState extends InventoryState {}

class InventoryUpdatedState extends InventoryState {
  final String? selectedProduct;

  InventoryUpdatedState({required this.selectedProduct});
}

final class ClearSelectedProductsState extends InventoryState {
  final Set<String> selectedProducts;

  ClearSelectedProductsState({required this.selectedProducts});
}

final class DeselectAllClassesState extends InventoryState {
  final Set<String> selectedProducts;

  DeselectAllClassesState({required this.selectedProducts});
}
