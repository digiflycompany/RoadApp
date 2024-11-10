import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/calendar/presentation/cubit/cubit.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/add_memo_button.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/calender_listview_builder.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/memos_filter_button.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key, this.order});
  final String? order;

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
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
    final cubit = context.read<CalendarCubit>();
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
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.timelineMemo.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(children: [
                  Row(children: [
                    Text(StringManager.date.tr(context),
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.bold)),
                    Gap(isArabic
                        ? (width >= 400
                            ? 20.4
                            : (width >= 380 ? 20 : (width >= 370 ? 20.5 : 20)))
                        : 25.7),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: SizedBox(
                            height: 80.h,
                            child: const VerticalDivider(
                                thickness: .5, color: Colors.black26))),
                    const Spacer(),
                    const AddMemoButton(),
                    const MemosFilterButton()
                  ]),
                  CalenderListViewBuilder(order: widget.order)
                ]))));
  }
}