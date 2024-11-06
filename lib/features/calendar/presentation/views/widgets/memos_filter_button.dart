import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/filter_option.dart';
import 'package:roadapp/features/calendar/data/repos/memos_repo.dart';
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
              content: BlocProvider(
                  create: (context) => CalendarCubit(getIt.get<MemosRepo>())..fetchMemos(),
                  child: BlocConsumer<CalendarCubit, CalendarState>(
                      listener: (context, state) {
                    if (state is MemosFilteredState) Navigator.pop(context);
                  }, builder: (context, state) {
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
                      CustomElevatedButton(
                          onTap: () =>
                            cubit.filterMemos(),
                          widget: Text(StringManager.select.tr(context),
                              style: Styles.textStyle12))
                    ]);
                  })));
        },
        icon: const Icon(EvaIcons.options2Outline),
        constraints: const BoxConstraints());
  }
}