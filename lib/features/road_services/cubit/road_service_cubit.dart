import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/features/road_services/data/repo/road_service_repo.dart';

import '../data/models/road_service_model.dart';

part 'road_service_state.dart';

class RoadServiceCubit extends Cubit<RoadServiceState> {
  RoadServiceCubit(this._roadServiceRepo) : super(RoadServiceInitial());
  final RoadServiceRepo _roadServiceRepo;


  RoadServicesResponse? roadServicesResponse;
  int currentPage = 1;
  int limit = 15;

  Future<void> getRoadService(
      {bool isLoadMore = false, required String type}) async {
    if (!isLoadMore) {
      emit(GetRoadServiceLoading());
    }

    final response = await _roadServiceRepo.getRoadService(
      page: currentPage,
      limit: limit,
      type: type,
    );

    response.when(
      success: (roadResponse) {
        if (isLoadMore) {
          roadServicesResponse?.roadServices
              .addAll(roadResponse.roadServices ?? []);
        } else {
          roadServicesResponse = roadResponse;
        }

        debugPrint(roadResponse.toString());
        emit(GetRoadServiceSuccess());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetRoadServiceError());
      },
    );
  }

  Future<void> loadMoreRoadService(String type) async {
    emit(GetRoadServiceMoreLoading());
    try {
      currentPage++;
      await getRoadService(isLoadMore: true, type: type);
      emit(GetRoadServiceMoreSuccess());
    } catch (ex) {
      debugPrint(ex.toString());
      emit(GetRoadServiceMoreError());
    }
  }


}
