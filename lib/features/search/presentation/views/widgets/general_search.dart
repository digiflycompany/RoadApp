import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/maintenance_service/views/screens/maintenance_service_screen.dart';
import 'package:roadapp/features/search/presentation/cubit/search_cubit.dart';
import 'package:roadapp/features/search/presentation/views/widgets/search_countries_drop_down.dart';
import 'package:roadapp/features/search/presentation/views/widgets/search_section_button.dart';
import 'package:roadapp/features/spare_parts/views/screens/spare_parts_screen.dart';

import '../../../../../core/Theming/colors.dart';
import 'car_brand_drop_down.dart';

class GeneralSearch extends StatelessWidget {
  const GeneralSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              StringManager.generalSearch.tr(context),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
          BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {
              if (state is GetCarBrandLoading && state is GetCountriesLoading) {
                 const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.yellowColor2,
                  ),
                );
              }
            },
            builder: (context, state) {
              var cubit = SearchCubit.get(context);

              if (state is GetCarBrandLoading || state is GetCountriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.yellowColor2,
                  ),
                );
              }


              return GridView.count(
                childAspectRatio:
                MediaQuery.of(context).size.height * .0035,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true, // للتأكد من أن GridView لا تتمدد بشكل غير منطقي
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                children: [
                  SearchCountriesDropDown(
                    label: StringManager.country.tr(context),
                    hint: StringManager.selectCountry.tr(context),
                  ),
                  CarBrandDropDown(
                    label: StringManager.carModel.tr(context),
                    hint: StringManager.typeCarModel.tr(context),
                  ),
                  SearchSectionButton(
                    text: StringManager.maintenanceServices.tr(context),
                    voidCallback: () {
                      if (cubit.selectedCountryName != null &&
                          cubit.selectedCarBrandId != null) {
                        AppNavigation.navigate(
                          MaintenanceServiceScreen(
                            countries: cubit.selectedCountryName ?? '',
                            carBrandId: cubit.selectedCarBrandId ?? '',
                          ),
                        );
                      } else {
                        showToast(
                          message: 'Please Select Data',
                          state: ToastStates.error,
                        );
                      }
                    },
                  ),
                  SearchSectionButton(
                    text: StringManager.spareParts.tr(context),
                    voidCallback: () {
                      if (cubit.selectedCountryName != null &&
                          cubit.selectedCarBrandId != null) {
                        AppNavigation.navigate(
                          SparePartsScreen(
                            countries: cubit.selectedCountryName ?? '',
                            carBrandId: cubit.selectedCarBrandId ?? '',
                          ),
                        );
                      } else {
                        showToast(
                          message: 'Please Select Data',
                          state: ToastStates.error,
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
          Gap(60.h),
        ],
      ),
    );
  }
}
