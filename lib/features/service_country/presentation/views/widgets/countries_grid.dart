import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/search/data/models/countries_model.dart';
import 'package:roadapp/features/service_country/presentation/cubit/countries_cubit.dart';
import 'package:roadapp/features/service_country/presentation/cubit/countries_state.dart';
import 'package:roadapp/features/service_country/presentation/views/widgets/available_country.dart';

class CountriesGrid extends StatelessWidget {
  const CountriesGrid({super.key, required this.countries});

  final List<Country> countries;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .845,
                  crossAxisCount: 2,
                  crossAxisSpacing: 25.w,
                  mainAxisSpacing: 25.h),
              itemBuilder: (context, index) =>
                  BlocBuilder<CountriesCubit, CountriesState>(
                    builder: (context, state) {
                      var cubit = CountriesCubit.get(context);
                      return InkWell(
                        onTap: () => cubit.selectCountry(index),
                        child: AvailableCountry(country: countries[index],
                            selected: cubit.selectedCountryIndex == index)
                      );
                    }
                  ),
              itemCount: countries.length)
        ]));
  }
}