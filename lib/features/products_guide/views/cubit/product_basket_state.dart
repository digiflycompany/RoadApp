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