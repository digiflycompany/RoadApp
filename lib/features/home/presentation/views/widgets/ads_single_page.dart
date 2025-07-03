// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:roadapp/features/home/data/models/ads_response.dart';
// import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
// import 'package:roadapp/features/home/presentation/cubit/home_states.dart';
// import 'package:roadapp/features/home/presentation/views/widgets/collection_of_ads.dart';
//
// class AdsSinglePage extends StatelessWidget {
//   final PageController pageController;
//   final List<AD> ads;
//
//   const AdsSinglePage(
//       {super.key, required this.pageController, required this.ads});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
//       var cubit = HomeCubit.get(context);
//
//       List<Widget> generateAdsPages() {
//         List<Widget> pages = [];
//         int totalAds = ads.length;
//         for (int i = 0; i < totalAds; i += 3) {
//           int endIndex = (i + 3 > totalAds) ? totalAds : i + 3;
//           pages.add(collectionOfAds(context, ads.sublist(i, endIndex)));
//         }
//         return pages;
//       }
//
//       return PageView(
//           onPageChanged: (index) {
//             cubit.verticalIndex = index;
//           },
//           controller: pageController,
//           scrollDirection: Axis.vertical,
//           children: generateAdsPages());
//     });
//   }
// }