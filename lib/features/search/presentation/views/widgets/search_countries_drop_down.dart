import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/features/search/presentation/cubit/search_cubit.dart';

import '../../../../../core/Theming/colors.dart';

class SearchCountriesDropDown extends StatefulWidget {
  const SearchCountriesDropDown({super.key, required this.label, required this.hint});

  final String label, hint;

  @override
  _SearchCountriesDropDownState createState() => _SearchCountriesDropDownState();
}

class _SearchCountriesDropDownState extends State<SearchCountriesDropDown> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        var countriesList = cubit.countriesModel?.data.countries;

        return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(fontSize: 10),
                  ),
                  const Gap(4),
                  Container(
                    height: 31.2,
                    decoration: BoxDecoration(
                      color: const Color(0xFFECECEC),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: DropdownButton<String>(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      hint: Text(
                        cubit.selectedCountryName ?? widget.hint,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xffAAAAAA),
                        ),
                      ),
                      items: countriesList?.map((country) {
                        return DropdownMenuItem<String>(
                          value: country.name,
                          child: Text(country.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          cubit.selectedCountryName = val;
                        });
                        print("Selected Country: ${cubit.selectedCountryName}");
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
