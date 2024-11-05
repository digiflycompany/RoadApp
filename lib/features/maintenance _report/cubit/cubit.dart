import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';

import '../data/models/list_reports_model.dart';
import '../data/repo/report_repo.dart';

class MaintenanceReportCubit extends Cubit<MaintenanceReportStates> {
  MaintenanceReportCubit(this._reportRepo) : super(InitialMaintenanceReportState());
  final ReportRepo _reportRepo;

  static MaintenanceReportCubit get(context) => BlocProvider.of(context);


  bool checkBoxDate = false;

  bool checkBoxService = false;

  bool checkBoxPrice = false;

  bool checkBoxCenter = false;

  bool checkBoxProduct = false;

  bool selectPrice = false;

  bool jan = false;
  bool feb = false;
  bool mar = false;
  bool apr = false;
  bool may = false;
  bool jun = false;
  bool jul = false;
  bool aug = false;
  bool sep = false;
  bool oct = false;
  bool nov = false;
  bool dec = false;

  bool excel = true;
  bool pdf = false;

  setExcel() {
    if (excel) {
      return;
    } else {
      excel = true;
      pdf = false;
      emit(ExcelChosenState());
    }
  }

  setPDF() {
    if (pdf) {
      return;
    } else {
      pdf = true;
      excel = false;
      emit(PDFChosenState());
    }
  }

  togglePrice() {
    selectPrice = !selectPrice;
    emit(PriceToggledState());
  }

  toggleFilterCheck(String boxTitle, BuildContext context) {
    boxTitle == StringManager.date.tr(context)
        ? checkBoxDate = !checkBoxDate
        : boxTitle == StringManager.service.tr(context)
            ? checkBoxService = !checkBoxService
            : boxTitle == StringManager.price.tr(context)
                ? checkBoxPrice = !checkBoxPrice
                : boxTitle == StringManager.center.tr(context)
                    ? checkBoxCenter = !checkBoxCenter
                    : boxTitle == StringManager.product.tr(context)
                        ? checkBoxProduct = !checkBoxProduct
                        : null;
    emit(FilterToggledState());
  }

  ReportResponse? reportsResponses;
  void getReports(String parameterValue) async {
    emit( GetReportsLoadingState());
    final response = await _reportRepo.getReports(parameterValue);

    response.when(
      success: (reportsResponse){
        reportsResponses = reportsResponse;
        debugPrint(reportsResponse.toString());
        emit(GetReportsSuccessState());
      },
      failure: (error){
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetReportsErrorState());
      },
    );
  }
}
