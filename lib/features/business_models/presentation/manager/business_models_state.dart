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
final class DateTimeState extends BusinessModelsState {}
final class ExaminationTypeChangedState extends BusinessModelsState {}

final class AddPaymentVoucherLoadingState extends BusinessModelsState {}
final class AddPaymentVoucherErrorState extends BusinessModelsState {
  final String error;
  AddPaymentVoucherErrorState(this.error);
}
final class AddBillOfSellVoucherErrorState extends BusinessModelsState {
  final String error;
  AddBillOfSellVoucherErrorState(this.error);
}

final class AddReceiptVoucherErrorState extends BusinessModelsState {
  final String error;
  AddReceiptVoucherErrorState(this.error);
}
class AddPaymentVoucherSuccessState extends BusinessModelsState {}
class AddBillOfSellVoucherSuccessState extends BusinessModelsState {}

class AddReceiptVoucherSuccessState extends BusinessModelsState {}
class AddReceiptVoucherSuccessLoadingState extends BusinessModelsState {}

class AddFullScanReportSuccessState extends BusinessModelsState {}
class AddFullScanReportLoadingState extends BusinessModelsState {}
final class AddFullScanReportErrorState extends BusinessModelsState {
  final String error;
  AddFullScanReportErrorState(this.error);
}


final class GetUserDataLoading extends BusinessModelsState {}
final class GetUserDataSuccess extends BusinessModelsState {}
final class GetUserDataError extends BusinessModelsState {}


class ReportValuesUpdated extends BusinessModelsState {
  final Map<String, int> updatedValues;

  ReportValuesUpdated(this.updatedValues);
}