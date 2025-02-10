import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
import 'package:roadapp/features/home/presentation/cubit/home_states.dart';
import 'package:roadapp/features/home/presentation/views/widgets/home_welcome.dart';


import '../../../../../core/widgets/custom_cached_network_image.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        final allAds = cubit.allPagesAds.expand((page) => page).toList();

        return Column(
          children: [
            const HomeWelcome(),

            MultiSelectChip(
              options: {
                '${StringManager.sparePartes.tr(context)}': 'Spare_Parts',
                '${StringManager.maintenanceCenter.tr(context)}': 'Maintenance_Center',
                '${StringManager.carAccessories.tr(context)}': 'Car_Accessories',
                '${StringManager.carRental.tr(context)}': 'Car_Rental',
                '${StringManager.autoServices.tr(context)}': 'Auto_Services',
              },
              selectedValues: cubit.type,
              onSelectionChanged: (selected) {
                cubit.type = selected;
              },
            ),

            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !cubit.isLoadingMore) {
                    cubit.fetchAds(page: cubit.currentPage + 1);
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount: allAds.length + (cubit.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < allAds.length) {
                      final ad = allAds[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: handlingImage(ad.images![0], ad.id!, context),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final Map<String, String> options;
  final List<String> selectedValues;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectChip({
    required this.options,
    required this.selectedValues,
    required this.onSelectionChanged,
    super.key,
  });

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = [];

  @override
  void initState() {
    super.initState();
    selectedChoices = List.from(widget.selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.options.keys.map((displayText) {
        final realValue = widget.options[displayText]!;
        final isSelected = selectedChoices.contains(realValue);

        return ChoiceChip(
          label: Text(displayText,style: TextStyle(fontSize: 12),),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                selectedChoices.add(realValue);
              } else {
                selectedChoices.remove(realValue);
              }
              widget.onSelectionChanged(selectedChoices);
              HomeCubit.get(context).fetchAds(page: 1); // تحميل الإعلانات تلقائيًا
            });
          },
        );
      }).toList(),
    );
  }
}

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
      HomeCubit.get(context).isVendor != 'CLIENT'
          ? Container(
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
          : const SizedBox(),
    ],
  );
}



// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   ScrollController scrollController = ScrollController();
//   PageController pageController = PageController();
//
//
//   @override
//   void dispose() {
//     scrollController.dispose();
//     pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit(getIt.get<HomeRepo>())
//         ..getUserCountry()
//         ..fetchAds(),
//       child: BlocConsumer<HomeCubit, HomeState>(
//         listener: (context, state) {
//           if(state is FetchingAdsLoadingState){
//              const Padding(
//                padding: EdgeInsets.all(8.0),
//                child: CustomLoadingIndicator(),
//              );
//           }
//         },
//         builder: (context, state) {
//       var cubit = HomeCubit.get(context);
//       final allPagesAds = cubit.allPagesAds;
//         return Column(
//           children: [
//             const HomeWelcome(),
//
//             Expanded(
//               child: PageView.builder(
//                 controller: pageController,
//                 itemCount: allPagesAds.length,
//                 itemBuilder: (context, pageIndex) {
//                   final adsForPage = allPagesAds[pageIndex];
//                   return ListView.builder(
//                     itemCount: adsForPage.length,
//                     itemBuilder: (context, index) {
//                       final ad = adsForPage[index];
//                       return allPagesAds != [] ? Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: handlingImage(ad.images![0], ad.id!, context),
//                       ) : const Center(child: Text('No Ads Available'),);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//
//         },
//       ),
//     );
//   }
// }
//


//
//
// Widget handlingImage(String image, String id, context) {
//   return Stack(
//     children: [
//
//       ClipRRect(
//         borderRadius: BorderRadius.circular(10.r),
//         child: CustomCachedNetworkImage(
//           url: image,
//           width: double.infinity,
//           fit: BoxFit.fill,
//         ),
//       ),
//       HomeCubit.get(context).isVendor != 'CLIENT'
//           ? Container(
//               width: 30.w,
//               height: 30.h,
//               margin: const EdgeInsets.all(4),
//               decoration: ShapeDecoration(
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(width: 1, color: Color(0xFFE9E9E9)),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 shadows: const [
//                   BoxShadow(
//                     color: Color(0x14000000),
//                     blurRadius: 2,
//                     offset: Offset(0, 0),
//                     spreadRadius: 0,
//                   ),
//                 ],
//               ),
//               child: BlocBuilder<HomeCubit, HomeState>(
//                 builder: (context, state) {
//                   var cubit = HomeCubit.get(context);
//                   bool isLoading = cubit.currentLoadingAdId == id;
//                   return GestureDetector(
//                     onTap: () {
//                       if (!isLoading) {
//                         cubit.addToFav(id: id);
//                       }
//                     },
//                     child: isLoading
//                         ? state is AddToFavSuccessState && state.id == id
//                             ? Icon(Icons.favorite,
//                                 size: 20.sp, color: Colors.red)
//                             : const CircularProgressIndicator()
//                         : Icon(Icons.favorite_border, size: 20.sp),
//                   );
//                 },
//               ),
//             )
//           : const SizedBox(),
//     ],
//   );
// }
