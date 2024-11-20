import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/road_services/cubit/road_service_cubit.dart';
import 'package:roadapp/features/road_services/views/widgets/gas_station_container.dart';

import '../../../../core/Theming/colors.dart';
import '../../../../core/dependency_injection/di.dart';
import '../../data/repo/road_service_repo.dart';

class GasStationsScreen extends StatelessWidget {
  const GasStationsScreen({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return BlocProvider(
      create: (context) => RoadServiceCubit(getIt.get<RoadServiceRepo>())
        ..getRoadService(type: type),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(
            text: StringManager.nearestGasStation.tr(context),
          ),
        ),

        body: BlocBuilder<RoadServiceCubit, RoadServiceState>(
          builder: (context, state) {
            var cubit = RoadServiceCubit.get(context);
            var road = cubit.roadServicesResponse?.data.roadServices ?? [];

            // Add listener to scroll controller to detect when user reaches bottom
            scrollController.addListener(() {
              if (scrollController.position.pixels >=
                      scrollController.position.maxScrollExtent &&
                  state is! GetRoadServiceMoreLoading) {
                // Trigger loading more reports
                cubit.loadMoreRoadService(type);
              }
            });

            return state is GetRoadServiceLoading
                ? const CustomLoadingIndicator()
                : Padding(
                    padding: EdgeInsets.all(20.r),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: road.isEmpty
                                ? Center(
                                    child: Text(
                                      "Not available",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  )
                                : ListView.separated(
                                    controller: scrollController,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      var roadService = road[index];
                                      return GasStationContainer(
                                        roadService: roadService,
                                        image: roadService.photo,
                                        title: roadService.name,
                                        location: roadService.address,
                                        locationMap: roadService.mapsLink,
                                        phone: roadService.phoneNumber,
                                      );
                                    },
                                    separatorBuilder: (_, index) =>
                                        const Gap(5),
                                    itemCount: road.length,
                                  ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          state is GetRoadServiceMoreLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.yellowColor2,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
