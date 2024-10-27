import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
  static AccountCubit get(context) => BlocProvider.of(context);
  final userFormKey = GlobalKey<FormState>();
  final vendorFormKey = GlobalKey<FormState>();

  Widget userImage = Container(
      width: 110.w,
      height: 110.h,
      decoration: const BoxDecoration(
          color: AppColors.emptyImageColor, shape: BoxShape.circle),
      child: Center(
          child: SvgPicture.asset(AppAssets.emptyImageIcon,
              width: 50, height: 50)));
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
    if (vendorFormKey.currentState!.validate()) saveVendorInfo();
  }

  saveInfo() {
    emit(UpdateProfileSuccessState());
    Future.delayed(const Duration(seconds: 1)).then((value) => emit(AccountInitial()));
  }

  saveVendorInfo() {
    emit(UpdateProfileSuccessState());
    Future.delayed(const Duration(seconds: 1)).then((value) => emit(AccountInitial()));
  }
}