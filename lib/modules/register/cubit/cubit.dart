import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp2/modules/register/cubit/states.dart';
import 'package:roadapp2/modules/register/views/screens/company_screen.dart';
import 'package:roadapp2/modules/register/views/screens/person_screen.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(AppRegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  int index = 0;

 // int userType = 0;

  var list = [
    const PersonScreen(),
    const CompanyScreen(),
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  int selectedRadioValue = 0;

  bool visiblePassword = true;
  final formKey = GlobalKey<FormState>();



  void changeRegisterIndex(int index){
     this.index = index;
     emit(ChangeRegisterIndexState());
  }

  void changeUserType(int index){
    selectedRadioValue = index;
     emit(ChangeUsetTypeState());
  }



}
