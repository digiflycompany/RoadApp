import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/addAds/data/models/ads_request.dart';
import 'package:roadapp/features/addAds/data/repo/ads_repo.dart';

import '../../../account/data/models/account_response.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit(this._adsRepo) : super(AdsInitial());
  final AdsRepo _adsRepo;
  static AdsCubit get(context) => BlocProvider.of(context);

  XFile? image;
  String? imageUrl;
  User? user;

  uploadImage() async {
    emit(AdsUploadLoadingState());
    final response = await _adsRepo.uploadImage(image!);
    response.when(
        success: (uploadResponse) {
          imageUrl = uploadResponse.file.path;
          emit(AdsUploadSuccessState());
        },
        failure: (error) => emit(AdsUploadErrorState(
            error.apiErrorModel.message ?? 'Unknown Error!')));
  }

  String? type;
  Future<void> addAds(BuildContext context) async {
    debugPrint(type);
    emit(AddAdsLoadingState());
    if (image != null) {
      await uploadImage();
    }

    if (imageUrl == null) {
      showToast(
          message: StringManager.uploadYourImage.tr(context),
          state: ToastStates.error);
      emit(NoImageState());
    }
    if (type == null) {
      showToast(
          message: StringManager.selectType.tr(context),
          state: ToastStates.error);
      emit(NoImageState());
    }
    final response = await _adsRepo.addAds(
      AdsRequest(type: type!, images: [
        imageUrl!,
      ]),
    );
    response.when(
        success: (uploadResponse) {
          emit(AddAdsSuccessState());
        },
        failure: (error) => emit(
            AddAdsErrorState(error.apiErrorModel.message ?? 'Unknown Error!')));
  }

  // take image from user
  void takeImage(value) {
    image = value;
    emit(TakeImageAdsState());
  }
}
