import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/features/search/data/repo/search_repo.dart';
import 'package:roadapp/features/search/presentation/cubit/search_cubit.dart';
import 'package:roadapp/features/search/presentation/views/widgets/for_my_vehicles.dart';
import 'package:roadapp/features/search/presentation/views/widgets/general_search.dart';
import 'package:roadapp/features/search/presentation/views/widgets/search_section_button.dart';

import '../../../../../core/dependency_injection/di.dart';
import '../../../../../core/helpers/functions/toast.dart';
import '../../../../../core/helpers/navigation/navigation.dart';
import '../../../../../core/helpers/string_manager.dart';
import '../../../../maintenance_service/views/screens/maintenance_service_screen.dart';
import '../../../../spare_parts/views/screens/spare_parts_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool showDropDown = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(getIt.get<SearchRepo>())
        ..fetchCarBrand()
        ..fetchVehiclesDropDown(),

      //..fetchCountriesDropDown()
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              var cubit = SearchCubit.get(context);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    cubit.isVendor != 'CLIENT'
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                showDropDown = !showDropDown;
                              });
                              cubit.fetchVehiclesDropDown();
                            },
                            child: showDropDown
                                ? ForMyVehicles(
                                    title:
                                        StringManager.forMyVehicles.tr(context),
                                  )
                                : ForMyVehicles(
                                    title:
                                        StringManager.generalSearch.tr(context),
                                  ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: 15.h,
                    ),
                    cubit.isVendor != 'CLIENT'
                        ? showDropDown
                            ? GeneralSearchWidget(cubit: cubit)
                            : myCarsSearchWidget(state, cubit, context)
                        : GeneralSearchWidget(cubit: cubit),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Column myCarsSearchWidget(
      SearchState state, SearchCubit cubit, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        !showDropDown
            ? (state is CarBrandDropDawnLoadingState ||
                    state is FetchingVehiclesLoadingState
                ? const Center(child: CircularProgressIndicator())
                : DropdownButton<String>(
                    isExpanded: true,
                    value: cubit.selectedVehicle,
                    hint: const Text("اختر المركبة"),
                    items: cubit.vehiclesDropDown?.map((vehicle) {
                      return DropdownMenuItem<String>(
                        value: vehicle.id,
                        child: Text(
                            "${vehicle.brandId?.name ?? ''} - ${vehicle.model ?? ''}"),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        debugPrint('===========??>> $value');
                        cubit.selectedVehicle = value;

                        final selectedVehicle =
                            cubit.vehiclesDropDown?.firstWhere(
                          (vehicle) => vehicle.id == value,
                          orElse: () => null!,
                        );

                        cubit.selectedCarBrandIdFromVehicle =
                            selectedVehicle?.brandId?.id;
                        cubit.selectedCarBrandYearFromVehicle =
                            selectedVehicle?.manufacturingYear;
                        cubit.selectedCarBrandNameModelFromVehicle =
                            selectedVehicle?.model;
                        cubit.selectedCarBrandNameFromVehicle =
                            "${selectedVehicle?.brandId?.name}";
                      });
                    },
                  ))
            : const SizedBox.shrink(),
        SizedBox(
          height: 40.h,
        ),
        Row(
          children: [
            // Expanded(
            //   child: SearchCountriesDropDown(
            //     label: StringManager.country.tr(context),
            //     hint: StringManager.selectCountry
            //         .tr(context),
            //   ),
            // ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringManager.car.tr(context),
                    style: const TextStyle(fontSize: 10),
                  ),
                  Container(
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: cubit.selectedCarBrandNameFromVehicle == null
                            ? const Text('')
                            : Text(
                                cubit.selectedCarBrandNameFromVehicle
                                    .toString(),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              width: 10,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringManager.carModel.tr(context),
                    style: const TextStyle(fontSize: 10),
                  ),
                  Container(
                    height: 35.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: FittedBox(
                        child:
                            cubit.selectedCarBrandNameModelFromVehicle == null
                                ? const Text('')
                                : Text(
                                    cubit.selectedCarBrandNameModelFromVehicle
                                        .toString(),
                                  ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.manufactureYear.tr(context),
                  style: const TextStyle(fontSize: 10),
                ),
                Container(
                  height: 35.w,
                  width: 160,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: FittedBox(
                      child: cubit.selectedCarBrandYearFromVehicle == null
                          ? const Text('')
                          : Text(
                              cubit.selectedCarBrandYearFromVehicle.toString(),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SearchSectionButton(
                text: StringManager.maintenanceServices.tr(context),
                voidCallback: () {
                  if (cubit.selectedCountryName != null &&
                      cubit.selectedCarBrandIdFromVehicle != null) {
                    AppNavigation.navigate(
                      MaintenanceServiceScreen(
                        countries: cubit.selectedCountryName ?? '',
                        carBrandId: cubit.selectedCarBrandIdFromVehicle ?? '',
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
            ),
            SizedBox(
              width: 35.w,
            ),
            Expanded(
              child: SearchSectionButton(
                text: StringManager.spareParts.tr(context),
                voidCallback: () {
                  if (cubit.selectedCountryName != null &&
                      cubit.selectedCarBrandIdFromVehicle != null) {
                    AppNavigation.navigate(
                      SparePartsScreen(
                        countries: cubit.selectedCountryName ?? '',
                        carBrandId: cubit.selectedCarBrandIdFromVehicle ?? '',
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
            ),
          ],
        ),
      ],
    );
  }
}
