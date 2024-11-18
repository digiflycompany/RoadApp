import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/search/data/models/car_brand_model.dart';
import 'package:roadapp/features/search/data/models/countries_model.dart';
import 'package:roadapp/features/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());
  final SearchRepo _searchRepo;
  static SearchCubit get(context) => BlocProvider.of(context);


  String? selectedCountryName;
  String? selectedCarBrandId;


  CountriesModel? countriesModel;
  int currentPage = 1;
  int limit = 10;

  Future<void> getCountries(
      {bool isLoadMore = false,}) async {
    if (!isLoadMore) {
      emit(GetCountriesLoading());
    }


    final response = await _searchRepo.getCountries(
      page: currentPage,
      limit: limit,
    );

    response.when(
      success: (countriesResponse) {
        if (isLoadMore) {
          countriesModel?.data.countries.addAll(countriesResponse.data.countries);
        } else {
          countriesModel = countriesResponse;
        }

        debugPrint(countriesResponse.toString());
        emit(GetCountriesSuccess());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetCountriesError());
      },
    );
  }

  Future<void> loadMoreCountries() async {
    if (state is GetCountriesMoreLoading) return;

    emit(GetCountriesMoreLoading());
    try {
      currentPage++;
      await getCountries(isLoadMore: true,);
      emit(GetCountriesMoreSuccess());
    } catch (ex) {
      debugPrint(ex.toString());
      currentPage--;
      emit(GetCountriesMoreError());
    }
  }



  // Car Brand Function

  CarBrandModel? carBrandModel;
  int currentPageBrand = 1;
  int limitBrand = 10;

  Future<void> getCarBrand(
      {bool isLoadMore = false,}) async {
    if (!isLoadMore) {
      emit(GetCarBrandLoading());
    }


    final response = await _searchRepo.getCarBrand(
      page: currentPageBrand,
      limit: limitBrand,
    );

    response.when(
      success: (carBrandResponse) {
        if (isLoadMore) {
          carBrandModel?.data.brands.addAll(carBrandResponse.data.brands);
        } else {
          carBrandModel = carBrandResponse;
        }

        debugPrint(carBrandResponse.toString());
        emit(GetCarBrandSuccess());
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        debugPrint(error.apiErrorModel.errorCode.toString());
        emit(GetCarBrandError());
      },
    );
  }

  Future<void> loadMoreCarBrands() async {
    if (state is GetCarBrandMoreLoading) return;

    emit(GetCarBrandMoreLoading());
    try {
      currentPage++;
      await getCarBrand(isLoadMore: true,);
      emit(GetCarBrandMoreSuccess());
    } catch (ex) {
      debugPrint(ex.toString());
      currentPage--;
      emit(GetCarBrandMoreError());
    }
  }

}
