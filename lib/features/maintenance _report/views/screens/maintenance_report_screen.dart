import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/full_scan_report_item.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/maintenance_report_item.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/merged_report.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/vehicle_data_and_options.dart';
import '../../../../core/dependency_injection/di.dart';
import '../../data/repo/report_repo.dart';
import '../widgets/start_end_date.dart';

class MaintenanceReportScreen extends StatefulWidget {
  const MaintenanceReportScreen({
    super.key,
    required this.nameCompany,
    required this.model,
    required this.plateNumber,
    required this.index,
    required this.nameCar,
    required this.parameterValue,
  });

  final String index;
  final String nameCompany;
  final String nameCar;
  final String model;
  final String plateNumber;

  final String parameterValue;

  @override
  State<MaintenanceReportScreen> createState() =>
      _MaintenanceReportScreenState();
}

class _MaintenanceReportScreenState extends State<MaintenanceReportScreen> {
  final ScrollController _scrollController = ScrollController();
  late final MaintenanceReportCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = MaintenanceReportCubit(
      getIt.get<ReportRepo>(),
      vehicleId: widget.parameterValue,
      vehicleNumber: widget.plateNumber,
    )..getReports();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _cubit.close();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      _cubit.loadMoreReports();
    }
  }

  /// لو أول صفحة قصيرة ومش مالية الشاشة، مفيش scroll يحمّل الباقي —
  /// فنحمّل إحنا لحد ما الشاشة تتملي أو الصفحات تخلص.
  void _fillViewportIfNeeded() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;
      if (_scrollController.position.maxScrollExtent <= 0) {
        _cubit.loadMoreReports();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MaintenanceReportCubit>.value(
      value: _cubit,
      child: BlocConsumer<MaintenanceReportCubit, MaintenanceReportStates>(
        listener: (context, state) {
          if (state is GetReportsSuccessState ||
              state is ReportsSuccessMoreState ||
              state is FilterToggledState) {
            _fillViewportIfNeeded();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(
                text: StringManager.maintenanceReports.tr(context),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  VehicleDataAndOptions(
                    index: widget.index,
                    nameCompany: widget.nameCompany,
                    nameCar: widget.nameCar,
                    model: widget.model,
                    plateNumber: widget.plateNumber,
                    parameterValue: widget.parameterValue,
                  ),
                  SizedBox(height: 25.h),
                  const StartEndDate(),
                  SizedBox(height: 10.h),
                  if (!_cubit.isLoading && !_cubit.refreshFailed)
                    _FilterChips(cubit: _cubit),
                  // الهيدر والتواريخ بيفضلوا ظاهرين، والـ loader بس في مكان القائمة.
                  if (!_cubit.isLoading && _cubit.partialError)
                    _PartialErrorBanner(onRetry: _cubit.getReports),
                  Expanded(child: _buildContent(context)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_cubit.isLoading) {
      return const Center(child: CustomLoadingIndicator());
    }

    if (_cubit.refreshFailed) {
      return _ErrorView(onRetry: _cubit.getReports);
    }

    final reports = _cubit.reports;
    if (reports.isEmpty) {
      return Center(
        child: Text(
          StringManager.noReportsAvailable.tr(context),
          style: TextStyle(fontSize: 16.sp),
        ),
      );
    }

    final showFooter = _cubit.isLoadingMore || _cubit.loadMoreFailed;

    return ListView.separated(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: reports.length + (showFooter ? 1 : 0),
      separatorBuilder: (_, __) => const Gap(20),
      itemBuilder: (context, index) {
        if (index == reports.length) return _buildFooter(context);
        return _buildItem(context, reports[index]);
      },
    );
  }

  Widget _buildItem(BuildContext context, MergedReport item) {
    final report = item.report;
    final date = _cubit.formatDisplayDate(item.displayDate);

    if (item.isFullScan) {
      return FullScanReportItem(report: report, date: date);
    }

    return MaintenanceReportItem(
      name: report.maintenanceCenterName,
      phoneNumber: report.maintenanceCenterLandLine,
      date: date,
      services: report.services ?? const [],
      products: report.products ?? const [],
      totalPrice: formatAmount(item.totalPrice),
      verified: report.verified,
    );
  }

  Widget _buildFooter(BuildContext context) {
    if (_cubit.loadMoreFailed) {
      return Center(
        child: TextButton.icon(
          onPressed: _cubit.retryLoadMore,
          icon: const Icon(Icons.refresh),
          label: Text(StringManager.retry.tr(context)),
        ),
      );
    }
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: CircularProgressIndicator(color: AppColors.yellowColor2),
      ),
    );
  }
}

/// فلتر النوع مع عدد التقارير المحمّلة من كل نوع.
class _FilterChips extends StatelessWidget {
  const _FilterChips({required this.cubit});

  final MaintenanceReportCubit cubit;

  @override
  Widget build(BuildContext context) {
    final items = <(ReportFilter, String, int)>[
      (ReportFilter.all, StringManager.all.tr(context), cubit.totalCount),
      (
        ReportFilter.regular,
        StringManager.regularReport.tr(context),
        cubit.countOf(ReportKind.regular)
      ),
      (
        ReportFilter.fullScan,
        StringManager.fullScanReport.tr(context),
        cubit.countOf(ReportKind.fullScan)
      ),
    ];

    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (_, i) {
          final (value, label, count) = items[i];
          return ChoiceChip(
            label: Text('$label ($count)', style: TextStyle(fontSize: 11.sp)),
            selected: cubit.filter == value,
            selectedColor: AppColors.primaryColor,
            onSelected: (_) => cubit.setFilter(value),
          );
        },
      ),
    );
  }
}

/// فشل التحميل بالكامل (الاتنين).
class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            StringManager.reportsLoadFailed.tr(context),
            style: TextStyle(fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
          const Gap(8),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: Text(StringManager.retry.tr(context)),
          ),
        ],
      ),
    );
  }
}

/// نوع واحد بس من التقارير فشل — بنعرض اللي وصل ونوضّح للمستخدم إن في نقص.
class _PartialErrorBanner extends StatelessWidget {
  const _PartialErrorBanner({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, size: 18.sp, color: Colors.orange),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              StringManager.partialLoadFailed.tr(context),
              style: TextStyle(fontSize: 11.sp),
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: Text(StringManager.retry.tr(context)),
          ),
        ],
      ),
    );
  }
}
