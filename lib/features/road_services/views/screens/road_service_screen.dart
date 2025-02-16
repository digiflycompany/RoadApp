import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';

import '../../../../core/Theming/colors.dart';
import '../../../../core/helpers/string_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../data/models/road_service_model.dart';

class ServiceMenu extends StatelessWidget {
  const ServiceMenu({super.key, required this.roadService});
  final RoadService roadService;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(
          text: StringManager.servicesMenu.tr(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
           roadService.services.isEmpty ? const Center(child: Text('No Services')) : Expanded(
              child: ListView.builder(
                        itemCount: roadService.services.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: double.infinity,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    roadService.services[index],
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            );
                          },
                      ),
            ),
          ]
        ),
      ),
    );
  }
}
