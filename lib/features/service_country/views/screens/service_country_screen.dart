import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/service_country/views/widgets/countries_grid.dart';
import 'package:roadapp/features/service_country/views/widgets/select_country_button.dart';

class ServiceCountryScreen extends StatelessWidget {
  const ServiceCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(
              text: StringManager.chooseServiceCountry.tr(context)),
        ),
        body: Padding(
            padding: EdgeInsets.only(
                top: 50.h, bottom: 20.h, right: 15.w, left: 15.w),
            child: Column(children: [
              const Expanded(child: CountriesGrid()),
              SizedBox(height: 20.h),
              const SelectCountryButton()
            ])));
  }
}
