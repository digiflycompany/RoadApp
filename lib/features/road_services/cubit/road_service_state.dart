part of 'road_service_cubit.dart';

@immutable
sealed class RoadServiceState {}

final class RoadServiceInitial extends RoadServiceState {}



final class GetRoadServiceLoading extends RoadServiceState {}
final class GetRoadServiceSuccess extends RoadServiceState {}
final class GetRoadServiceError extends RoadServiceState {}


final class GetRoadServiceMoreLoading extends RoadServiceState {}
final class GetRoadServiceMoreSuccess extends RoadServiceState {}
final class GetRoadServiceMoreError extends RoadServiceState {}
