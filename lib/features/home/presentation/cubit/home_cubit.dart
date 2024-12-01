import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/home/data/models/ads_response.dart';
import 'package:roadapp/features/home/data/repos/home_repo.dart';
import 'package:roadapp/features/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;

  static HomeCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();

  late final PageController mainController;
  late List<PageController> controllers;

  String? countryName;

  int verticalIndex = 0, adsPage = 1, pagesCount = 1;
  List<AD> ads = [];
  List<int> visitedIndexes = [];

  bool checkBoxService = false;
  bool checkBoxService2 = false;
  bool checkBoxService3 = false;
  bool checkBoxService4 = false;
  bool checkBoxService5 = false;

  bool last = false;

  HomeCubit(this._repo) : super(HomeInitState()) {
    mainController = PageController(initialPage: 2, keepPage: false);
    controllers = List.generate(pagesCount, (_) => PageController(keepPage: false));
  }

  @override
  Future<void> close() {
    mainController.dispose();
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].dispose();
    }
    return super.close();
  }

  getUserCountry() async {
    emit(CountryLoadingState());
    String countryId = await CacheHelper().getData(CacheVars.userCountry);
    final response = await _repo.getCountryById(countryId);
    response.when(success: (response) async {
      countryName = response.data?.name;
      emit(CountrySuccessState(response.data?.name ?? ''));
    }, failure: (error) {
      emit(CountryErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  fetchAds({int page = 1, int limit = 9, bool? more}) async {
    if (more == true) {
      emit(MoreLoadingState());
    } else {
      emit(FetchingAdsLoadingState());
    }

    final response = await _repo.fetchAds(page: page, limit: limit);

    response.when(success: (response) async {
      if (more != true) {
        ads = response.data?.ads ?? [];
        adsPage = 1;
      } else {
        ads.addAll(response.data?.ads ?? []);
        adsPage++;
      }
      DefaultLogger.logger.w('${response.data!.options!.count} ${ads.length} $last');
      if(response.data!.options!.count! <= ads.length) last = true;
      emit(AdsSuccessState(ads));
    }, failure: (error) {
      DefaultLogger.logger.i(error.apiErrorModel.message);
      emit(AdsErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  loadMoreAds(int pageIndex) {
    if (visitedIndexes.contains(pageIndex) || last) return;
    visitedIndexes.add(pageIndex);
    pagesCount++;
    controllers.add(PageController(keepPage: false));
    fetchAds(more: true);
  }

  updateVerticalIndex(index) {
    verticalIndex = index;
  }
}