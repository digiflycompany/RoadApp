import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';
import 'package:roadapp/features/work_reports/presentation/views/widgets/maintenance_bill.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../widgets/date_widget.dart';
import '../widgets/select_process_type.dart';

class WorkReportsScreen extends StatefulWidget {
  const WorkReportsScreen({super.key});

  @override
  State<WorkReportsScreen> createState() => _WorkReportsScreenState();
}

class _WorkReportsScreenState extends State<WorkReportsScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    }
  }

  void _loadMoreData() {
    var cubit = context.read<WorkReportsCubit>();
    cubit.fetchWorkReports(page: cubit.workReportsPage + 1, more: true);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkReportsCubit, WorkReportsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: preferredSize,
              child: CustomAppBar(text: StringManager.salesReport.tr(context))),
          body: state is FetchWorkReportsErrorState
              ? const Center(
                  child: Text(
                  'حدث خطأ أثناء تحميل البيانات.',
                ))
              : SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        //const ToggleBox(),
                        SizedBox(height: 20.h),
                        const ProcessDateStartAndEnd(),
                        SizedBox(height: 10.h),
                        // const ProcessType(bonds: false),
                        const SelectProcessType(
                          bonds: true,
                        ),
                        SizedBox(height: 16.h),

                        state is FetchWorkReportsLoadingState
                            ? const CustomLoadingIndicator(
                                height: 300,
                                width: double.infinity,
                              )
                            : const MaintenanceBill(),

                        SizedBox(
                          height: 20.h,
                        ),

                        state is FetchWorkReportsLoadingMoreState
                            ? const CustomLoadingIndicator(
                                width: double.infinity,
                                height: 60,
                              )
                            : const SizedBox(
                                height: 20,
                              ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
