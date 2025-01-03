import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/search/data/repo/search_repo.dart';
import 'package:roadapp/features/search/presentation/cubit/search_cubit.dart';
import 'package:roadapp/features/search/presentation/views/widgets/for_my_vehicles.dart';
import 'package:roadapp/features/search/presentation/views/widgets/general_search.dart';

import '../../../../../core/dependency_injection/di.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      SearchCubit(getIt.get<SearchRepo>())..fetchCountriesDropDown()..fetchCarBrand(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: const Column(
            children: [
              ForMyVehicles(),
              Expanded(
                child: GeneralSearch(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
