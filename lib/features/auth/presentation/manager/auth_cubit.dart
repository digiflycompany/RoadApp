import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_state.dart';
import 'package:roadapp/features/auth/presentation/views/screens/organization_screen.dart';
import 'package:roadapp/features/auth/presentation/views/screens/person_screen.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool visiblePassword = true;
  bool rememberMe = true;
  final formSignInKey = GlobalKey<FormState>();

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(AuthSuccessState());
  }

  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    suffix = visiblePassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(AppChangePasswordVisibilityState());
  }

  void changeRememberMeCheck(bool ? val){
    rememberMe = val!;
    emit(AppChangeRememberMeState());
  }


  int index = 0;

  void changeRegisterIndex(int index) {
    this.index = index;
    emit(ChangeLogInIndexState());
  }

  var infoFieldsList = [
    const PersonScreen(),
    const OrganizationScreen(),
  ];

  // person account
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();

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

  bool visibleRegisterPassword = true;
  final loginFormKey = GlobalKey<FormState>();

  IconData registerSuffix = Icons.visibility_off_outlined;

  void changeRegisterPasswordVisibility() {
    visiblePassword = !visiblePassword;
    suffix = visiblePassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(AppChangePasswordVisibilityState());
  }

  void changeUserType(int index) {
    selectedRadioValue = index;
    emit(ChangeUserTypeState());
  }

  validateToLogin() {
    if(loginFormKey.currentState!.validate()) {
      userLogin(email: emailController.text, password: passwordController.text);
    } else {
      return;
    }
  }
}
