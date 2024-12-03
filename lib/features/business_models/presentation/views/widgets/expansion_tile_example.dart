import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/section_point.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/section_row.dart';

class ExpansionTileExample extends StatefulWidget {
  final String title;
  final String point1;
  final String point1En;
  final String point2;
  final String point2En;
  final String point3;
  final String point3En;
  final String point4;
  final String point4En;
  final String? point5;
  final String? point5En;
  final String? point6;
  final String? point6En;

  const ExpansionTileExample({
    super.key,
    required this.title,
    required this.point1,
    required this.point2,
    required this.point3,
    required this.point4,
    this.point5,
    this.point6,
    required this.point1En,
    required this.point2En,
    required this.point3En,
    required this.point4En,
    this.point5En,
    this.point6En,
  });

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
      builder: (context, state) {
        var cubit = BusinessModelsCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            color: _isExpanded ? Colors.white : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
            title: Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            //showTrailingIcon: true,
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            collapsedBackgroundColor: AppColors.primaryColor,
            backgroundColor: Colors.white,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isExpanded = expanded;
              });
            },
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow(widget.point1, widget.point1En, cubit),
                  _buildRow(widget.point2, widget.point2En, cubit),
                  _buildRow(widget.point3, widget.point3En, cubit),
                  _buildRow(widget.point4, widget.point4En, cubit),
                  widget.point5En != null
                      ? _buildRow(widget.point5!, widget.point5En!, cubit)
                      : const SizedBox(),
                  widget.point6En != null
                      ? _buildRow(widget.point6!, widget.point6En!, cubit)
                      : const SizedBox(),
                ],
              ),
              // ElevatedButton(
              //   onPressed: cubit.createFullScanReport,
              //   child: const Text("إرسال البيانات"),
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow(String point, String pointEn, BusinessModelsCubit cubit) {
    int? currentValue = cubit.pointValues[pointEn];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SectionPoint(
          point: point,
        ),
        SectionRow(
          initialValue: currentValue ?? 1,
          onValueSelected: (value) => cubit.updatePointValue(pointEn, value),
        ),
      ],
    );
  }
}
