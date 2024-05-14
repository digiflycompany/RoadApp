import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp2/modules/maintenance%20_report/cubit/states.dart';

class MaintenanceReportCubit extends Cubit<MaintenanceReportStates>{
  MaintenanceReportCubit(): super(InitialMaintenanceReportState());

  static MaintenanceReportCubit get(context)=> BlocProvider.of(context);

   bool checkBoxDate = false;

   bool checkBoxService = false;

   bool checkBoxPrice = false;

   bool checkBoxCenter = false;

   bool checkBoxProduct = false;

   bool selectPrice = false;


}