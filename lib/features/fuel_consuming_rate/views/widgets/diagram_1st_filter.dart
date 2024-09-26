import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/fuel_consuming_rate/views/widgets/diagram_2nd_filter.dart';

class Diagram1stFilter extends StatelessWidget {
  Diagram1stFilter({super.key});
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(EvaIcons.options2Outline),
        constraints: const BoxConstraints(),
        onPressed: () {
          showCustomAlertDialog(
              context: context,
              title: StringManager.filterBy.tr(context),
              content: StatefulBuilder(builder: (ctxx, setState) {
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                      height: 150.h,
                      width: double.maxFinite,
                      child: GridView.count(
                          padding: EdgeInsets.zero,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 4,
                          children: [
                            _buildRadioTile(
                                StringManager.month.tr(context), setState),
                            _buildRadioTile(
                                '3 ${StringManager.months.tr(context)}',
                                setState),
                            _buildRadioTile(
                                '6 ${StringManager.months.tr(context)}',
                                setState),
                            _buildRadioTile(
                                '9 ${StringManager.months.tr(context)}',
                                setState),
                            _buildRadioTile(
                                StringManager.oneYear.tr(context), setState)
                          ])),
                  CustomElevatedButton(
                      onTap: () {
                        Navigator.pop(context);
                        showCustomAlertDialog(
                            context: context,
                            title: StringManager.filterBy.tr(context),
                            content: const Diagram2ndFilter());
                      },
                      widget: Text(StringManager.select.tr(context),
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w600)))
                ]);
              }));
        });
  }

  Widget _buildRadioTile(String value, StateSetter setState) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          value,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
        ),
        leading: Radio<String>(
            value: value,
            groupValue: _selectedOption,
            onChanged: (newValue) {
              setState(() {
                _selectedOption = newValue;
              });
            }),
        onTap: () {
          setState(() {
            _selectedOption = value;
          });
        });
  }
}