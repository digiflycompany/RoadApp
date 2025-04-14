import 'package:roadapp/features/account/data/models/account_response.dart';

import '../../../maintenance_centers/data/models/maintenance_center_model.dart';
import '../../../spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';
import '../../data/models/profile_user_response.dart';

sealed class AccountState {}

final class AccountInitial extends AccountState {}
final class ChangeImageSuccessState extends AccountState {}
final class DeleteAccountSuccessState extends AccountState {}
final class UpdateProfileSuccessState extends AccountState {}
final class UpdateProfileErrorState extends AccountState {
  final String errorMessage;
  UpdateProfileErrorState(this.errorMessage);
}
final class UpdateProfileLoadingState extends AccountState {}
final class AccountLoadingState extends AccountState {}
final class AccountErrorState extends AccountState {
  final String errorMessage;
  AccountErrorState(this.errorMessage);
}
final class AccountSuccessState extends AccountState {
  AccountSuccessState();
}

final class AccountUserSuccessState extends AccountState {
  final UserDataUser userData;
  AccountUserSuccessState(this.userData);
}

final class UpdateMcSuccessState extends AccountState {}
final class UpdateMcErrorState extends AccountState {
  final String errorMessage;
  UpdateMcErrorState(this.errorMessage);
}

final class UpdateMcLoadingState extends AccountState {}
final class TakeImageFromUserState extends AccountState {}

final class UploadImageLoadingState extends AccountState {}
final class UploadImageSuccessState extends AccountState {}
final class UploadImageErrorState extends AccountState {
  final String error;

  UploadImageErrorState(this.error);
}


final class ServicesTypeLoadingState extends AccountState {}
final class ServicesTypeLoadingMoreState extends AccountState {}
final class ServicesTypeErrorState extends AccountState {
  final String error;
  ServicesTypeErrorState(this.error);
}

final class ServiceTypeSuccessState extends AccountState {
  final List<Service>? serviceType;
  ServiceTypeSuccessState(this.serviceType);
}

final class ProductsTypeLoadingState extends AccountState {}
final class ProductsTypeLoadingMoreState extends AccountState {}

final class ProductsTypeSuccessState extends AccountState {
  final List<Product>? productType;
  ProductsTypeSuccessState(this.productType);
}
final class ProductsTypeErrorState extends AccountState {
  final String error;
  ProductsTypeErrorState(this.error);
}