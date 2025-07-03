part of 'ads_cubit.dart';

@immutable
sealed class AdsState {}

final class AdsInitial extends AdsState {}

final class AdsUploadLoadingState extends AdsState {}
final class AdsUploadSuccessState extends AdsState {}
final class AdsUploadErrorState extends AdsState {
  final String error;

  AdsUploadErrorState(this.error);
}


final class AddAdsLoadingState extends AdsState {}
final class AddAdsSuccessState extends AdsState {}
final class AddAdsErrorState extends AdsState {
  final String error;
  AddAdsErrorState(this.error);
}

final class TakeImageAdsState extends AdsState {}
final class NoImageState extends AdsState {}

class AdsTypeSelectedState extends AdsState {}


