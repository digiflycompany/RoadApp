import 'package:bloc/bloc.dart';
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


  NotificationResponse? notificationResponses;
  fetchNotification() async {
    emit(GetNotificationLoadingState());
    final response = await _notificationRepo.fetchNotification();
    response.when(
        success: (notificationResponse) async {
          notificationResponses = notificationResponse;
      emit(GetNotificationSuccessState());
    }, failure: (error) {
      emit(GetNotificationErrorState());
    });
  }
}
