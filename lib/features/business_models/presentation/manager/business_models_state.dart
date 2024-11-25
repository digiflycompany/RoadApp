sealed class BusinessModelsState {}

final class BusinessModelsInitial extends BusinessModelsState {}

final class ProcessTypeChanged extends BusinessModelsState {}

final class CheckToggled extends BusinessModelsState {}

final class AddProductState extends BusinessModelsState {}

final class GetProductLoading extends BusinessModelsState {}
final class GetProductSuccess extends BusinessModelsState {}
final class GetProductError extends BusinessModelsState {}
final class GetProductMoreLoading extends BusinessModelsState {}

final class GetMaintenanceCentersLoading extends BusinessModelsState {}
final class GetMaintenanceCentersSuccess extends BusinessModelsState {}
final class GetMaintenanceCentersError extends BusinessModelsState {}
final class GetMaintenanceCentersMoreLoading extends BusinessModelsState {}