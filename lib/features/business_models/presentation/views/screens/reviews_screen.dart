import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/work_reports/data/repo/review_repo.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/review_cubit.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/review_states.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReviewsCubit(ReviewsRepo(ApiService(Dio())))..fetchReviews(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringManager.reviews.tr(context)),
          centerTitle: true,
        ),
        body: BlocBuilder<ReviewsCubit, ReviewsState>(
          builder: (context, state) {
            if (state is ReviewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ReviewsError) {
              return Center(
                child: Text(
                  "${StringManager.error.tr(context)}: ${state.message}",
                  style: TextStyle(fontSize: 14.sp, color: Colors.red),
                ),
              );
            } else if (state is ReviewsLoaded) {
              final reviews = state.reviews;
              if (reviews.isEmpty) {
                return Center(
                  child: Text(
                    StringManager.noReviewsFound.tr(context),
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                );
              }

              return ListView.builder(
                itemCount: reviews.length,
                padding: EdgeInsets.all(12.w),
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Username
                          Text(
                            review.user?.fullName ?? StringManager.unknownUser.tr(context),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),

                          SizedBox(height: 4.h),

                          /// Maintenance Center
                          Text(
                            "${StringManager.center.tr(context)}: ${review.maintenanceCenter?.name ?? StringManager.notAvailable.tr(context)}",
                            style: TextStyle(fontSize: 12.sp),
                          ),

                          /// Booking ID
                          Text(
                            "${StringManager.booking.tr(context)}: ${review.bookingId}",
                            style: TextStyle(fontSize: 12.sp),
                          ),

                          SizedBox(height: 6.h),

                          /// Ratings
                          Text(
                            "${StringManager.employeesBehavior.tr(context)}: ${review.employeesBehavior}",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          Text(
                            "${StringManager.speed.tr(context)}: ${review.speed}",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          Text(
                            "${StringManager.honesty.tr(context)}: ${review.honesty}",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          Text(
                            "${StringManager.fairCost.tr(context)}: ${review.fairCost}",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          Text(
                            "${StringManager.efficiency.tr(context)}: ${review.efficiency}",
                            style: TextStyle(fontSize: 12.sp),
                          ),

                          SizedBox(height: 6.h),

                          /// Date
                          Text(
                            "${StringManager.date.tr(context)}: "
                            "${DateTime.tryParse(review.createdAt)?.toLocal().toString().split('.').first ?? review.createdAt}",
                            style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
