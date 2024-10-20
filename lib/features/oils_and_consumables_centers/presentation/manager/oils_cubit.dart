import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/oils_and_consumables_centers/presentation/manager/oils_state.dart';

class OilsCubit extends Cubit<OilsState> {
  OilsCubit() : super(OilsInitial());
  static OilsCubit get(context) => BlocProvider.of(context);

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