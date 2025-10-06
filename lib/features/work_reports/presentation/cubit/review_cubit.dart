import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/work_reports/data/repo/review_repo.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/review_states.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final ReviewsRepo repo;
  ReviewsCubit(this.repo) : super(ReviewsInitial());

  static ReviewsCubit get(context) => BlocProvider.of(context);

  Future<void> fetchReviews({int page = 1, int limit = 10}) async {
    emit(ReviewsLoading());
    try {
      final response = await repo.getReviews(page: page, limit: limit);
      response.when(
        success: (data) {
          emit(ReviewsLoaded(data.reviews, data.options));
        },
        failure: (error) {
          emit(ReviewsError(error.apiErrorModel.message ?? "Unknown error"));
        },
      );
    } catch (e) {
      emit(ReviewsError(e.toString()));
    }
  }
}
