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

import '../../../../core/Theming/colors.dart';
import '../../../../core/dependency_injection/di.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

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

            var notification =
                cubit.notificationResponse?.data?.notifications ?? [];

            // Add listener to scroll controller to detect when user reaches bottom
            _scrollController.addListener(() {
              if (_scrollController.position.pixels >=
                      _scrollController.position.maxScrollExtent &&
                  state is! GetMoreNotificationLoadingState) {
                // Trigger loading more reports
                cubit.loadMoreNotification();
              }
            });

            return state is GetNotificationLoadingState
                ? const CustomLoadingIndicator()
                : Column(
                    children: [
                      Expanded(
                        child: notification.isEmpty
                            ? Center(
                                child: Text(
                                  "Not available",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              )
                            : ListView.separated(
                                controller: _scrollController,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (_, index) {
                                  final notificationService =
                                      notification[index];
                                  return NotificationBox(
                                    date: cubit.formatDate(
                                        notificationService.date.toString()),
                                    title:
                                        notificationService.message.toString(),
                                  );
                                },
                                separatorBuilder: (_, index) => const Gap(5),
                                itemCount: notification.length,
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (state is! GetMoreNotificationLoadingState) {
                            cubit.loadMoreNotification();
                          }
                        },
                        child: MediaQuery.of(context).size.width > 600
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  "Load More",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.yellowColor2,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ),
                      if (state is GetMoreNotificationLoadingState)
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            color: AppColors.yellowColor2,
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
