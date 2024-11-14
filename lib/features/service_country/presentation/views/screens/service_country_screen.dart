import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/search/data/repo/search_repo.dart';
import 'package:roadapp/features/service_country/presentation/cubit/countries_cubit.dart';
import 'package:roadapp/features/service_country/presentation/cubit/countries_state.dart';
import 'package:roadapp/features/service_country/presentation/views/widgets/countries_grid.dart';
import 'package:roadapp/features/service_country/presentation/views/widgets/countries_shimmer.dart';
import 'package:roadapp/features/service_country/presentation/views/widgets/select_country_button.dart';

class ServiceCountryScreen extends StatelessWidget {
  const ServiceCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.chooseServiceCountry.tr(context))),
        body: Padding(
            padding: EdgeInsets.only(
                top: 50.h, bottom: 20.h, right: 15.w, left: 15.w),
            child: BlocProvider(
                create: (_) =>
                    CountriesCubit(getIt.get<SearchRepo>())..fetchCountries(),
                child: BlocBuilder<CountriesCubit, CountriesState>(
                    builder: (context, state) {
                  var cubit = CountriesCubit.get(context);
                  return state is FetchingCountriesLoadingState
                      ? const CountriesShimmer()
                      : state is CountriesErrorState
                          ? Center(child: Text(state.error))
                          : Column(children: [
                              Expanded(
                                  child: CountriesGrid(
                                      countries: cubit.countries ?? [])),
                              SizedBox(height: 20.h),
                              const SelectCountryButton()
                            ]);
                }))));
  }
}
