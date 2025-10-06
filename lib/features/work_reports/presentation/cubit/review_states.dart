import 'package:roadapp/features/work_reports/data/models/review_model.dart';

abstract class ReviewsState {}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  final List<ReviewModel> reviews;
  final ReviewsOptions options;

  ReviewsLoaded(this.reviews, this.options);
}

class ReviewsError extends ReviewsState {
  final String message;
  ReviewsError(this.message);
}
