import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/section_point.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/section_row.dart';

class ExpansionTileExample extends StatefulWidget {
  final String title;
  final String point1;
  final String point2;
  final String point3;
  final String point4;
  final String point5;
  final String point6;

  const ExpansionTileExample({
    super.key,
    required this.title,
    required this.point1,
    required this.point2,
    required this.point3,
    required this.point4,
    required this.point5,
    required this.point6,
  });

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: _isExpanded ? Colors.white : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r)),
        child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
            childrenPadding: EdgeInsets.zero,
            title: Align(
                alignment: Alignment.centerRight,
                child: Text(widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))),
            trailing: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.black),
            backgroundColor: Colors.transparent,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isExpanded = expanded;
              });
            },
            children: [
              Container(
                  padding:
                      EdgeInsets.only(right: 16.w, left: 8.w, bottom: 16.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            StringManager.thisSectionCoverTheFollowingPoints
                                .tr(context),
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp)),
                        SizedBox(height: 10.h),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SectionPoint(point: widget.point1),
                                    SizedBox(height: 10.h),
                                    SectionPoint(point: widget.point2),
                                    SizedBox(height: 10.h),
                                    SectionPoint(point: widget.point3),
                                    SizedBox(height: 10.h),
                                    SectionPoint(point: widget.point4),
                                    SizedBox(height: 10.h),
                                    SectionPoint(point: widget.point5),
                                    SizedBox(height: 10.h),
                                    SectionPoint(point: widget.point6)
                                  ]),
                              const Spacer(),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SectionRow(),
                                    SizedBox(height: 15.3.h),
                                    const SectionRow(),
                                    SizedBox(height: 15.3.h),
                                    const SectionRow(),
                                    SizedBox(height: 15.3.h),
                                    const SectionRow(),
                                    SizedBox(height: 15.3.h),
                                    const SectionRow(),
                                    SizedBox(height: 15.3.h),
                                    const SectionRow()
                                  ])
                            ])
                      ]))
            ]));
  }
}