part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class CountriesDropDownLoadingState extends SearchState {}

final class CountriesDropDownLoadingMoreState extends SearchState {}

final class CountriesDropDownErrorState extends SearchState {
  final String error;
  CountriesDropDownErrorState(this.error);
}

final class CountriesDropDownSuccessState extends SearchState {
  final List<Country>? countries;
  CountriesDropDownSuccessState(this.countries);
}



final class CarBrandDropDawnLoadingState extends SearchState {}

final class CarBrandDropDawnLoadingMoreState extends SearchState {}

final class CarBrandDropDawnErrorState extends SearchState {
  final String error;
  CarBrandDropDawnErrorState(this.error);
}

final class CarBrandDropDawnSuccessState extends SearchState {
  final List<Brand>? carBrand;
  CarBrandDropDawnSuccessState(this.carBrand);
}
