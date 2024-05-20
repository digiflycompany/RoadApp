import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/modules/maintenance%20_report/cubit/states.dart';

class MaintenanceReportCubit extends Cubit<MaintenanceReportStates>{
  MaintenanceReportCubit(): super(InitialMaintenanceReportState());

  static MaintenanceReportCubit get(context)=> BlocProvider.of(context);

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


}