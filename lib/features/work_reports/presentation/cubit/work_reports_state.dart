part of 'work_reports_cubit.dart';

@immutable
sealed class WorkReportsState {}

final class WorkReportsInitial extends WorkReportsState {}
final class StartDateTimeState extends WorkReportsState {}
final class EndDateTimeState extends WorkReportsState {}

final class StartDateTimeFullScanState extends WorkReportsState {}
final class EndDateTimeFullScanState extends WorkReportsState {}

final class ApproveWorkReportsLoadingState extends WorkReportsState {}
final class ApproveWorkReportsSuccessState extends WorkReportsState {}
final class ApproveWorkReportsErrorState extends WorkReportsState {
  final String error;
  ApproveWorkReportsErrorState(this.error);
}

final class ShareFullScanErrorState extends WorkReportsState {
  final String error;
  ShareFullScanErrorState(this.error);
}

final class DeclineWorkReportsLoadingState extends WorkReportsState {}
final class DeclineWorkReportsSuccessState extends WorkReportsState {}
final class DeclineWorkReportsErrorState extends WorkReportsState {
  final String error;
  DeclineWorkReportsErrorState(this.error);
}


final class SelectProcessTypeState extends WorkReportsState {}
final class FetchWorkReportsLoadingState extends WorkReportsState {}
final class FetchWorkReportsLoadingMoreState extends WorkReportsState {}
final class FetchWorkReportsSuccessState extends WorkReportsState {
  final List<DocumentWorkReports>? workReports;
  FetchWorkReportsSuccessState(this.workReports);
}
final class FetchWorkReportsErrorState extends WorkReportsState {
  final String error;
  FetchWorkReportsErrorState(this.error);
}

final class GetShareWorkReportsLoadingState extends WorkReportsState {}
final class GetShareWorkReportsSuccessState extends WorkReportsState {}
final class GetShareWorkReportsErrorState extends WorkReportsState {
  final String error;
  GetShareWorkReportsErrorState(this.error);
}


final class FetchFullScanReportsLoadingState extends WorkReportsState {}
final class FetchFullScanReportsLoadingMoreState extends WorkReportsState {}
final class FetchFullScanReportsSuccessState extends WorkReportsState {
  final List<Report>? servicesReports;
  FetchFullScanReportsSuccessState(this.servicesReports);
}
final class FetchFullScanReportsErrorState extends WorkReportsState {
  final String error;
  FetchFullScanReportsErrorState(this.error);
}