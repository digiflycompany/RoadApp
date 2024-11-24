sealed class SparePartsState {}

final class SparePartsInitial extends SparePartsState {}

final class BoxUpdatedState extends SparePartsState {}


final class GetSparePartsCenterLoading extends SparePartsState {}
final class GetSparePartsCenterSuccess extends SparePartsState {}
final class GetSparePartsCenterError extends SparePartsState {}

final class GetSparePartsCenterMoreLoading extends SparePartsState {}
final class GetSparePartsCenterMoreSuccess extends SparePartsState {}
final class GetSparePartsCenterMoreError extends SparePartsState {}