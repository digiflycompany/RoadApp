part of 'work_reports_cubit.dart';

@immutable
sealed class WorkReportsState {}

final class WorkReportsInitial extends WorkReportsState {}
final class StartDateTimeState extends WorkReportsState {}
final class EndDateTimeState extends WorkReportsState {}



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

