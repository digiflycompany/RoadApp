import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/privacy_policy_repo.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit(this._privacyPolicyRepo) : super(PrivacyPolicyInitial());

  final PrivacyPolicyRepo _privacyPolicyRepo;
  static PrivacyPolicyCubit get(context) => BlocProvider.of(context);

   String? privacyPolicy;
  fetchPrivacyPolicy() async {
    emit(PrivacyPolicyLoadingState());
    final response = await _privacyPolicyRepo.fetchPrivacyPolicy();
    response.when(
        success: (privacyResponse) {
          privacyPolicy = privacyResponse.data!.content;
          emit(PrivacyPolicySuccessState());
        },
        failure: (error) => emit(PrivacyPolicyErrorState(
            error.apiErrorModel.message ?? 'Unknown Error!')));
  }
}
