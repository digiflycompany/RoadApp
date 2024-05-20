import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/modules/profile/cubit/states.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(InitialProfileState());



}