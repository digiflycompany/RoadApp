import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/favorite/views/widgets/favorite_item.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import '../../../../shared/widgets/custom_appbar.dart';

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
                const FavoriteItem(image: AppImages.car1),
                SizedBox(
                  height: 20.h,
                ),
                const FavoriteItem(image: AppImages.car5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
