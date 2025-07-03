part of 'privacy_policy_cubit.dart';

@immutable
sealed class PrivacyPolicyState {}

final class PrivacyPolicyInitial extends PrivacyPolicyState {}

final class PrivacyPolicyLoadingState extends PrivacyPolicyState {}
final class PrivacyPolicySuccessState extends PrivacyPolicyState {}
final class PrivacyPolicyErrorState extends PrivacyPolicyState {
   final String error;

  PrivacyPolicyErrorState(this.error);
}
