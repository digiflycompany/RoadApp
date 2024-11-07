import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/fuel_rates_response.dart';

class FuelConsumingItem extends StatelessWidget {
  const FuelConsumingItem({super.key, required this.rate});

  final Ride rate;

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
                    '${StringManager.fuelMeterBeforeAddingFuel.tr(context)}: ${rate.odometerBefore} ${StringManager.km.tr(context)}',
                    style: const TextStyle(fontSize: 8)),
                const Gap(12),
                SvgPicture.asset(AppAssets.kmBoard, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    '${StringManager.kms.tr(context)}: ${rate.kmCount} ${StringManager.km.tr(context)}',
                    style: const TextStyle(fontSize: 8))
              ])),
          divider(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SvgPicture.asset(AppAssets.kmBoard, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    '${StringManager.kmLE.tr(context)}: ${rate.kmPerEGP} ${StringManager.kmGmII.tr(context)}',
                    style: const TextStyle(fontSize: 8)),
                const Gap(12),
                SvgPicture.asset(AppAssets.kmBoard, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    '${StringManager.kmLiter.tr(context)}: ${rate.kmPerLiter} ${StringManager.kmLiterII.tr(context)}',
                    style: const TextStyle(fontSize: 8))
              ])),
          divider(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SvgPicture.asset(AppAssets.fuelGun, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    '${StringManager.liters.tr(context)}: ${rate.literCount} ${StringManager.l.tr(context)}',
                    style: const TextStyle(fontSize: 8)),
                const Gap(12),
                SvgPicture.asset(AppAssets.moneyIcon, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    '${StringManager.literPrice.tr(context)}: ${rate.literPrice} ${StringManager.le.tr(context)}',
                    style: const TextStyle(fontSize: 8)),
                const Gap(12),
                SvgPicture.asset(AppAssets.moneyIcon, height: 17, width: 17),
                const SizedBox(width: 5),
                Text(
                    "${StringManager.fullTankPrice.tr(context)}: ${rate.fullTankPrice} ${StringManager.le.tr(context)}",
                    style: const TextStyle(fontSize: 8))
              ]))
        ]));
  }
}