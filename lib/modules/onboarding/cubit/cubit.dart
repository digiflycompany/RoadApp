import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/modules/onboarding/cubit/states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitState());

 static OnBoardingCubit get(context) => BlocProvider.of(context);
  bool checkBoxValue = false;


  changeCheckBoxValue(newState){
    checkBoxValue = newState;
    emit(ChangeCheckBoxValueState());
  }

}