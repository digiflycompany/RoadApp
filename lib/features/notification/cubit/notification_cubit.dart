import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/features/notification/data/repo/notification_repo.dart';

import '../data/models/notificaton_response.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit( this._notificationRepo) : super(NotificationInitial());
  static NotificationCubit get(context) => BlocProvider.of(context);
  final NotificationRepo _notificationRepo;


  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }


  NotificationResponse? notificationResponse;
  int currentPage = 1;
  int limit = 10;

  Future<void> fetchNotification(
      {bool isLoadMore = false,}) async {
    if (!isLoadMore) {
      emit(GetNotificationLoadingState());
    }

    final response = await _notificationRepo.fetchNotification(
      page: currentPage,
      limit: limit,
    );

    response.when(
      success: (notificationRes) {
        if (isLoadMore) {
          notificationResponse?.data?.notifications
              ?.addAll(notificationRes.data?.notifications ?? []);
        } else {
          notificationResponse = notificationRes;
        }

        debugPrint(notificationRes.toString());
        emit(GetNotificationSuccessState());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetNotificationErrorState());
      },
    );
  }

  Future<void> loadMoreNotification() async {
    if (state is GetMoreNotificationLoadingState) return;

    emit(GetMoreNotificationLoadingState());
    try {
      currentPage++;
      await fetchNotification(isLoadMore: true,);
      emit(GetMoreNotificationSuccessState());
    } catch (ex) {
      debugPrint(ex.toString());
      emit(GetNotificationErrorState());
    }
  }

}
