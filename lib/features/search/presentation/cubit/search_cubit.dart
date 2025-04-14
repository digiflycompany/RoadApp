import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/search/data/models/car_brand_model.dart';
import 'package:roadapp/features/search/data/models/countries_model.dart';
import 'package:roadapp/features/search/data/repo/search_repo.dart';
import 'package:roadapp/features/vehicles/data/models/brands_response.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../vehicles/data/models/vehicles_response.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());
  final SearchRepo _searchRepo;
  static SearchCubit get(context) => BlocProvider.of(context);



  // الدولة
  String? selectedCountryName = 'Egypt';
  String? selectedCountryBrandId;
  int countryDropDownPage = 1;
  List<Country>? countryDropDown;
  bool isLoadingCountries = false;


  String? selectedBrandId;
  String? selectedModelName;
  int? selectedYear;

  void changeSelectedBrand(String? brandId) {
    selectedBrandId = brandId;
    selectedModelName = null;
    selectedYear = null;
    emit(BrandSearchChangedState());
  }

  void changeSelectedModel(String? modelName) {
    selectedModelName = modelName;
    selectedYear = null;
    emit(ModelSearchChangedState());
  }

  void changeSelectedYear(int? year) {
    selectedYear = year;
    emit(YearSearchChangedState());
  }



  String? isVendor;

  // ماركة السيارة
  String? selectedCarBrandName;
  String? selectedCarBrandId;
  int carBrandPage = 1;
  List<BrandRes>? carBrandList;
  bool isLoadingCarBrand = false;

  Future<void> fetchCarBrand({int page = 1, int limit = 10, bool? more}) async {
    isVendor = await CacheHelper().getData('CLIENT');

    if (more == true) {
      isLoadingCarBrand = true;
      emit(CarBrandDropDawnLoadingMoreState());
    } else {
      isLoadingCarBrand = true;
      emit(CarBrandDropDawnLoadingState());
    }

    final response = await _searchRepo.getCarBrand();
    response.when(
      success: (carBrandResponse) {
        if (more != true) {
          carBrandList = carBrandResponse.data!.brands;
          carBrandPage = 1;
        } else {
          carBrandList?.addAll(carBrandResponse.data!.brands ?? []);
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

  // المركبات
  String? selectedVehicle; // متغير لحفظ القيمة المختارة من القائمة

  List<Vehicle>? vehiclesDropDown;

  String? selectedCarBrandIdFromVehicle;
  String? selectedCarBrandNameFromVehicle;
  String? selectedCarBrandNameModelFromVehicle;
  int? selectedCarBrandYearFromVehicle;

  Future<void> fetchVehiclesDropDown() async {
    isVendor = await CacheHelper().getData('CLIENT');

    emit(FetchingVehiclesLoadingState());
    final response = await _searchRepo.fetchVehicles(page: 1, limit: 50);
    response.when(success: (vehiclesResponse) {
      vehiclesDropDown = vehiclesResponse.data?.vehicles ?? [];
      emit(VehiclesDropDownSuccessState(vehiclesDropDown!));
    }, failure: (error) {
      emit(VehiclesDropDownErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  void updateSelectedVehicle(String? vehicle) {
    selectedVehicle = vehicle;
    emit(VehiclesDropDownUpdatedState(vehicle));
  }

  // إعادة ضبط البيانات
  void clearData() {
    selectedCountryName = null;
    selectedCountryBrandId = null;
    selectedCarBrandName = null;
    selectedCarBrandId = null;
    selectedVehicle = null;
    emit(SearchInitial());
  }



// Future<void> fetchCountriesDropDown({int page = 1, int limit = 10, bool? more}) async {
//   if (more == true) {
//     isLoadingCountries = true;
//     emit(CountriesDropDownLoadingMoreState());
//   } else {
//     isLoadingCountries = true;
//     emit(CountriesDropDownLoadingState());
//   }
//
//   final response = await _searchRepo.getCountries(page: page, limit: limit);
//   response.when(
//     success: (countriesResponse) {
//       if (more != true) {
//         countryDropDown = countriesResponse.data.countries;
//         countryDropDownPage = 1;
//       } else {
//         countryDropDown?.addAll(countriesResponse.data.countries ?? []);
//         countryDropDownPage++;
//       }
//       isLoadingCountries = false;
//       emit(CountriesDropDownSuccessState(countryDropDown));
//     },
//     failure: (error) {
//       isLoadingCountries = false;
//       emit(CountriesDropDownErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
//     },
//   );
// }
}
