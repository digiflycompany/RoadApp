import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/features/account/data/models/update_profile_request_body.dart';
import 'package:roadapp/features/account/data/repo/account_repo.dart';
import 'package:roadapp/features/search/data/models/countries_model.dart';
import 'package:roadapp/features/search/data/repo/search_repo.dart';
import 'package:roadapp/features/service_country/presentation/cubit/countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit(this._repo, this._accountRepo) : super(CountriesInitial());
  final SearchRepo _repo;
  final AccountRepo _accountRepo;
  static CountriesCubit get(context) => BlocProvider.of(context);

  List<Country>? countries;
  int countriesPage = 1;
  int? selectedCountryIndex;
  String? selectedCountryId;

  fetchCountries({int page = 1, int limit = 10, bool? more}) async {
    if (more == true) {
      emit(MoreLoadingState());
    } else {
      emit(FetchingCountriesLoadingState());
    }

    final response = await _repo.getCountries(page: page, limit: limit);

    response.when(success: (response) async {
      if (more != true) {
        countries = response.data.countries;
        countriesPage = 1;
      } else {
        countries?.addAll(response.data.countries);
        countriesPage++;
      }

      emit(CountriesSuccessState(countries! ?? []));
    }, failure: (error) {
      emit(
          CountriesErrorState(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }

  selectCountry(int index, String id) {
    selectedCountryIndex = index;
    selectedCountryId = id;
    emit(CountrySelectedState());
  }

  setUserCountry() async {
    if (selectedCountryIndex != null) {
      emit(SetCountryLoadingState());
      final response = await _accountRepo.updateProfile(
          UpdateProfileRequestBody(countryId: selectedCountryId));
      response.when(
          success: (updateResponse) async {
            await CacheHelper().saveData(CacheVars.userCountry, selectedCountryId);
            emit(CountrySelectionSuccessState());
          },
          failure: (error) => emit(SetCountryErrorState(
              error.apiErrorModel.message ?? 'Unknown Error!')));
    }
    return;
  }
}