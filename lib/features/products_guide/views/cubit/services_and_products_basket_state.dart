part of 'services_and_products_basket_cubit.dart';

@immutable
sealed class ServicesAndProductsBasketState {}

final class ServicesAndProductsBasketInitial extends ServicesAndProductsBasketState {}

final class ServicesAndProductsBasketLoadingState extends ServicesAndProductsBasketState {}
final class ServicesAndProductsBasketLoadingMoreState extends ServicesAndProductsBasketState {}
final class ServicesAndProductsBasketErrorState extends ServicesAndProductsBasketState {
  final String error;
  ServicesAndProductsBasketErrorState(this.error);
}

final class MaintenanceServiceSuccessState extends ServicesAndProductsBasketState {
  final List<ServiceType>? serviceType;
  MaintenanceServiceSuccessState(this.serviceType);
}


final class SearchServicesAndProductsBasketLoadingState extends ServicesAndProductsBasketState {}
final class SearchServicesAndProductsBasketLoadingMoreState extends ServicesAndProductsBasketState {}
final class SearchServicesAndProductsBasketErrorState extends ServicesAndProductsBasketState {
  final String error;
  SearchServicesAndProductsBasketErrorState(this.error);
}
final class SearchMaintenanceServiceSuccessState extends ServicesAndProductsBasketState {
  final List<ServiceType>? serviceType;
  SearchMaintenanceServiceSuccessState(this.serviceType);
}
