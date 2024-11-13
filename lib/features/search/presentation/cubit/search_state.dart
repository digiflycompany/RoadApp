part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}


final class GetCountriesLoading extends SearchState {}
final class GetCountriesSuccess extends SearchState {}
final class GetCountriesError extends SearchState {}


final class GetCountriesMoreLoading extends SearchState {}
final class GetCountriesMoreSuccess extends SearchState {}
final class GetCountriesMoreError extends SearchState {}



final class GetCarBrandLoading extends SearchState {}
final class GetCarBrandSuccess extends SearchState {}
final class GetCarBrandError extends SearchState {}


final class GetCarBrandMoreLoading extends SearchState {}
final class GetCarBrandMoreSuccess extends SearchState {}
final class GetCarBrandMoreError extends SearchState {}