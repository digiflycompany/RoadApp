import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/maintenance_centers/presentation/manager/maintenance_state.dart';

class MaintenanceCubit extends Cubit<MaintenanceState> {
  MaintenanceCubit() : super(MaintenanceInitial());
  static MaintenanceCubit get(context) => BlocProvider.of(context);

  bool mostAffordable = false;
  bool nearestCheckbox = false;
  bool mostRatedCheckbox = false;

  void changeCheckBox(bool value, String box) {
    switch (box) {
      case 'affordable':
        mostAffordable = value;
        break;
      case 'closest':
        nearestCheckbox = value;
        break;
      case 'highest':
        mostRatedCheckbox = value;
        break;
    }
    emit(BoxUpdatedState());
  }
}