import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/vehicles/presentation/widgets/report_format.dart';
import 'package:roadapp/features/vehicles/presentation/widgets/share_option.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> methods = [
      ShareOption(
          icon: AppAssets.whatsappIcon,
          label: StringManager.whatsApp.tr(context)),
      ShareOption(
          icon: AppAssets.gmailIcon, label: StringManager.gmail.tr(context)),
      ShareOption(
          icon: AppAssets.messagesIcon,
          label: StringManager.viaMessages.tr(context)),
      ShareOption(
          icon: AppAssets.downloadIcon,
          label: StringManager.download.tr(context))
    ];
    return SizedBox(
        width: 20.w,
        child: GestureDetector(
            onTap: () {
              showCustomAlertDialog(
                  context: context,
                  title: StringManager.share.tr(context),
                  content: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 10.h),
                    Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 40,
                        runSpacing: 40,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: methods),
                    const ReportFormat(),
                    Flexible(child: BlocBuilder<MaintenanceReportCubit,
                        MaintenanceReportStates>(builder: (context, state) {
                      var cubit = MaintenanceReportCubit.get(context);
                      return CheckboxListTile(
                          title: Text(StringManager.sendWithPrice.tr(context),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[400])),
                          controlAffinity: ListTileControlAffinity.leading,
                          checkColor: Colors.black,
                          fillColor: const WidgetStatePropertyAll(
                              AppColors.whiteColor),
                          contentPadding: EdgeInsets.zero,
                          value: cubit.selectPrice,
                          onChanged: (val) => cubit.togglePrice());
                    })),
                    CustomElevatedButton(
                      height: 20,
                        onTap: () {},
                        widget: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(StringManager.select.tr(context),
                                style: TextStyle(fontSize: 10.sp))))
                  ]));
            },
            child: SvgPicture.asset(AppAssets.shareIcon, width: 20.w)));
  }
}