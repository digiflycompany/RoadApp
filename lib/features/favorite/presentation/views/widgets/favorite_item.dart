import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/favorite/data/models/fav_response.dart';
import 'package:roadapp/features/favorite/presentation/cubit/fav_cubit.dart';
import 'package:roadapp/features/favorite/presentation/cubit/fav_state.dart';
import 'package:roadapp/features/favorite/presentation/views/widgets/favourite_handling_image.dart';

class FavoriteItem extends StatefulWidget {
   const FavoriteItem({super.key, required this.ad});
  final FavoriteAd ad;

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  bool fav = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: 120.h,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
          child: FavouriteHandlingImage(image: widget.ad.images![0])),
      BlocBuilder<FavCubit, FavState>(builder: (context, state) {
        var cubit = FavCubit.get(context);
        return InkWell(
            onTap: () {
              fav? cubit.unFav(widget.ad.id!): cubit.addToFav(widget.ad.id!);
              setState(() {
                fav = !fav;
              });
            },
            child: Container(
                margin: EdgeInsets.all(6.r),
                width: 35.w,
                height: 37.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.primaryColor),
                child: Center(
                    child:
                        Icon(Icons.favorite, color: fav? Colors.red: AppColors.whiteColor, size: 20.r))));
      })
    ]);
  }
}
