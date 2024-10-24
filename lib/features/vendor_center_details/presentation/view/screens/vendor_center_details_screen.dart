import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/accessories_center_details/presentation/view/widgets/accessories_center_details_chart.dart';
import 'package:roadapp/features/vendor_center_details/cubit/vendor_center_details_cubit.dart';
import 'package:roadapp/features/vendor_center_details/cubit/vendor_center_details_states.dart';
import 'package:roadapp/features/vendor_center_details/presentation/view/widgets/center_contact.dart';
import 'package:roadapp/features/vendor_center_details/presentation/view/widgets/center_logo.dart';
import 'package:roadapp/features/vendor_center_details/presentation/view/widgets/center_search_row.dart';
import 'package:roadapp/features/vendor_center_details/presentation/view/widgets/service_data.dart';

class VendorCenterDetailsScreen extends StatelessWidget {
  const VendorCenterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VendorCenterDetailsCubit(context),
      child: BlocConsumer<VendorCenterDetailsCubit,
          VendorCenterDetailsStates>(
        listener:
            (BuildContext context, VendorCenterDetailsStates state) {},
        builder: (BuildContext context, VendorCenterDetailsStates state) {
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: preferredSize,
                child: CustomAppBar(text: StringManager.profile.tr(context))),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CenterLogo(),
                    const CenterContact(),
                    const ServiceData(),
                    SizedBox(height: 25.h),
                    const CenterSearchRow(),
                    SizedBox(height: 25.h),
                    const AccessoriesCenterDetailsChart(),
                    SizedBox(height: 10.h)
                  ]))));
        }));
  }
}