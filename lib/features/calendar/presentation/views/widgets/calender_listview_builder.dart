import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/calendar/presentation/cubit/cubit.dart';
import 'package:roadapp/features/calendar/presentation/cubit/states.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/memo_widget.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/memos_shimmer.dart';

class CalenderListViewBuilder extends StatefulWidget {
  const CalenderListViewBuilder({super.key, this.order,});
  final String? order;
  @override
  _CalenderListViewBuilderState createState() =>
      _CalenderListViewBuilderState();
}

class _CalenderListViewBuilderState extends State<CalenderListViewBuilder> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<CalendarCubit>().fetchMemos(order: widget.order);
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final cubit = CalendarCubit.get(context);
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent &&
        !cubit.isLoadingMore) {
      // Fetch more memos when the user scrolls to the bottom.
      cubit.fetchMemos(
        order: widget.order,
        page: cubit.memosPage + 1, // Increment the page number
        more: true,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(builder: (context, state) {
      var cubit = CalendarCubit.get(context);

      if (state is FetchingMemosLoadingState||cubit.memos == null) {
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
        ]);
      }

      if (state is MemosErrorState) {
        return Center(child: Text(state.errorMessage));
      }
      if ( cubit.memos!.isEmpty) {
        return Center(child: Text(StringManager.noMemosAvailable.tr(context)));
      }

      return ListView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: cubit.memos!.length + 1,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            if (index == cubit.memos!.length) {
              if (state is MoreLoadingState) {
                return const MemosShimmer();
              }
              return const SizedBox.shrink();
            }
            return MemoWidget(memo: cubit.memos![index], index: index);
          }
      );
    });
  }
}