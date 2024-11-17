abstract class HomeState{}

class HomeInitState extends HomeState{}
class CountryLoadingState extends HomeState{}
class CountrySuccessState extends HomeState{
  final String countryName;
  CountrySuccessState(this.countryName);
}
class CountryErrorState extends HomeState{
  final String errorMessage;
  CountryErrorState(this.errorMessage);
}