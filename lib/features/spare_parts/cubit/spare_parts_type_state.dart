part of 'spare_parts_type_cubit.dart';

@immutable
sealed class SparePartsTypeState {}

final class SparePartsTypeInitial extends SparePartsTypeState {}


final class GetProductTypeLoading extends SparePartsTypeState {}
final class GetProductTypeSuccess extends SparePartsTypeState {}
final class GetProductTypeError extends SparePartsTypeState {}


final class GetProductTypeMoreLoading extends SparePartsTypeState {}
final class GetProductTypeMoreSuccess extends SparePartsTypeState {}
final class GetProductTypeMoreError extends SparePartsTypeState {}


final class GetSearchProductTypeLoading extends SparePartsTypeState {}
final class GetSearchProductTypeSuccess extends SparePartsTypeState {}
final class GetSearchProductTypeError extends SparePartsTypeState {}


final class GetSearchProductTypeMoreLoading extends SparePartsTypeState {}
final class GetSearchProductTypeMoreSuccess extends SparePartsTypeState {}
final class GetSearchProductTypeMoreError extends SparePartsTypeState {}