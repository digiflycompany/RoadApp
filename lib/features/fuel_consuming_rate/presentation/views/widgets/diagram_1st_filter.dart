import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/diagram_2nd_filter.dart';

class Diagram1stFilter extends StatelessWidget {
  const Diagram1stFilter({super.key});

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
                String? selectedOption; // Removed the underscore

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
                            _buildRadioTile(StringManager.month.tr(context),
                                setState, selectedOption),
                            _buildRadioTile(
                                '3 ${StringManager.months.tr(context)}',
                                setState,
                                selectedOption),
                            _buildRadioTile(
                                '6 ${StringManager.months.tr(context)}',
                                setState,
                                selectedOption),
                            _buildRadioTile(
                                '9 ${StringManager.months.tr(context)}',
                                setState,
                                selectedOption),
                            _buildRadioTile(StringManager.oneYear.tr(context),
                                setState, selectedOption)
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

  Widget _buildRadioTile(
      String value, StateSetter setState, String? selectedOption) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(value,
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600)),
        leading: Radio<String>(
            value: value,
            groupValue: selectedOption,
            onChanged: (newValue) {
              setState(() {
                selectedOption =
                    newValue; // This won't affect the original selectedOption
              });
            }),
        onTap: () {
          setState(() {
            selectedOption =
                value; // This won't affect the original selectedOption
          });
        });
  }
}
