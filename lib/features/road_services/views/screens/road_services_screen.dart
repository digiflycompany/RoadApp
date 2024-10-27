import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/road_services/views/screens/gas_stations_screen.dart';
import 'package:roadapp/features/road_services/views/widgets/road_services_container.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';

class RoadServicesScreen extends StatelessWidget {
  const RoadServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.roadServices.tr(context))),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(20.r),
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RoadServicesContainer(
                              title:
                                  StringManager.nearestGasStation.tr(context),
                              icon: AppAssets.gasIcon,
                              onTap: () => AppNavigation.navigate(
                                  const GasStationsScreen())),
                          RoadServicesContainer(
                              title: StringManager.restaurantsAndCoffeeShops
                                  .tr(context),
                              icon: AppAssets.restaurantIcon),
                          RoadServicesContainer(
                              title: StringManager.nearestMedicalAssistance
                                  .tr(context),
                              icon: AppAssets.hospitalIcon),
                          RoadServicesContainer(
                              title: StringManager.roadsideRepair.tr(context),
                              icon: AppAssets.fixingIcon),
                          RoadServicesContainer(
                              title: StringManager.rescueCranes.tr(context),
                              icon: AppAssets.rescueIcon),
                          RoadServicesContainer(
                              title:
                                  StringManager.intercityShipping.tr(context),
                              icon: AppAssets.transportIcon)
                        ])))));
  }
}