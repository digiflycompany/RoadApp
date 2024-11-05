import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/favorite/data/models/fav_response.dart';
import 'package:roadapp/features/favorite/data/repos/fav_repo.dart';
import 'package:roadapp/features/favorite/presentation/cubit/fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this._favRepo) : super(FavInitial());
  static FavCubit get(context) => BlocProvider.of(context);
  final FavRepo _favRepo;

  List<FavoriteAd>? ads;

  fetchFavAds() async {
    emit(FetchingFavAdsLoadingState());
    final response = await _favRepo.fetchFavAds();
    response.when(success: (adsResponse) async {
      ads = adsResponse.data?.favoriteAds;
      emit(FavAdsSuccessState(adsResponse.data?.favoriteAds ?? []));
    }, failure: (error) {
      emit(FavErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}
