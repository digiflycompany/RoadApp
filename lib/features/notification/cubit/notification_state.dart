part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}


final class GetNotificationLoadingState extends NotificationState {}
final class GetNotificationSuccessState extends NotificationState {}
final class GetNotificationErrorState extends NotificationState {}


final class GetMoreNotificationLoadingState extends NotificationState {}
final class GetMoreNotificationSuccessState extends NotificationState {}
final class GetMoreNotificationErrorState extends NotificationState {}

