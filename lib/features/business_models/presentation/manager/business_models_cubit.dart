import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

class BusinessModelsCubit extends Cubit<BusinessModelsState> {
  BusinessModelsCubit() : super(BusinessModelsInitial());

  static BusinessModelsCubit get(context) => BlocProvider.of(context);

  int selectedRadio = 1;

  bool checked = false;

  toggleCheckBox() {
    checked =!checked;
    emit(CheckToggled());
  }

  changeRadio(int processNumber) {
    selectedRadio = processNumber;
    emit(ProcessTypeChanged());
  }
}
