import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      onPopInvoked: (v){
        AdsCubit.get(context).image = null ;
        AdsCubit.get(context).imageUrl = null ;
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.addAds.tr(context))),

        body: BlocConsumer<AdsCubit, AdsState>(
          listener: (context, state) {
            if(state is AddAdsSuccessState){
              showToast(message: 'success', state: ToastStates.success);
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            var cubit = AdsCubit.get(context);
              return  Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const AdsUploadImage(),

                    state is AddAdsLoadingState || state is AdsUploadLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomElevatedButtonTwo(
                        width: double.infinity,
                        onTap: () {
                            cubit.addAds();
                        },
                        widget: Text(
                          StringManager.add.tr(context),
                        )
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
