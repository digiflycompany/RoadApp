import '../../work_reports/data/models/full_scan_report_response.dart';

abstract class MaintenanceReportStates{}

class InitialMaintenanceReportState extends MaintenanceReportStates{}
class ExcelChosenState extends MaintenanceReportStates{}
class PDFChosenState extends MaintenanceReportStates{}
class PriceToggledState extends MaintenanceReportStates{}
class FilterToggledState extends MaintenanceReportStates{}

class GetReportsLoadingState extends MaintenanceReportStates{}
class GetReportsSuccessState extends MaintenanceReportStates{}
class GetReportsErrorState extends MaintenanceReportStates{}


class PostRequestLoadingState extends MaintenanceReportStates{}
class PostRequestSuccessState extends MaintenanceReportStates{}
class PostRequestErrorState extends MaintenanceReportStates{}


class ReportsLoadingMoreState extends MaintenanceReportStates{}
class ReportsSuccessMoreState extends MaintenanceReportStates{}
class ReportsErrorMoreState extends MaintenanceReportStates{}
class StartDateState extends MaintenanceReportStates{}
class EndDateState extends MaintenanceReportStates{}
class SelectReportTypeState extends MaintenanceReportStates{}
class SelectProcessTypeState extends MaintenanceReportStates{}

final class FetchFullScanReportsLoadingState extends MaintenanceReportStates {}
final class FetchFullScanReportsLoadingMoreState extends MaintenanceReportStates {}
final class FetchFullScanReportsSuccessState extends MaintenanceReportStates {
  final List<FullScanReport>? servicesReports;
  FetchFullScanReportsSuccessState(this.servicesReports);
}
final class FetchFullScanReportsErrorState extends MaintenanceReportStates {
  final String error;
  FetchFullScanReportsErrorState(this.error);
}