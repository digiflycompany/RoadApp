import 'package:roadapp/features/search/data/models/countries_model.dart';

sealed class CountriesState {}
final class CountriesInitial extends CountriesState {}
final class SetCountryLoadingState extends CountriesState {}
final class CountrySelectionSuccessState extends CountriesState {}
final class MoreLoadingState extends CountriesState {}
final class FetchingCountriesLoadingState extends CountriesState {}
final class CountrySelectedState extends CountriesState {}
final class SetCountryErrorState extends CountriesState {
  final String error;
  SetCountryErrorState(this.error);
}
final class CountriesErrorState extends CountriesState {
  final String error;
  CountriesErrorState(this.error);
}
final class CountriesSuccessState extends CountriesState {
  final List<Country> countries;
  CountriesSuccessState(this.countries);
}