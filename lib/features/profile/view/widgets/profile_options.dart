import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/cach_helper/cache_helper.dart';
import 'package:roadapp/core/cach_helper/cache_vars.dart';
import 'package:roadapp/features/profile/view/widgets/vendor_profie_items.dart';
import 'package:roadapp/core/Theming/colors.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
            elevation: 2,
            child: Container(
                padding: EdgeInsets.all(15.r),
                decoration: BoxDecoration(
                    color: AppColors.tertiary,
                    borderRadius: BorderRadius.circular(12.r)),
                child: CacheHelper().getData(CacheVars.isVendor) == true
                    ? const VendorProfileItems()
                    : const VendorProfileItems())));
  }
}