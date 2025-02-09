import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
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

  Future<void> addAds()async{
    emit(AddAdsLoadingState());
    if(image != null){
      await uploadImage();
    }

      if(imageUrl == null){
        showToast(message: 'please select image', state: ToastStates.error);
        emit(NoImageState());
      }
      final response = await _adsRepo.addAds(
        AdsRequest(
            images: [
              imageUrl!,
            ]
        ),
      );
      response.when(
          success: (uploadResponse) {

            emit(AddAdsSuccessState());
          },
          failure: (error) => emit(AddAdsErrorState(
              error.apiErrorModel.message ?? 'Unknown Error!')));

    }


  // take image from user
  void takeImage(value) {
    image = value;
    emit(TakeImageAdsState());
  }

}
