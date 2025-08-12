import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_states.dart';

Widget handlingImage(String image, String id, BuildContext context) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomCachedNetworkImage(
          url: image,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE9E9E9)),
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            bool isLoading = cubit.currentLoadingAdId == id;

            // من القائمة المحلية
            bool isFavorite = cubit.favoriteAds.contains(id);
            // من السيرفر
            bool favAd = cubit.favAds?.any((favAd) => favAd.id == id) ?? false;

            bool isFavOverall = isFavorite || favAd;

            return GestureDetector(
              onTap: () {
                if (isLoading) return; // امنع الضغط أثناء التحميل

                if (isFavOverall) {
                  cubit.removeFromFav(id: id);
                } else {
                  cubit.addToFav(id: id);
                }
              },
              child: isLoading
                  ? const Padding(
                padding: EdgeInsets.all(4),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
                  : Icon(
                isFavOverall ? Icons.favorite : Icons.favorite_border,
                color: isFavOverall ? Colors.red : Colors.black,
              ),
            );
          },
        ),
      )
    ],
  );
}
