import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/modules/register/cubit/states.dart';
import 'package:roadapp/modules/register/views/screens/company_screen.dart';
import 'package:roadapp/modules/register/views/screens/person_screen.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(AppRegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  int index = 0;

  // int userType = 0;

  var list = [
    const PersonScreen(),
    const CompanyScreen(),
  ];

  // person account
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // company account

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyPhoneController = TextEditingController();
  final TextEditingController companyEmailController = TextEditingController();
  final TextEditingController companyPasswordController = TextEditingController();
  final TextEditingController taxRegistrationNumberController = TextEditingController();
  final TextEditingController commercialRegistrationNumberController = TextEditingController();
  final TextEditingController companyManagerNameController = TextEditingController();
  final TextEditingController managerPhoneController = TextEditingController();

  int selectedRadioValue = 0;

  bool visiblePassword = true;
  final formKey = GlobalKey<FormState>();

  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    suffix = visiblePassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(AppChangePasswordVisibilityState());
  }

  void changeRegisterIndex(int index) {
    this.index = index;
    emit(ChangeRegisterIndexState());
  }

  void changeUserType(int index) {
    selectedRadioValue = index;
    emit(ChangeUsetTypeState());
  }
}
