import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/cach_helper/cache_helper.dart';
import 'package:roadapp/core/cach_helper/cache_vars.dart';
import 'package:roadapp/features/layout/presentation/views/widgets/user_drawer.dart';
import 'package:roadapp/features/layout/presentation/views/widgets/vendor_drawer.dart';

class DrawerMenuItemComponent extends StatelessWidget {
  const DrawerMenuItemComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 26.w),
        child: CacheHelper().getData(CacheVars.isVendor) == true
            ? const VendorDrawer()
            : const UserDrawer());
  }
}