import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/features/account/data/models/account_response.dart';
import 'package:roadapp/features/account/data/models/update_profile_request_body.dart';
import 'package:roadapp/features/account/data/repo/account_repo.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this._accountRepo) : super(AccountInitial());
  static AccountCubit get(context) => BlocProvider.of(context);
  final userFormKey = GlobalKey<FormState>();
  final vendorFormKey = GlobalKey<FormState>();
  final AccountRepo _accountRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget userImage = Container(
      width: 110.w,
      height: 110.h,
      decoration: const BoxDecoration(
          color: AppColors.emptyImageColor, shape: BoxShape.circle),
      child: Center(
          child: SvgPicture.asset(AppAssets.emptyImageIcon,
              width: 50, height: 50)));

  User? user;

  changeUserImage(Widget image) {
    userImage = image;
    emit(ChangeImageSuccessState());
  }

  deleteAccount() {
    emit(DeleteAccountSuccessState());
  }

  validateToSave() {
    if (userFormKey.currentState!.validate()) saveInfo();
  }

  validateVendorToSave() {
    if (vendorFormKey.currentState!.validate()) saveInfo();
  }

  saveInfo() async {
    emit(UpdateProfileLoadingState());
    final response = await _accountRepo.updateProfile(UpdateProfileRequestBody(
        fullName: nameController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim()));
    response.when(
        success: (updateResponse) {
          emit(UpdateProfileSuccessState());
        },
        failure: (error) => emit(UpdateProfileErrorState(
            error.apiErrorModel.message ?? 'Unknown Error!')));
  }

  fetchAccount() async {
    emit(AccountLoadingState());
    final response = await _accountRepo.fetchAccount();
    response.when(success: (accountResponse) {
      user = accountResponse.data?.user;
      emit(AccountSuccessState(accountResponse.data!));
    }, failure: (error) {
      emit(AccountErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}
