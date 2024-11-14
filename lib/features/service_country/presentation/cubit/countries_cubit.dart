import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/search/data/models/countries_model.dart';
import 'package:roadapp/features/search/data/repo/search_repo.dart';
import 'package:roadapp/features/service_country/presentation/cubit/countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit(this._repo) : super(CountriesInitial());
  final SearchRepo _repo;
  static CountriesCubit get(context) => BlocProvider.of(context);

  List<Country>? countries;
  int countriesPage = 1;
  int? selectedCountryIndex;

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

  selectCountry(int index) {
    selectedCountryIndex = index;
    emit(CountrySelectedState());
  }
}