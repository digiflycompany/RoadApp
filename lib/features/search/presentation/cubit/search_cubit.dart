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
  String? selectedCountryBrandId;

  int countryDropDownPage = 1;
  List<Country>? countryDropDown;

  bool isLoadingCountries = false;

  Future<void> fetchCountriesDropDown({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      isLoadingCountries = true;
      emit(CountriesDropDownLoadingMoreState());
    } else {
      isLoadingCountries = true;
      emit(CountriesDropDownLoadingState());
    }

    final response = await _searchRepo.getCountries(
      page: page,
      limit: limit,
    );

    response.when(
      success: (countriesResponse) {
        if (more != true) {
          countryDropDown = countriesResponse.data.countries;
          countryDropDownPage = 1;
        } else {
          countryDropDown?.addAll(countriesResponse.data.countries ?? []);
          countryDropDownPage++;
        }
        isLoadingCountries = false;
        emit(CountriesDropDownSuccessState(countryDropDown));
      },
      failure: (error) {
        isLoadingCountries = false;
        emit(CountriesDropDownErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
      },
    );
  }




  // Car Brand Function

  String? selectedCarBrandName;
  String? selectedCarBrandId;
  int carBrandPage = 1;
  List<Brand>? carBrandList;
  bool isLoadingCarBrand = false;

  Future<void> fetchCarBrand({
    int page = 1,
    int limit = 10,
    bool? more,
  }) async {
    if (more == true) {
      isLoadingCarBrand = true;
      emit(CarBrandDropDawnLoadingMoreState());
    } else {
      isLoadingCarBrand = true;
      emit(CarBrandDropDawnLoadingState());
    }

    final response = await _searchRepo.getCarBrand(
      page: page,
      limit: limit,
    );

    response.when(
      success: (carBrandResponse) {
        if (more != true) {
          carBrandList = carBrandResponse.data.brands;
          carBrandPage = 1;
        } else {
          carBrandList?.addAll(carBrandResponse.data.brands ?? []);
          carBrandPage++;
        }

        isLoadingCarBrand = false;
        emit(CarBrandDropDawnSuccessState(carBrandList));
      },
      failure: (error) {
        isLoadingCarBrand = false;
        emit(CarBrandDropDawnErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
      },
    );
  }


}


