import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_state.dart';

class SparePartsCubit extends Cubit<SparePartsState> {
  SparePartsCubit() : super(SparePartsInitial());
  static SparePartsCubit get(context) => BlocProvider.of(context);

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
