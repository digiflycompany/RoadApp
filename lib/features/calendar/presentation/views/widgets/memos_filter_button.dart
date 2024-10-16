import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/filter_option.dart';
import 'package:roadapp/features/calendar/presentation/cubit/cubit.dart';
import 'package:roadapp/features/calendar/presentation/cubit/states.dart';

class MemosFilterButton extends StatelessWidget {
  const MemosFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showCustomAlertDialog(
              context: context,
              title: StringManager.filterBy.tr(context),
              content: BlocBuilder<CalendarCubit, CalendarState>(
                  builder: (context, state) {
                var cubit = CalendarCubit.get(context);
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    FilterOption(
                        text: StringManager.date.tr(context),
                        value: cubit.checkBoxDate,
                        onChanged: (value) =>
                            cubit.changeCheckBox(value!, 'date')),
                    FilterOption(
                        text: StringManager.importanceDegree.tr(context),
                        value: cubit.importanceDegree,
                        onChanged: (value) =>
                            cubit.changeCheckBox(value!, 'degree'))
                  ]),
                  FilterOption(
                      text: StringManager.myCarNumber.tr(context),
                      value: cubit.myCarNumber,
                      onChanged: (value) =>
                          cubit.changeCheckBox(value!, 'carNumber')),
                  CustomElevatedButton(
                      onTap: () {
                        Navigator.pop(context);
                        cubit.showCalendarDialog(context);
                      },
                      widget: Text(StringManager.select.tr(context),
                          style: Styles.textStyle12))
                ]);
              }));
        },
        icon: const Icon(EvaIcons.options2Outline),
        constraints: const BoxConstraints());
  }
}