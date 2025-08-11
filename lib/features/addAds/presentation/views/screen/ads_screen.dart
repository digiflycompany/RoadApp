import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_elevated_button_two.dart';
import 'package:roadapp/features/addAds/presentation/cubit/ads_cubit.dart';
import '../widgets/ads_upload_image.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (v) {
        AdsCubit.get(context).image = null;
        AdsCubit.get(context).imageUrl = null;
        AdsCubit.get(context).type = null;
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.addAds.tr(context))),
        body: BlocConsumer<AdsCubit, AdsState>(
          listener: (context, state) {
            if (state is AddAdsSuccessState) {
              showToast(message: 'success', state: ToastStates.success);
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            var cubit = AdsCubit.get(context);

            Map<String, String> adTypes = {
              StringManager.sparePartes.tr(context): 'Spare_Parts',
              StringManager.maintenanceCenter.tr(context): 'Maintenance_Center',
              StringManager.carAccessories.tr(context): 'Car_Accessories',
              StringManager.carRental.tr(context): 'Car_Rental',
              StringManager.autoServices.tr(context): 'Auto_Services',
            };

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const AdsUploadImage(),

                  // Dropdown to select ad type
                  DropdownButton<String>(
                    value: cubit.type,
                    hint: Text(StringManager.select.tr(context)),
                    isExpanded: true,
                    items: adTypes.entries.map((entry) {
                      return DropdownMenuItem<String>(
                        value: entry.value,
                        child: Text(entry.key),
                      );
                    }).toList(),
                    onChanged: (value) {
                      cubit.type = value;
                      cubit.emit(AdsTypeSelectedState()); // Update UI
                    },
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  state is AddAdsLoadingState || state is AdsUploadLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : CustomElevatedButtonTwo(
                          width: double.infinity,
                          onTap: () {
                            cubit.addAds(context);
                          },
                          widget: Text(
                            StringManager.add.tr(context),
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// class AdsScreen extends StatelessWidget {
//   const AdsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: true,
//       onPopInvoked: (v){
//         AdsCubit.get(context).image = null ;
//         AdsCubit.get(context).imageUrl = null ;
//       },
//       child: Scaffold(
//         appBar: PreferredSize(
//             preferredSize: preferredSize,
//             child: CustomAppBar(text: StringManager.addAds.tr(context))),
//
//         body: BlocConsumer<AdsCubit, AdsState>(
//           listener: (context, state) {
//             if(state is AddAdsSuccessState){
//               showToast(message: 'success', state: ToastStates.success);
//               Navigator.pop(context);
//             }
//           },
//           builder: (context, state) {
//             var cubit = AdsCubit.get(context);
//               return  Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     const AdsUploadImage(),
//
//                     state is AddAdsLoadingState || state is AdsUploadLoadingState
//                         ? const Center(child: CircularProgressIndicator())
//                         : CustomElevatedButtonTwo(
//                         width: double.infinity,
//                         onTap: () {
//                             cubit.addAds();
//                         },
//                         widget: Text(
//                           StringManager.add.tr(context),
//                         )
//                     ),
//                   ],
//                 ),
//               );
//           },
//         ),
//       ),
//     );
//   }
// }
