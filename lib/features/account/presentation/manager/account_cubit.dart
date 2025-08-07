import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';
import 'package:roadapp/features/account/data/models/account_response.dart';
import 'package:roadapp/features/account/data/models/update_mc_request_body.dart';
import 'package:roadapp/features/account/data/models/update_profile_request_body.dart';
import 'package:roadapp/features/account/data/models/upload_image_request.dart';
import 'package:roadapp/features/account/data/repo/account_repo.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../maintenance_centers/data/models/maintenance_center_model.dart';
import '../../../spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';
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

  String? name;
  validateToSave() {
    name = nameController.text.trim();
    if (userFormKey.currentState!.validate()) saveInfo();
  }

  validateVendorToSave() {
    name = nameController.text.trim();
    if (vendorFormKey.currentState!.validate()) saveInfo();
  }

  mcToSave() {
    if (mCFormKey.currentState!.validate()) saveMcInfo();
  }

  Future<bool> uploadImage() async {
    emit(UploadImageLoadingState());
    final response = await _accountRepo.uploadImage(image!);
    return response.when(
      success: (uploadResponse) {
        imageUrl = uploadResponse.file.path;
        emit(UploadImageSuccessState());
        return true;
      },
      failure: (error) {
        emit(UploadImageErrorState(
            error.apiErrorModel.message ?? 'Unknown Error!'));
        return false;
      },
    );
  }

  saveInfo() async {
    emit(UpdateProfileLoadingState());
    if (image != null) {
      bool uploaded = await uploadImage();
      if (!uploaded) return;
    }

    final response = await _accountRepo.updateProfile(UpdateProfileRequestBody(
        fullName: nameController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        email: emailController.text.trim(),
        picture: imageUrl,
        password: passwordController.text.trim()));

    response.when(
        success: (updateResponse) async {
          await CacheHelper().saveData('profileImageUrl', imageUrl);
          await CacheHelper().saveData(CacheVars.userName, name);
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
      imageUrl =
          accountResponse.data!.user!.maintenanceCenter!.picture.toString();
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
      nameController.text = userUser!.fullName ?? '';
      phoneController.text = userUser!.phoneNumber ?? '';
      emailController.text = userUser!.email ?? '';
      passwordController.text = '';
      imageUrl = userUser!.picture ?? '';
      // cityController.text = user!.maintenanceCenter!.address!.city ?? '';
      // firstLineController.text = user!.maintenanceCenter!.address!.firstLine ?? '';
      emit(AccountUserSuccessState(accountsResponse.data!));
    }, failure: (error) {
      emit(AccountErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  saveMcInfo() async {
    emit(UpdateMcLoadingState());
    if (image != null) {
      await uploadImage();
    }
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

  int maintenancePage = 1;
  List<Service>? serviceType;

  fetchMaintenanceServiceType(
      {int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      emit(ServicesTypeLoadingMoreState());
    } else {
      emit(ServicesTypeLoadingState());
    }
    String maintenanceCenterProfileIdKey =
        CacheHelper().getData('MaintenanceCenterProfileIdKey');

    final response = await _accountRepo.getMaintenanceServiceType(
      page: page,
      limit: limit,
      maintenanceCenterId: maintenanceCenterProfileIdKey,
    );

    response.when(success: (maintenanceServiceTypeResponse) async {
      if (more != true) {
        serviceType = maintenanceServiceTypeResponse.data?.services;
        maintenancePage = 1;
      } else {
        serviceType
            ?.addAll(maintenanceServiceTypeResponse.data?.services ?? []);
        maintenancePage++;
      }
      emit(ServiceTypeSuccessState(serviceType));
    }, failure: (error) {
      emit(ServicesTypeErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  int productsPage = 1;
  List<Product>? productType;

  fetchProductType({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      emit(ProductsTypeLoadingMoreState());
    } else {
      emit(ProductsTypeLoadingState());
    }
    String maintenanceCenterProfileIdKey =
        CacheHelper().getData('MaintenanceCenterProfileIdKey');

    final response = await _accountRepo.getProductType(
      page: page,
      limit: limit,
      maintenanceCenterId: maintenanceCenterProfileIdKey,
    );

    response.when(success: (productTypeResponse) async {
      if (more != true) {
        productType = productTypeResponse.data?.products;
        productsPage = 1;
      } else {
        productType?.addAll(productTypeResponse.data?.products ?? []);
        productsPage++;
      }
      emit(ProductsTypeSuccessState(productType));
    }, failure: (error) {
      emit(ProductsTypeErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  // take image from user
  void takeImage(value) {
    image = value;
    emit(TakeImageFromUserState());
  }
}
