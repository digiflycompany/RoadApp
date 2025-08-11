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
    controllers =
        List.generate(pagesCount, (_) => PageController(keepPage: false));
  }

  @override
  Future<void> close() {
    mainController.dispose();
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].dispose();
    }
    return super.close();
  }

  String? isVendor;
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

  int currentPage = 1;
  bool isLoadingMore = false;
  List<List<AD>> allPagesAds = [];
  // Type = 'Spare_Parts', 'Maintenance_Center', 'Car_Accessories', 'Car_Rental', 'Auto_Services'
  List<String> type = [];

  Future<void> fetchAds({required int page, int limit = 4}) async {
    isVendor = await CacheHelper().getData('CLIENT');

    if (isLoadingMore) return;
    isLoadingMore = true;

    if (page == 1) {
      allPagesAds.clear(); // مسح البيانات القديمة عند تحميل أول صفحة
      emit(FetchingAdsLoadingState());
    }

    try {
      final response =
          await _repo.fetchAds(page: page, type: type, limit: limit);
      response.when(success: (response) {
        final adsData = response.data?.ads ?? [];
        if (adsData.isNotEmpty) {
          allPagesAds.add(adsData);
          currentPage = page;
        }
        emit(AdsSuccessState(allPagesAds));
      }, failure: (error) {
        emit(AdsErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
      });
    } finally {
      isLoadingMore = false;
    }
  }
  // Future<void> fetchAds({required int page, int limit = 4}) async {
  //   isVendor = await CacheHelper().getData('CLIENT');
  //
  //   if (isLoadingMore) return;
  //   isLoadingMore = true;
  //   emit(FetchingAdsLoadingState());
  //
  //
  //   try {
  //     final response = await _repo.fetchAds(page: page,type: type, limit: limit);
  //     response.when(success: (response) {
  //       final adsData = response.data?.ads ?? [];
  //       if (adsData.isNotEmpty) {
  //         allPagesAds.add(adsData);
  //         currentPage = page;
  //         emit(AdsSuccessState(allPagesAds));
  //       } else {
  //         emit(AdsSuccessState(allPagesAds));
  //       }
  //     }, failure: (error) {
  //       emit(AdsErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
  //     });
  //   } finally {
  //     isLoadingMore = false;
  //   }
  // }

  updateVerticalIndex(index) {
    verticalIndex = index;
  }

  List<String> favoriteAds = [];

  // addToFav({required String id}) async {
  //   currentLoadingAdId = id;
  //   emit(AddToFavLoadingState());
  //
  //   final response = await _repo.addToFav(id: id);
  //
  //   response.when(success: (_) async {
  //     favoriteAds.add(id);
  //
  //     currentLoadingAdId = null;
  //     emit(AdsSuccessState(allPagesAds));
  //   }, failure: (error) {
  //     currentLoadingAdId = null;
  //     emit(AddToFAvErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
  //   });
  // }

  String? currentLoadingAdId;
  //
  // removeFromFav({required String id}) async {
  //   currentLoadingAdId = id;
  //   emit(RemoveFromFavLoadingState());
  //
  //   final response = await _repo.removeFromFav(id: id);
  //
  //   response.when(success: (_) async {
  //     favoriteAds.remove(id);
  //     currentLoadingAdId = null;
  //     emit(RemoveFromFavSuccessState());
  //   }, failure: (error) {
  //     currentLoadingAdId = null;
  //     emit(RemoveFromFAvErrorState(
  //         error.apiErrorModel.message ?? 'Unknown Error!'));
  //   });
  // }

  addToFav({required String id}) async {
    currentLoadingAdId = id;
    emit(AddToFavLoadingState());

    final response = await _repo.addToFav(id: id);

    response.when(success: (_) async {
      favoriteAds.add(id);
      currentLoadingAdId = null;

      // تأكد إنك بتعمل emit بعد التغيير
      emit(AdsFavoriteChangedState(List.from(favoriteAds)));
    }, failure: (error) {
      currentLoadingAdId = null;
      emit(AddToFAvErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  removeFromFav({required String id}) async {
    currentLoadingAdId = id;
    emit(RemoveFromFavLoadingState());

    final response = await _repo.removeFromFav(id: id);

    response.when(success: (_) async {
      favoriteAds.remove(id);
      currentLoadingAdId = null;

      // نفس الفكرة هنا
      emit(AdsFavoriteChangedState(List.from(favoriteAds)));
    }, failure: (error) {
      currentLoadingAdId = null;
      emit(RemoveFromFAvErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }
}
