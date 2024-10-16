import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/accessories_centers/presentation/manager/accessories_state.dart';

class AccessoriesCubit extends Cubit<AccessoriesState> {
  AccessoriesCubit() : super(AccessoriesInitial());
  static AccessoriesCubit get(context) => BlocProvider.of(context);

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
