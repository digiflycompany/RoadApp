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

  Future<void> fetchAds({required int page, int limit = 4}) async {
    isVendor = await CacheHelper().getData('CLIENT');

    if (isLoadingMore) return;
    isLoadingMore = true;
    emit(FetchingAdsLoadingState());


    try {
      final response = await _repo.fetchAds(page: page, limit: limit);
      response.when(success: (response) {
        final adsData = response.data?.ads ?? [];
        if (adsData.isNotEmpty) {
          allPagesAds.add(adsData);
          currentPage = page;
          emit(AdsSuccessState(allPagesAds));
        } else {
          emit(AdsSuccessState(allPagesAds));
        }
      }, failure: (error) {
        emit(AdsErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
      });
    } finally {
      isLoadingMore = false;
    }
  }



  // List<List<AD>> allPagesAds = [];


  // fetchAds({int limit = 4}) async {
  //   emit(FetchingAdsLoadingState());
  //
  //   for (int i = 1; i <= 5; i++) {
  //     isVendor = await CacheHelper().getData('CLIENT');
  //     final response = await _repo.fetchAds(page: i, limit: limit);
  //     response.when(success: (response) async {
  //       allPagesAds.add(response.data?.ads ?? []);
  //       if (i == 5) {
  //         ads = allPagesAds.expand((e) => e).toList(); // اجمع كل البيانات في قائمة واحدة
  //         emit(AdsSuccessState(allPagesAds)); // أرسل البيانات المجزأة لكل صفحة
  //       }
  //     }, failure: (error) {
  //       emit(AdsErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
  //     });
  //   }
  // }


  // fetchAds({int page = 1, int limit = 9, bool? more}) async {
  //   if (more == true) {
  //     emit(MoreLoadingState());
  //   } else {
  //     emit(FetchingAdsLoadingState());
  //   }
  //
  //   isVendor = await CacheHelper().getData('CLIENT');
  //   final response = await _repo.fetchAds(page: page, limit: limit);
  //
  //   response.when(success: (response) async {
  //     if (more != true) {
  //       ads.clear(); // مسح البيانات القديمة تمامًا
  //       ads = response.data?.ads ?? [];
  //       adsPage = 1;
  //     } else {
  //       ads.addAll(response.data?.ads ?? []); // إضافة البيانات الجديدة
  //       adsPage++;
  //     }
  //
  //     DefaultLogger.logger.w('${response.data!.options!.count} ${ads.length} $last');
  //     if (response.data!.options!.count! <= ads.length) last = true;
  //
  //     emit(AdsSuccessState(ads)); // إصدار الـ State مع البيانات الجديدة
  //   }, failure: (error) {
  //     DefaultLogger.logger.i(error.apiErrorModel.message);
  //     emit(AdsErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
  //   });
  // }
  // fetchAds({int page = 1, int limit = 9, bool? more}) async {
  //   if (more == true) {
  //     emit(MoreLoadingState());
  //   } else {
  //     emit(FetchingAdsLoadingState());
  //   }
  //
  //    isVendor = await CacheHelper().getData('CLIENT');
  //   final response = await _repo.fetchAds(page: page, limit: limit);
  //
  //   response.when(success: (response) async {
  //     if (more != true) {
  //       ads = response.data?.ads ?? [];
  //       adsPage = 1;
  //     } else {
  //       ads.addAll(response.data?.ads ?? []);
  //       adsPage++;
  //     }
  //     DefaultLogger.logger.w('${response.data!.options!.count} ${ads.length} $last');
  //     if(response.data!.options!.count! <= ads.length) last = true;
  //     emit(AdsSuccessState(ads));
  //   }, failure: (error) {
  //     DefaultLogger.logger.i(error.apiErrorModel.message);
  //     emit(AdsErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
  //   });
  // }

  // loadMoreAds(int pageIndex) {
  //   if (visitedIndexes.contains(pageIndex) || last) return;
  //   visitedIndexes.add(pageIndex);
  //   pagesCount++;
  //   controllers.add(PageController(keepPage: false));
  //   fetchAds(more: true);
  // }

  updateVerticalIndex(index) {
    verticalIndex = index;
  }

  List<String> favoriteAds = [];

  addToFav({required String id}) async {
    currentLoadingAdId = id;
    emit(AddToFavLoadingState());

    final response = await _repo.addToFav(id: id);

    response.when(success: (_) async {
      // إضافة الإعلان إلى قائمة المفضلة
      favoriteAds.add(id);

      currentLoadingAdId = null;
      emit(AdsSuccessState(allPagesAds)); // إعادة إصدار حالة الإعلانات
    }, failure: (error) {
      currentLoadingAdId = null;
      emit(AddToFAvErrorState(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }// قائمة تحتوي على معرفات الإعلانات المفضلة

  String? currentLoadingAdId;

  // addToFav({required String id})async{
  //   currentLoadingAdId = id;
  //   // loading
  //   emit(AddToFavLoadingState());
  //
  //   final response = await _repo.addToFav(
  //     id: id,
  //   );
  //
  //   response.when(success: (workResponse) async {
  //     emit(AddToFavSuccessState(id));
  //   }, failure: (error) {
  //     emit(AddToFAvErrorState(
  //         error.apiErrorModel.message ?? 'Unknown Error!'));
  //   });
  //
  // }
}


