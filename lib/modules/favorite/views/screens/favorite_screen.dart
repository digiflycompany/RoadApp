import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/modules/favorite/views/widgets/favorite_item.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'المفضلة')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FavoriteItem(image: AppAssets.car1),
                SizedBox(
                  height: 20.h,
                ),
                const FavoriteItem(image: AppAssets.car5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
