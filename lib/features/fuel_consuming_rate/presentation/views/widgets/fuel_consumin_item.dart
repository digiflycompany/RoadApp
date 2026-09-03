import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/fuel_rates_response.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/cubit.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/states.dart';

class FuelConsumingItem extends StatelessWidget {
  const FuelConsumingItem({
    super.key,
    required this.rate,
  });

  final Ride rate;

  void _showDeleteConfirmationDialog(BuildContext context, FuelConsumingRateCubit cubit) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: AppColors.whiteColor2,
        title: Row(
          children: [
            Icon(CupertinoIcons.exclamationmark_triangle_fill,
                color: Colors.redAccent, size: 24.sp),
            Gap(8.w),
            Text(
              StringManager.delete.tr(context),
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          StringManager.areYouSure.tr(context),
          style: Styles.textStyle14,
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide()),
            ),
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(StringManager.cancel.tr(context),
                style: Styles.textStyle12.copyWith(color: AppColors.black)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              cubit.deleteSingleRide(rate.id!);
            },
            child: Text(
              StringManager.delete.tr(context),
              style: Styles.textStyle12.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FuelConsumingRateCubit, FuelConsumingRateStates>(
        listener: (_, state) {},
        builder: (_, state) {final FuelConsumingRateCubit cubit = FuelConsumingRateCubit.get(context);
          return Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteColor2,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all()),
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      SvgPicture.asset(AppAssets.fuelCounter,
                          height: 17, width: 17),
                      const SizedBox(width: 5),
                      Text(
                          '${StringManager.fuelMeterBeforeAddingFuel.tr(context)}: ${rate.odometerBefore} ${StringManager.km.tr(context)}',
                          style: const TextStyle(fontSize: 8)),
                      const Gap(12),
                      SvgPicture.asset(AppAssets.kmBoard,
                          height: 17, width: 17),
                      const SizedBox(width: 5),
                      Text(
                          '${StringManager.kms.tr(context)}: ${rate.kmCount} ${StringManager.km.tr(context)}',
                          style: const TextStyle(fontSize: 8))
                    ])),
                divider(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      SvgPicture.asset(AppAssets.kmBoard,
                          height: 17, width: 17),
                      const SizedBox(width: 5),
                      Text(
                          '${StringManager.kmGm.tr(context)}: ${rate.kmPerEGP} ${StringManager.kmGmII.tr(context)}',
                          style: const TextStyle(fontSize: 8)),
                      const Gap(12),
                      SvgPicture.asset(AppAssets.kmBoard,
                          height: 17, width: 17),
                      const SizedBox(width: 5),
                      Text(
                          '${StringManager.kmLiter.tr(context)}: ${rate.kmPerLiter} ${StringManager.kmLiterII.tr(context)}',
                          style: const TextStyle(fontSize: 8))
                    ])),
                divider(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      SvgPicture.asset(AppAssets.fuelGun,
                          height: 17, width: 17),
                      const SizedBox(width: 5),
                      Expanded(
                          child: Text(
                              '${StringManager.liters.tr(context)}: ${rate.literCount} ${StringManager.l.tr(context)}',
                              style: const TextStyle(fontSize: 8),
                              overflow: TextOverflow.ellipsis)),
                      const Gap(12),
                      SvgPicture.asset(AppAssets.moneyIcon,
                          height: 17, width: 17),
                      const SizedBox(width: 5),
                      Text(
                          '${StringManager.literPrice.tr(context)}: ${rate.literPrice} ${StringManager.le.tr(context)}',
                          style: const TextStyle(fontSize: 8)),
                      const Gap(12),
                      SvgPicture.asset(AppAssets.moneyIcon,
                          height: 17, width: 17),
                      const SizedBox(width: 5),
                      Text(
                          "${StringManager.fullTankPrice.tr(context)}: ${rate.fullTankPrice} ${StringManager.le.tr(context)}",
                          style: const TextStyle(fontSize: 8))
                    ])),
                Gap(12.h),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CustomElevatedButton(
                      onTap: () => _showDeleteConfirmationDialog(context, cubit),
                      widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(CupertinoIcons.delete, size: 14.sp),
                            Text(StringManager.delete.tr(context),
                                style: Styles.textStyle12)
                          ]),
                      color: Colors.redAccent.withValues(alpha: .25)),
                  Gap(10.w)
                ]),
                Gap(10.h)
              ]));
        });
  }
}
