part of 'product_basket_cubit.dart';

@immutable
sealed class ProductBasketState {}

final class ProductBasketInitial extends ProductBasketState {}


final class ProductsTypeLoadingState extends ProductBasketState {}
final class ProductsTypeLoadingMoreState extends ProductBasketState {}

final class ProductsTypeSuccessState extends ProductBasketState {
  final List<Product>? productType;
  ProductsTypeSuccessState(this.productType);
}
final class ProductsTypeErrorState extends ProductBasketState {
  final String error;
  ProductsTypeErrorState(this.error);
}

final class SearchProductsTypeLoadingState extends ProductBasketState {}
final class SearchProductsTypeLoadingMoreState extends ProductBasketState {}
final class SearchProductsTypeErrorState extends ProductBasketState {
  final String error;
  SearchProductsTypeErrorState(this.error);
}

final class SearchProductsTypeSuccessState extends ProductBasketState {
  final List<Product>? serviceType;
  SearchProductsTypeSuccessState(this.serviceType);
}

final class AddProductsLoadingState extends ProductBasketState {}
final class AddProductsSuccessState extends ProductBasketState {}
final class AddProductsErrorState extends ProductBasketState {
  final String error;
  AddProductsErrorState(this.error);
}

final class SelectProductsProcessTypeState extends ProductBasketState {}
final class ProductsTypeDropDawnLoadingState extends ProductBasketState {}
final class ProductsTypeDropDawnLoadingMoreState extends ProductBasketState {}
final class ProductsTypeDropDawnErrorState extends ProductBasketState {
  final String error;
  ProductsTypeDropDawnErrorState(this.error);
}

final class ProductsTypeDropDawnSuccessState extends ProductBasketState {
  final List<ProductType>? productType;
  ProductsTypeDropDawnSuccessState(this.productType);
}

final class AddProductSuggestionLoadingState extends ProductBasketState {}
final class AddProductSuggestionSuccessState extends ProductBasketState {}
final class AddProductSuggestionErrorState extends ProductBasketState {
  final String error;
  AddProductSuggestionErrorState(this.error);
}


final class UpdateProductLoadingState extends ProductBasketState {}
final class UpdateProductSuccessState extends ProductBasketState {}
final class UpdateProductErrorState extends ProductBasketState {
  final String error;
  UpdateProductErrorState(this.error);
}


final class DeleteProductLoadingState extends ProductBasketState {}
final class DeleteProductSuccessState extends ProductBasketState {}
final class DeleteProductErrorState extends ProductBasketState {
  final String error;
  DeleteProductErrorState(this.error);
}