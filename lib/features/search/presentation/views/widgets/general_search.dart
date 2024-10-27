import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/accessories/presentation/views/screens/accessories_screen.dart';
import 'package:roadapp/features/maintenance_service/views/screens/maintenance_service_screen.dart';
import 'package:roadapp/features/oils_and_consumables/views/screens/oils_and_consumables_screen.dart';
import 'package:roadapp/features/search/presentation/views/widgets/filter_text_field.dart';
import 'package:roadapp/features/search/presentation/views/widgets/search_drop_down.dart';
import 'package:roadapp/features/search/presentation/views/widgets/search_section_button.dart';
import 'package:roadapp/features/spare_parts/views/screens/spare_parts_screen.dart';

class GeneralSearch extends StatelessWidget {
  const GeneralSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(StringManager.generalSearch.tr(context),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 10))),
      Expanded(
          child: GridView.count(
              childAspectRatio: MediaQuery.of(context).size.height * .0035,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              children: [
            SearchDropDown(
                label: StringManager.country.tr(context),
                hint: StringManager.selectCountry.tr(context)),
            SearchDropDown(
                label: StringManager.neighborhoodOrCity.tr(context),
                hint: StringManager.selectCityOrNeighborhood.tr(context)),
            FilterTextField(
                label: StringManager.vehicleType.tr(context),
                hint: StringManager.typeVehicleType.tr(context)),
            FilterTextField(
                label: StringManager.carModel.tr(context),
                hint: StringManager.typeCarModel.tr(context)),
            FilterTextField(
                label: StringManager.manufactureYear.tr(context),
                hint: StringManager.typeManufactureYear.tr(context)),
            FilterTextField(
                label: StringManager.transmissionType.tr(context),
                hint: StringManager.typeTransmissionType.tr(context)),
            SearchSectionButton(
                text: StringManager.accessories.tr(context),
                voidCallback: () =>
                    AppNavigation.navigate(const AccessoriesScreen())),
            SearchSectionButton(
                text: StringManager.maintenanceServices.tr(context),
                voidCallback: () =>
                    AppNavigation.navigate(const MaintenanceServiceScreen())),
            SearchSectionButton(
                text: StringManager.spareParts.tr(context),
                voidCallback: () =>
                    AppNavigation.navigate(const SparePartsScreen())),
            SearchSectionButton(
                text: StringManager.oilsAndConsumables.tr(context),
                voidCallback: () =>
                    AppNavigation.navigate(const OilsAndConsumablesScreen()))
          ])),
      Gap(60.h)
    ]);
  }
}