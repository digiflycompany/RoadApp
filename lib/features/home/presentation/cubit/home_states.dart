import 'package:roadapp/features/home/data/models/ads_response.dart';

abstract class HomeState{}

class HomeInitState extends HomeState{}
class FetchingAdsLoadingState extends HomeState{}
class AdsErrorState extends HomeState{
  final String errorMessage;
  AdsErrorState(this.errorMessage);
}
class AdsSuccessState extends HomeState{
  final List<AD> ads;
  AdsSuccessState(this.ads);
}
class MoreLoadingState extends HomeState{}
class CountryLoadingState extends HomeState{}
class IndexUpdatedState extends HomeState{}
class CountrySuccessState extends HomeState{
  final String countryName;
  CountrySuccessState(this.countryName);
}
class CountryErrorState extends HomeState{
  final String errorMessage;
  CountryErrorState(this.errorMessage);
}

class AddToFavLoadingState extends HomeState{}
class AddToFavSuccessState extends HomeState{
  final String id;
  AddToFavSuccessState(this.id);
}
class AddToFAvErrorState extends HomeState{
  final String errorMessage;
  AddToFAvErrorState(this.errorMessage);
}