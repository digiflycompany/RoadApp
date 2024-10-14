import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  InventoryCubit() : super(InventoryInitial());
  static InventoryCubit get(context) => BlocProvider.of(context);

  bool allClasses = false;
  bool class1 = false;
  bool class2 = false;
  bool class3 = false;

  void changeCheckBox(bool value, String box) {
    switch (box) {
      case 'allClasses':
        allClasses = value;
        break;
      case 'class1':
        class1 = value;
        break;
      case 'class2':
        class2 = value;
        break;
      case 'class3':
        class3 = value;
        break;
    }
    emit(BoxUpdatedState());
  }
}
