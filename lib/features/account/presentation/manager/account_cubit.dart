import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';
import 'package:roadapp/features/account/data/models/account_response.dart';
import 'package:roadapp/features/account/data/models/update_mc_request_body.dart';
import 'package:roadapp/features/account/data/models/update_profile_request_body.dart';
import 'package:roadapp/features/account/data/models/upload_image_request.dart';
import 'package:roadapp/features/account/data/repo/account_repo.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';

import '../../data/models/profile_user_response.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this._accountRepo) : super(AccountInitial());

  static AccountCubit get(context) => BlocProvider.of(context);
  final userFormKey = GlobalKey<FormState>();
  final vendorFormKey = GlobalKey<FormState>();
  final mCFormKey = GlobalKey<FormState>();
  final AccountRepo _accountRepo;

  XFile? image;
  String? imageUrl;

  TextEditingController nameController = TextEditingController();
  TextEditingController nameMcController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController firstLineController = TextEditingController();
  TextEditingController landLineController = TextEditingController();

  // Widget userImage = Container(
  //   width: 110.w,
  //   height: 110.h,
  //   decoration: const BoxDecoration(
  //       color: AppColors.emptyImageColor, shape: BoxShape.circle),
  //   child: Center(
  //     child: SvgPicture.asset(
  //       AppAssets.emptyImageIcon,
  //       width: 50,
  //       height: 50,
  //     ),
  //   ),
  // );

  User? user;
  UserUser? userUser;
  UserData? userData;

  // changeUserImage(Widget image) {
  //   userImage = image;
  //   emit(ChangeImageSuccessState());
  // }

  deleteAccount() {
    emit(DeleteAccountSuccessState());
  }

  validateToSave() {
    if (userFormKey.currentState!.validate()) saveInfo();
  }

  validateVendorToSave() {
    if (vendorFormKey.currentState!.validate()) saveInfo();
  }

  mcToSave() {
    if (mCFormKey.currentState!.validate()) saveMcInfo();
  }

  uploadImage() async {
    emit(UploadImageLoadingState());
    final response = await _accountRepo.uploadImage(image!);
    response.when(
        success: (uploadResponse) {
          imageUrl = uploadResponse.file.path;
          emit(UploadImageSuccessState());
        },
        failure: (error) => emit(UploadImageErrorState(
            error.apiErrorModel.message ?? 'Unknown Error!')));
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
      nameMcController.text = user!.maintenanceCenter!.name ?? '';
      landLineController.text = user!.maintenanceCenter!.landline ?? '';
      cityController.text = user!.maintenanceCenter!.address!.city ?? '';
      firstLineController.text =
          user!.maintenanceCenter!.address!.firstLine ?? '';
      userData = accountResponse.data!;
      emit(AccountSuccessState());
    }, failure: (error) {
      emit(AccountErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  fetchAccountUser() async {
    emit(AccountLoadingState());
    final response = await _accountRepo.fetchUserAccount();
    response.when(success: (accountsResponse) {
      userUser = accountsResponse.data!.user;
      nameMcController.text = user!.fullName ?? '';
      phoneController.text = user!.phoneNumber ?? '';
      emailController.text = user!.email ?? '';
      passwordController.text = '';
      // cityController.text = user!.maintenanceCenter!.address!.city ?? '';
      // firstLineController.text = user!.maintenanceCenter!.address!.firstLine ?? '';
      emit(AccountUserSuccessState(accountsResponse.data!));
    }, failure: (error) {
      emit(AccountErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  saveMcInfo() async {
    emit(UpdateMcLoadingState());
    await uploadImage();
    final response = await _accountRepo.updateMcProfile(
      UpdateMcRequestBody(
        name: nameMcController.text,
        landline: landLineController.text,
        //picture: await GeneralFunctions.uploadImageToApi(image!) ?? '',
        picture: imageUrl,
        address: AddressMc(
            firstLine: firstLineController.text, city: cityController.text),
      ),
    );

    response.when(
        success: (updateResponse) {
          emit(UpdateMcSuccessState());
        },
        failure: (error) => emit(UpdateMcErrorState(
            error.apiErrorModel.message ?? 'Unknown Error!')));
  }

  // take image from user
  void takeImage(value) {
    image = value;
    emit(TakeImageFromUserState());
  }


}
