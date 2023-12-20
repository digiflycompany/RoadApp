import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/favorite/views/widgets/favourite_handling_image.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 185.h,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: FavouriteHandlingImage(image: image),
        ),
        Container(
            margin: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.primaryColor,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite, color: Colors.red),
              constraints: const BoxConstraints(),
            ))
      ],
    );
  }
}
