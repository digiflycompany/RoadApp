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
            bool isFavorite = cubit.favoriteAds.contains(id);

            return GestureDetector(
              onTap: () {
                if (!isLoading) {
                  cubit.addToFav(id: id);
                }
              },
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
              ),
            );
          },
        ),
      )

    ],
  );
}
