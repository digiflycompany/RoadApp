import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/notification/cubit/notification_cubit.dart';
import 'package:roadapp/features/notification/data/repo/notification_repo.dart';
import 'package:roadapp/features/notification/views/widgets/notification_box.dart';

import '../../../../core/dependency_injection/di.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationCubit>(
      create: (BuildContext context) =>
          NotificationCubit(getIt.get<NotificationRepo>())..fetchNotification(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.notifications.tr(context),
                notificationIcon: false)),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            var cubit = NotificationCubit.get(context);
            return state is GetNotificationLoadingState
                ? const CustomLoadingIndicator()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16.h),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: ListView.separated(
                            itemCount: cubit.notificationResponses!.data!
                                .notifications!.length,
                            itemBuilder: (context, index) {
                              return NotificationBox(
                                date: cubit.formatDate(cubit
                                    .notificationResponses!
                                    .data!
                                    .notifications![index]
                                    .date
                                    .toString()),
                                title: cubit.notificationResponses!.data!
                                    .notifications![index].message
                                    .toString(),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Gap(14),
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
