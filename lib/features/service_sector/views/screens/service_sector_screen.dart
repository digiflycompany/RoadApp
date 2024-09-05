import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/service_country/views/screens/service_country_screen.dart';
import 'package:roadapp/features/service_sector/views/widgets/available_sector.dart';
import 'package:roadapp/features/service_sector/views/widgets/soon_sector.dart';
import 'package:roadapp/core/navigation/navigation.dart';

class ServiceSectorScreen extends StatelessWidget {
  const ServiceSectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.chooseServiceSector.tr(context))),
        body: Padding(
            padding: EdgeInsets.only(
                top: 50.h, bottom: 20.h, right: 15.w, left: 15.w),
            child: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 170.h,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 25.w,
                                    mainAxisSpacing: 25.h),
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return const AvailableSector();
                              } else {
                                return const SoonSector();
                              }
                            },
                            itemCount: 9)
                      ]))),
              SizedBox(
                height: 20.h
              ),
              CustomElevatedButton(
                  onTap: () {
                    AppNavigation.navigate(const ServiceCountryScreen());
                  },
                  width: 200.w,
                  height: 50.h,
                  widget: Text(StringManager.select.tr(context),
                      style: TextStyle(fontSize: 11.sp)))
            ])));
  }
}