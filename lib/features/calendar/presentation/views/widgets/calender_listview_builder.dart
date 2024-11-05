import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/calendar/data/repos/memos_repo.dart';
import 'package:roadapp/features/calendar/presentation/cubit/cubit.dart';
import 'package:roadapp/features/calendar/presentation/cubit/states.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/memo_widget.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/memos_shimmer.dart';

class CalenderListViewBuilder extends StatelessWidget {
  const CalenderListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            CalendarCubit(getIt.get<MemosRepo>())..fetchMemos(),
        child: BlocBuilder<CalendarCubit, CalendarState>(
            builder: (context, state) {
          var cubit = CalendarCubit.get(context);

          if (state is FetchingMemosLoadingState) {
            return Column(children: [
              Gap(20.h),
              const MemosShimmer(),
              Gap(20.h),
              const MemosShimmer(),
              Gap(20.h),
              const MemosShimmer(),
              Gap(20.h),
              const MemosShimmer(),
              Gap(20.h),
              const MemosShimmer(),
              Gap(20.h),
              const MemosShimmer()
            ]);
          }

          if (state is MemosErrorState) {
            return Center(child: Text(state.errorMessage));
          }
          if (cubit.memos == null || cubit.memos!.isEmpty) {
            return Center(
                child: Text(StringManager.noMemosAvailable.tr(context)));
          }
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cubit.memos!.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                if (index >= cubit.memos!.length) {
                  return const SizedBox.shrink();
                }
                return MemoWidget(memo: cubit.memos![index], index: index);
              });
        }));
  }
}