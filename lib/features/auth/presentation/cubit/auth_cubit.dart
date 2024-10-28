import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/auth/data/models/login_request_body.dart';
import 'package:roadapp/features/auth/data/repos/login_repo.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_state.dart';
import 'package:roadapp/features/auth/presentation/views/screens/organization_screen.dart';
import 'package:roadapp/features/auth/presentation/views/screens/person_screen.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginRepo) : super(AuthInitial());
  final LoginRepo _loginRepo;
  static AuthCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool visiblePassword = true;
  bool rememberMe = true;
  final registerPersonFormKey = GlobalKey<FormState>();
  final registerOrganizationFormKey = GlobalKey<FormState>();

  void userLogin(LoginRequestBody body) async {
    emit(AuthLoadingState());
    final response = await _loginRepo
        .login(LoginRequestBody(email: body.email, password: body.password));

    response.when(success: (loginResponse) async {
      if (rememberMe) {
        await CacheHelper()
            .saveData(CacheVars.accessToken, loginResponse.data?.token);
      } else {
        await CacheHelper().removeData(CacheVars.accessToken);
      }
      DefaultLogger.logger.t('Token: ${CacheHelper().getData(CacheVars.accessToken)}');
      emit(AuthSuccessState());
    }, failure: (error) {
      emit(AuthErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  createPersonAccount(
      String name, String phone, String email, String password) {
    emit(AuthSuccessState());
  }

  createOrganizationAccount(
      String organizationName,
      String landline,
      String taxNumber,
      String commercialNumber,
      String email,
      String password) {
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

  void changeRememberMeCheck(bool? val) {
    rememberMe = val!;
    emit(AppChangeRememberMeState());
  }

  int index = 0;

  void changeRegisterIndex(int index) {
    this.index = index;
    emit(ChangeLogInIndexState());
  }

  var infoFieldsList = [const PersonScreen(), const OrganizationScreen()];

  // person account
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();

  // company account

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyPhoneController = TextEditingController();
  final TextEditingController companyEmailController = TextEditingController();
  final TextEditingController companyPasswordController =
      TextEditingController();
  final TextEditingController taxRegistrationNumberController =
      TextEditingController();
  final TextEditingController commercialRegistrationNumberController =
      TextEditingController();
  final TextEditingController companyManagerNameController =
      TextEditingController();
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
    if (loginFormKey.currentState!.validate()) {
      userLogin(LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text.trim()));
    } else {
      return;
    }
  }

  validatePersonToSignUp() {
    if (registerPersonFormKey.currentState!.validate()) {
      createPersonAccount(nameController.text, phoneController.text,
          registerEmailController.text, registerPasswordController.text);
    } else {
      return;
    }
  }

  validateOrganizationToSignUp() {
    if (registerOrganizationFormKey.currentState!.validate()) {
      createOrganizationAccount(
          companyNameController.text,
          companyPhoneController.text,
          taxRegistrationNumberController.text,
          commercialRegistrationNumberController.text,
          companyEmailController.text,
          companyPasswordController.text);
    } else {
      return;
    }
  }
}