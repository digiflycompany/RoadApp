import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/favorite/views/widgets/favorite_item.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.fav.tr(context))),
        body: Padding(
            padding: EdgeInsets.all(20.r),
            child: SizedBox(
                width: double.infinity,
                child: ListView(children: [
                  const FavoriteItem(image: AppAssets.car1),
                  SizedBox(height: 20.h),
                  const FavoriteItem(image: AppAssets.car5)
                ]))));
  }
}