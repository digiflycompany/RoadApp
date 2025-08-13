import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/calendar/presentation/cubit/cubit.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/add_memo_button.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/calender_listview_builder.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/memos_filter_button.dart';

import '../../cubit/states.dart';

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

    // CalendarCubit.get(context).fetchVehiclesDropDown();
    CalendarCubit.get(context).checkUserType();
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
          child: Column(
            children: [
              Row(children: [
                Text(StringManager.date.tr(context),
                    style:
                        TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold)),
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
              const VehicleHomeDropdown(),
              CalenderListViewBuilder(
                order: widget.order,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VehicleHomeDropdown extends StatelessWidget {
  const VehicleHomeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        var cubit = CalendarCubit.get(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.filterBy.tr(context),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // اختيار نوع البحث (General أو Specific)
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('GENERAL'),
                    value: true,
                    groupValue: cubit.isGeneralSelected,
                    onChanged: (value) {
                      if (value != null) {
                        cubit.changeFilterType(value);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('SPECIFIC'),
                    value: false,
                    groupValue: cubit.isGeneralSelected,
                    onChanged: (value) {
                      if (value != null) {
                        cubit.changeFilterType(value);
                      }
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // **إظهار اختيار العميل إذا كان المستخدم Vendor واختار "SPECIFIC"**
            cubit.isGeneralSelected
                ? const SizedBox()
                : cubit.isVendor == 'CLIENT'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("اختر العميل",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: cubit.selectedClient,
                            hint: const Text("اختر عميل"),
                            items: cubit.customerReportList?.map((client) {
                              return DropdownMenuItem<String>(
                                value: client.id,
                                child: Text(client.fullName),
                              );
                            }).toList(),
                            onChanged: (value) => cubit.changeClient(value!),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      )

                    // اختيار المركبة (يظهر فقط عند اختيار "Specific")
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("اختر العميل",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: cubit.selectedClient,
                            hint: const Text("اختر عميل"),
                            items: cubit.customerReportList?.map((client) {
                              return DropdownMenuItem<String>(
                                value: client.id,
                                child: Text(client.fullName),
                              );
                            }).toList(),
                            onChanged: (value) => cubit.changeClient(value!),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
          ],
        );
      },
    );
  }
}

