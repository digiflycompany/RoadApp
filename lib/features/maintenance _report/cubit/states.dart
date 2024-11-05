abstract class MaintenanceReportStates{}

class InitialMaintenanceReportState extends MaintenanceReportStates{}
class ExcelChosenState extends MaintenanceReportStates{}
class PDFChosenState extends MaintenanceReportStates{}
class PriceToggledState extends MaintenanceReportStates{}
class FilterToggledState extends MaintenanceReportStates{}

class GetReportsLoadingState extends MaintenanceReportStates{}
class GetReportsSuccessState extends MaintenanceReportStates{}
class GetReportsErrorState extends MaintenanceReportStates{}