import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../../../core/helpers/string_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../cubit/privacy_policy_cubit.dart';
import '../../data/repo/privacy_policy_repo.dart';

class PrivacyPoliceScreen extends StatelessWidget {
  const PrivacyPoliceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(text: StringManager.privacyPolicy.tr(context),),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
            builder: (context, state) {
              var cubit = PrivacyPolicyCubit.get(context);
              debugPrint(cubit.privacyPolicy);
              return state is PrivacyPolicyLoadingState ? const Center(child: CircularProgressIndicator()) : Column(
                children: [
                  Text(
                    '''${cubit.privacyPolicy}''',
                    style: TextStyle(
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),


    );
  }
}
