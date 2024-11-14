import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
import 'package:roadapp/core/helpers/functions/show_default_loading_indicator.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/layout/presentation/views/screens/app_layout.dart';
import 'package:roadapp/features/service_country/presentation/cubit/countries_cubit.dart';
import 'package:roadapp/features/service_country/presentation/cubit/countries_state.dart';

class SelectCountryButton extends StatelessWidget {
  const SelectCountryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountriesCubit, CountriesState>(
        listener: (context, state) {
      if (state is SetCountryLoadingState) {
        showDefaultLoadingIndicator(context, cancelable: false);
      }
      if (state is SetCountryErrorState) {
        Navigator.pop(context);
        showDefaultDialog(context,
            type: NotificationType.error,
            description: state.error,
            title: StringManager.errorSettingYourCountry.tr(context));
      }
      if (state is CountrySelectionSuccessState) {
        AppNavigation.navigateOffAll(const AppLayout());
      }
    }, builder: (context, state) {
      var cubit = CountriesCubit.get(context);
      return CustomElevatedButton(
          onTap: () => cubit.setUserCountry(),
          width: 200.w,
          height: 50.h,
          widget: Text(StringManager.select.tr(context),
              style: TextStyle(fontSize: 11.sp)));
    });
  }
}