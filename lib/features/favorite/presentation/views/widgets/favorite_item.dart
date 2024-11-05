import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/favorite/presentation/views/widgets/favourite_handling_image.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: 120.h,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
          child: FavouriteHandlingImage(image: image)),
      Container(
          margin: EdgeInsets.all(6.r),
          width: 35.w,
          height: 37.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.primaryColor),
          child: Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.red, size: 20.r),
                  constraints: const BoxConstraints())))
    ]);
  }
}