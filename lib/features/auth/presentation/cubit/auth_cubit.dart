import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/auth/data/models/login_request_body.dart';
import 'package:roadapp/features/auth/data/models/client_register_request_body.dart';
import 'package:roadapp/features/auth/data/models/provider_register_request_body.dart';
import 'package:roadapp/features/auth/data/repos/auth_repo.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_state.dart';
import 'package:roadapp/features/auth/presentation/views/screens/organization_screen.dart';
import 'package:roadapp/features/auth/presentation/views/screens/person_screen.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;
  static AuthCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool visiblePassword = true;
  bool rememberMe = true;
  final registerPersonFormKey = GlobalKey<FormState>();
  final registerOrganizationFormKey = GlobalKey<FormState>();

  void userLogin(LoginRequestBody body) async {
    emit(AuthLoadingState());
    final response = await _authRepo.login(body);

    response.when(success: (loginResponse) async {
      if (rememberMe) {
        await CacheHelper()
            .saveData(CacheVars.accessToken, loginResponse.data?.token);
      }
      DefaultLogger.logger
          .t('Token: ${CacheHelper().getData(CacheVars.accessToken)}');
      await CacheHelper().saveData(CacheVars.isVerified, loginResponse.data?.user?.isVerified);
      await CacheHelper().saveData(CacheVars.isVendor, loginResponse.data?.user?.role == 'PROVIDER');
      emit(AuthSuccessState());
    }, failure: (error) {
      emit(AuthErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  createPersonAccount(ClientRegisterRequestBody body) async {
    emit(AuthLoadingState());
    final response = await _authRepo.clientSignUp(body);
    response.when(success: (registerResponse) async {
      await CacheHelper()
          .saveData(CacheVars.accessToken, registerResponse.data?.token);
      await CacheHelper().saveData(CacheVars.isVendor, registerResponse.data?.user?.role == 'PROVIDER');
      emit(AuthSuccessState());
    }, failure: (error) {
      emit(AuthErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  createOrganizationAccount(ProviderRegisterRequestBody body) async {
    emit(AuthLoadingState());
    final response = await _authRepo.providerSignUp(body);
    response.when(success: (registerResponse) async {
      emit(AuthSuccessState());
    }, failure: (error) {
      emit(AuthErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
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
  final TextEditingController firstLineController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
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
      createPersonAccount(ClientRegisterRequestBody(
          email: registerEmailController.text.trim(),
          password: registerPasswordController.text.trim(),
          fullName: nameController.text.trim(),
          phoneNumber: phoneController.text.trim(),
          countryId: '3KTQrk5J1o'));
    } else {
      return;
    }
  }

  validateOrganizationToSignUp() {
    if (registerOrganizationFormKey.currentState!.validate()) {
      createOrganizationAccount(ProviderRegisterRequestBody(
          email: companyEmailController.text.trim(),
          password: companyPasswordController.text.trim(),
          countryId: '3KTQrk5J1o',
          fullName: companyManagerNameController.text.trim(),
          phoneNumber: managerPhoneController.text.trim(),
          maintenanceCenter: MaintenanceCenter(
              name: companyNameController.text.trim(),
              address: Address(
                  firstLine: firstLineController.text.trim(),
                  city: cityController.text.trim()),
              landline: companyPhoneController.text.trim(),
              taxRegistrationNo: taxRegistrationNumberController.text.trim(),
              commercialRegistrationNo:
                  commercialRegistrationNumberController.text.trim(),
              countryId: '3KTQrk5J1o')));
    } else {
      return;
    }
  }
}
