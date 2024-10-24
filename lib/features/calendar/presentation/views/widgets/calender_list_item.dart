import 'package:flutter/material.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class CalenderListItem extends StatelessWidget {
  const CalenderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.whiteColor2,
            borderRadius: BorderRadius.circular(8)),
        width: width >= 500 ? width * .8 : width * .65,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Wrap(spacing: 10, children: [
            Row(children: [
              Text(StringManager.importance.tr(context),
                  style: Styles.textStyle12
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 9)),
              Text(': 3',
                  style: Styles.textStyle12
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 9))
            ]),
            Row(children: [
              Text(StringManager.reminderTimes.tr(context),
                  style: Styles.textStyle12
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 9)),
              Text(': 3',
                  style: Styles.textStyle12
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 9))
            ]),
            Row(children: [
              Text(StringManager.classification.tr(context),
                  style: Styles.textStyle12
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 9)),
              Text(': كورولا 15',
                  style: Styles.textStyle12
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 9))
            ]),
            Row(children: [
              Text(StringManager.memoTopic.tr(context),
                  style: Styles.textStyle12
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 9)),
              Text(': انتهاء رخصة القيادة',
                  style: Styles.textStyle12
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 9))
            ])
          ])),
          const Icon(Icons.more_vert, size: 15, color: AppColors.greyColor)
        ]));
  }
}