import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class FuelConsumingItem extends StatelessWidget {
  const FuelConsumingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor2,
            borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SvgPicture.asset(AppAssets.fuelCounter, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    '${StringManager.fuelMeterBeforeAddingFuel.tr(context)}: 20 ${StringManager.l.tr(context)}',
                    style: const TextStyle(fontSize: 8)),
                const Gap(12),
                SvgPicture.asset(AppAssets.kmBoard, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    '${StringManager.kms.tr(context)}: 200 ${StringManager.km.tr(context)}',
                    style: const TextStyle(fontSize: 8))
              ])),
          divider(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SvgPicture.asset(AppAssets.kmBoard, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                  '${StringManager.kmGm.tr(context)}: 150 ${StringManager.kmGmII.tr(context)}',
                  style: const TextStyle(fontSize: 8),
                ),
                const Gap(12),
                SvgPicture.asset(
                  AppAssets.kmBoard,
                  height: 17,
                  width: 17,
                ),
                const SizedBox(width: 5),
                Text(
                    '${StringManager.kmLiter.tr(context)}: 15 ${StringManager.kmLiterII.tr(context)}',
                    style: const TextStyle(fontSize: 8))
              ])),
          divider(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SvgPicture.asset(AppAssets.fuelGun, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    '${StringManager.liters.tr(context)}: 20 ${StringManager.l.tr(context)}',
                    style: const TextStyle(fontSize: 8)),
                const Gap(12),
                SvgPicture.asset(AppAssets.moneyIcon, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    '${StringManager.literPrice.tr(context)}: 12.75 ${StringManager.le.tr(context)}',
                    style: const TextStyle(fontSize: 8)),
                const Gap(12),
                SvgPicture.asset(AppAssets.moneyIcon, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    "${StringManager.fullTankPrice.tr(context)}: 560 ${StringManager.le.tr(context)}",
                    style: const TextStyle(fontSize: 8))
              ]))
        ]));
  }
}