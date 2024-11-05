import 'package:roadapp/features/favorite/data/models/fav_response.dart';

sealed class FavState {}

final class FavInitial extends FavState {}
final class FetchingFavAdsLoadingState extends FavState {}
final class FavErrorState extends FavState {
  final String error;
  FavErrorState(this.error);
}
final class FavAdsSuccessState extends FavState {
  final List<FavoriteAd> ads;
  FavAdsSuccessState(this.ads);
}