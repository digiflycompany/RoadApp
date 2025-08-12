import 'package:roadapp/features/account/data/models/profile_user_response.dart';
import 'package:roadapp/features/favorite/data/models/fav_response.dart';
import 'package:roadapp/features/home/data/models/ads_response.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class FetchingAdsLoadingState extends HomeState {}

class AdsErrorState extends HomeState {
  final String errorMessage;
  AdsErrorState(this.errorMessage);
}

class AdsSuccessState extends HomeState {
  final List<List<Ad>> allPagesAds;
  AdsSuccessState(this.allPagesAds);
}

class MoreLoadingState extends HomeState {}

class CountryLoadingState extends HomeState {}

class IndexUpdatedState extends HomeState {}

class CountrySuccessState extends HomeState {
  final String countryName;
  CountrySuccessState(this.countryName);
}

class CountryErrorState extends HomeState {
  final String errorMessage;
  CountryErrorState(this.errorMessage);
}

class AddToFavLoadingState extends HomeState {}

class AddToFavSuccessState extends HomeState {
  final String id;
  AddToFavSuccessState(this.id);
}

class AddToFAvErrorState extends HomeState {
  final String errorMessage;
  AddToFAvErrorState(this.errorMessage);
}

class AccountLoadingState extends HomeState {}

class AccountUserSuccessState extends HomeState {}

class AccountErrorState extends HomeState {
  final String errorMessage;
  AccountErrorState(this.errorMessage);
}

class RemoveFromFavLoadingState extends HomeState {}

class RemoveFromFavSuccessState extends HomeState {}

class RemoveFromFAvErrorState extends HomeState {
  final String errorMessage;
  RemoveFromFAvErrorState(this.errorMessage);
}

class AdsFavoriteChangedState extends HomeState {
  final List<String> favorites;
  AdsFavoriteChangedState(this.favorites);
}

final class FetchingFavAdsLoadingState extends HomeState {}

final class FavErrorState extends HomeState {
  final String error;
  FavErrorState(this.error);
}

final class FavAdsSuccessState extends HomeState {
  final List<FavoriteAd> ads;
  FavAdsSuccessState(this.ads);
}
