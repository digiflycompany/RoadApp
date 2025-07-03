import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_cubit.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_state.dart';

import '../../../data/models/reservation_managment_model.dart';



class VendorReservationManagementsPerson extends StatefulWidget {
  const VendorReservationManagementsPerson({super.key});

  @override
  State<VendorReservationManagementsPerson> createState() =>
      _VendorReservationManagementsPersonState();
}

class _VendorReservationManagementsPersonState
    extends State<VendorReservationManagementsPerson> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    }
  }

  void _loadMoreData() {
    var cubit = context.read<ReservationManagementCubit>();
    cubit.getReservationManagementData(
      'PENDING',
        page: cubit.reservationsPage + 1, more: true);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return BlocConsumer<ReservationManagementCubit,
        ReservationManagementStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ReservationManagementCubit.get(context);
        return Expanded(
          child: Column(
            children: [
              cubit.reservations!.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          DateTime? bookingDate =
                              cubit.reservations![index].bookingTime;
                          //final cubit = ReservationManagementCubit.get(context);
                          return ReservationItemWidget(cubit: cubit, bookingDate: bookingDate,index: index,state: state,);
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                        itemCount: cubit.reservations!.length,
                      ),
                    )
                  : const SizedBox(),
              state is MoreLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}

class ReservationItemWidget extends StatelessWidget {
  const ReservationItemWidget({
    super.key,
    required this.cubit,
    required this.bookingDate,
    required this.index,
    required this.state,
  });

  final ReservationManagementCubit cubit;
  final DateTime? bookingDate;
  final int index;
  final ReservationManagementStates state;

  @override
  Widget build(BuildContext context) {
    var reservation = cubit.reservations![index];
    bool isLoadingApprove = cubit.loadingApproveMap[reservation.id] ?? false; // ⬅️ جلب حالة اللود للعنصر الحالي
    bool isLoadingDeclineMap = cubit.loadingDeclineMap[reservation.id] ?? false; // ⬅️ جلب حالة اللود للعنصر الحالي
    bool isLoadingUpdateMap = cubit.loadingUpdateMap[reservation.id] ?? false; // ⬅️ جلب حالة اللود للعنصر الحالي

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: const [
          BoxShadow(color: Color(0xFFD7D7D7), blurRadius: 10, offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          buildBookingDetails(reservation, context),
          buildServiceAndProductDetails(reservation, context),
          buildActionButtons(context, reservation, isLoadingApprove,isLoadingDeclineMap,isLoadingUpdateMap), // ⬅️ تمرير isLoading هنا
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget buildActionButtons(
      BuildContext context,
      Booking reservation,
      bool isLoadingApprove,
      bool isLoadingDeclineMap,
      bool isLoadingUpdateMap,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: reservation.status == 'PENDING' ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isLoadingDeclineMap
              ? const CircularProgressIndicator() // ⬅️ عرض اللودنج عند تنفيذ العملية
              : IconButton(
            onPressed: () => cubit.declineBooking(id: reservation.id!),
            icon: SvgPicture.asset(AppAssets.closeIcon, height: 30),
          ),
          if (reservation.status != "APPROVED")
            isLoadingUpdateMap
                ? const CircularProgressIndicator()
                : GestureDetector(
              onTap: () => cubit.pickupDate(context, reservation.id!),
              child: SvgPicture.asset(AppAssets.scheduleIcon, height: 30),
            ),
          isLoadingApprove
              ? const CircularProgressIndicator()
              : IconButton(
            onPressed: () => cubit.approveBooking(id: reservation.id!),
            icon: SvgPicture.asset(AppAssets.checkIcon, height: 30),
          ),
        ],
      ) : const SizedBox(),
    );
  }

  Widget buildBookingDetails(Booking reservation, BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.27),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          const SizedBox(height: 6),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${StringManager.name.tr(context)}: ${reservation.clientId!.fullName}  ",
                  style: Styles.textStyle12.copyWith(fontSize: 9),
                ),
                Text(
                  "${StringManager.car.tr(context)}: ${reservation.vehicleId!.brandId!.name}  ",
                  style: Styles.textStyle12.copyWith(fontSize: 9),
                ),
                Text(
                  "${StringManager.phoneNumber.tr(context)}: ${reservation.clientId!.phoneNumber} ",
                  style: Styles.textStyle12.copyWith(fontSize: 9),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              Text(
                "${StringManager.date.tr(context)}:${bookingDate!.year}-${bookingDate!.month}-${bookingDate!.day}",
                style: Styles.textStyle12.copyWith(fontSize: 9),
              ),
              SizedBox(width: 30.w),
              Text(
                "${StringManager.time.tr(context)}: ${bookingDate!.hour}:${bookingDate!.minute}",
                style: Styles.textStyle12.copyWith(fontSize: 9),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildServiceAndProductDetails(Booking reservation, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (reservation.services?.isNotEmpty ?? false)
                buildDropdownOrText(
                  context,
                  StringManager.serviceType.tr(context),
                  reservation.services!.map((e) => e.name!).toList(),
                ),
              if (reservation.products?.isNotEmpty ?? false)
                buildDropdownOrText(
                  context,
                  StringManager.productType.tr(context),
                  reservation.products!.map((e) => e.productId!.name!).toList(),
                ),
            ],
          ),
          Text(
            "${StringManager.price.tr(context)}: ${reservation.price!.finalPrice}",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ) ;
  }

  Widget buildDropdownOrText(BuildContext context, String label, List<String> items) {
    return items.length > 1
        ? Row(
      children: [
        Text("$label :   ", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600)),
        DropdownButton<String>(
          hint: Text(items.first),
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600)))).toList(),
          onChanged: (value) {},
        ),
      ],
    )
        : Text("$label: ${items.first}", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600));
  }
}

//class VendorReservationManagementsPerson extends StatefulWidget {
//   const VendorReservationManagementsPerson({super.key});
//
//   @override
//   State<VendorReservationManagementsPerson> createState() =>
//       _VendorReservationManagementsPersonState();
// }
//
// class _VendorReservationManagementsPersonState
//     extends State<VendorReservationManagementsPerson> {
//   ScrollController scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(_scrollListener);
//   }
//
//   void _scrollListener() {
//     if (scrollController.position.atEdge) {
//       if (scrollController.position.pixels ==
//           scrollController.position.maxScrollExtent) {
//         _loadMoreData();
//       }
//     }
//   }
//
//   void _loadMoreData() {
//     var cubit = context.read<ReservationManagementCubit>();
//     cubit.getReservationManagementData(
//         page: cubit.reservationsPage + 1, more: true);
//   }
//
//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.sizeOf(context).height;
//     return BlocConsumer<ReservationManagementCubit,
//         ReservationManagementStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var cubit = ReservationManagementCubit.get(context);
//         return (state is ReservationManagementSuccessStates &&
//                 state.reservations != null &&
//                 state.reservations!.isNotEmpty)
//             ? Expanded(
//                 child: ListView.separated(
//                     controller: scrollController,
//                     itemBuilder: (context, index) {
//                       DateTime? bookingDate =
//                           state.reservations![index].bookingTime;
//                       final cubit = ReservationManagementCubit.get(context);
//                       return Container(
//                           decoration: BoxDecoration(
//                               color: const Color(0xFFFFFFFF),
//                               boxShadow: const [
//                                 BoxShadow(
//                                     color: Color(0xFFD7D7D7),
//                                     blurRadius: 10,
//                                     offset: Offset(0, 2))
//                               ],
//                               borderRadius: BorderRadius.circular(4)),
//                           padding: const EdgeInsets.all(5),
//                           child: Column(children: [
//                             Container(
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: AppColors.primaryColor
//                                         .withOpacity(0.27),
//                                     borderRadius: BorderRadius.circular(4)),
//                                 padding: EdgeInsets.symmetric(horizontal: 15.w),
//                                 child: Column(children: [
//                                   const SizedBox(height: 6),
//                                   FittedBox(
//                                     child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                               "${StringManager.name.tr(context)}: ${state.reservations![index].clientId!.fullName}  ",
//                                               style: Styles.textStyle12
//                                                   .copyWith(fontSize: 9)),
//                                           Text(
//                                               "${StringManager.car.tr(context)}: ${state.reservations![index].vehicleId!.brandId!.name}  ",
//                                               style: Styles.textStyle12
//                                                   .copyWith(fontSize: 9)),
//                                           Text(
//                                               "${StringManager.phoneNumber.tr(context)}:  ${state.reservations![index].clientId!.phoneNumber} ",
//                                               style: Styles.textStyle12
//                                                   .copyWith(fontSize: 9))
//                                         ]),
//                                   ),
//                                   Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         const Spacer(),
//                                         Text(
//                                             "${StringManager.date.tr(context)}:${bookingDate!.year}-${bookingDate.month}-${bookingDate.day}",
//                                             style: Styles.textStyle12
//                                                 .copyWith(fontSize: 9)),
//                                         SizedBox(width: 30.w),
//                                         Text(
//                                             "${StringManager.time.tr(context)}: ${bookingDate.hour}:${bookingDate.minute}",
//                                             style: Styles.textStyle12
//                                                 .copyWith(fontSize: 9)),
//                                         const Spacer()
//                                       ])
//                                 ])),
//                             Container(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           if (state.reservations![index]
//                                               .services!.isNotEmpty)
//                                             Column(
//                                               children: [
//                                                 if (state.reservations![index]
//                                                         .services!.length >
//                                                     1)
//                                                   Row(
//                                                     children: [
//                                                       Text(
//                                                           "${StringManager.serviceType.tr(context)} :   ",
//                                                           style: TextStyle(
//                                                               fontSize: 12.sp,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600)),
//                                                       DropdownButton<String>(
//                                                         hint: Text(state
//                                                             .reservations![
//                                                                 index]
//                                                             .services![0]
//                                                             .name!),
//                                                         items: state
//                                                             .reservations![
//                                                                 index]
//                                                             .services!
//                                                             .map((service) {
//                                                           return DropdownMenuItem<
//                                                               String>(
//                                                             value: service.name,
//                                                             child: Text(
//                                                               service.name!,
//                                                               style: TextStyle(
//                                                                   fontSize:
//                                                                       12.sp,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600),
//                                                             ),
//                                                           );
//                                                         }).toList(),
//                                                         onChanged:
//                                                             (selectedService) {},
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 if (state.reservations![index]
//                                                         .services!.length ==
//                                                     1)
//                                                   Column(
//                                                     children: [
//                                                       Text(
//                                                           "${StringManager.serviceType.tr(context)}: ${state.reservations![index].services![0].name}",
//                                                           style: TextStyle(
//                                                               fontSize: 12.sp,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600)),
//                                                       SizedBox(height: 20.h),
//                                                     ],
//                                                   ),
//                                                 SizedBox(height: 20.h),
//                                               ],
//                                             ),
//                                           if (state.reservations![index]
//                                               .products!.isNotEmpty)
//                                             Column(
//                                               children: [
//                                                 if (state.reservations![index]
//                                                         .products!.length >
//                                                     1)
//                                                   Row(
//                                                     children: [
//                                                       Text(
//                                                           "${StringManager.productType.tr(context)} :   ",
//                                                           style: TextStyle(
//                                                               fontSize: 12.sp,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600)),
//                                                       DropdownButton<String>(
//                                                         hint: Text(state
//                                                             .reservations![
//                                                                 index]
//                                                             .products![0]
//                                                             .productId!
//                                                             .name!),
//                                                         items: state
//                                                             .reservations![
//                                                                 index]
//                                                             .products!
//                                                             .map((product) {
//                                                           return DropdownMenuItem<
//                                                               String>(
//                                                             value: product
//                                                                 .productId!
//                                                                 .name!,
//                                                             child: Text(
//                                                               product.productId!
//                                                                   .name!,
//                                                               style: TextStyle(
//                                                                   fontSize:
//                                                                       12.sp,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600),
//                                                             ),
//                                                           );
//                                                         }).toList(),
//                                                         onChanged:
//                                                             (selectedProduct) {},
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 if (state.reservations![index]
//                                                         .products!.length ==
//                                                     1)
//                                                   Text(
//                                                       "${StringManager.product.tr(context)}: ${state.reservations![index].products![0].productId!.name}",
//                                                       style: TextStyle(
//                                                           fontSize: 12.sp,
//                                                           fontWeight:
//                                                               FontWeight.w600)),
//                                               ],
//                                             ),
//                                         ]),
//                                     Text(
//                                         "${StringManager.price.tr(context)}: ${state.reservations![index].price!.finalPrice}",
//                                         style: TextStyle(
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w600)),
//                                   ]),
//                             ),
//                             Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 25),
//                                 child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       IconButton(
//                                         onPressed: () {
//                                           cubit.declineBooking(
//                                               id: state
//                                                   .reservations![index].id!);
//                                         },
//                                         icon: SvgPicture.asset(
//                                             AppAssets.closeIcon,
//                                             height: 30),
//                                       ),
//                                       state.reservations![index].status !=
//                                           "APPROVED" ? GestureDetector(
//                                           onTap: () {
//
//                                             cubit.pickupDate(context);
//                                             // calendarCustomAlertDialog(
//                                             //     context: context,
//                                             //     title: StringManager.dateSelection.tr(context),
//                                             //     content: const CalendarDialogContent());
//                                           },
//                                           child: SvgPicture.asset(AppAssets.scheduleIcon,
//                                               height: 30)) : const SizedBox(),
//                                       if (state.reservations![index].status !=
//                                           "APPROVED")
//                                         IconButton(
//                                             onPressed: () {
//                                               cubit.approveBooking(
//                                                   id: state.reservations![index]
//                                                       .id!);
//                                               print(
//                                                   "APPROVE BOOKING ${state.reservations![index].id!}");
//                                             },
//                                             icon: SvgPicture.asset(
//                                                 AppAssets.checkIcon,
//                                                 height: 30)),
//                                     ])),
//                             const SizedBox(height: 15)
//                           ]));
//                     },
//                     separatorBuilder: (context, index) =>
//                         SizedBox(height: 10.h),
//                     itemCount: state.reservations!.length),
//               )
//             : (state is ReservationManagementSuccessStates &&
//                     (state.reservations == null || state.reservations!.isEmpty))
//                 ? Center(
//                     child: Text(
//                         StringManager.youHaveNoReservationsYet.tr(context)))
//                 : state is ReservationManagementErrorStates
//                     ? Center(
//                         child: Text(state.error, style: Styles.textStyle16))
//                     : state is ReservationManagementLoadingStates
//                         ? CustomLoadingIndicator(height: height * .65)
//                         : Expanded(
//                             child: Column(
//                             children: [
//                               Expanded(
//                                 child: ListView.separated(
//                                     controller: scrollController,
//                                     itemBuilder: (context, index) {
//                                       DateTime? bookingDate = cubit
//                                           .reservations![index].bookingTime;
//                                       return Container(
//                                           decoration: BoxDecoration(
//                                               color: const Color(0xFFFFFFFF),
//                                               boxShadow: const [
//                                                 BoxShadow(
//                                                     color: Color(0xFFD7D7D7),
//                                                     blurRadius: 10,
//                                                     offset: Offset(0, 2))
//                                               ],
//                                               borderRadius:
//                                                   BorderRadius.circular(4)),
//                                           padding: const EdgeInsets.all(5),
//                                           child: Column(children: [
//                                             Container(
//                                                 width: double.infinity,
//                                                 decoration: BoxDecoration(
//                                                     color: AppColors
//                                                         .primaryColor
//                                                         .withOpacity(0.27),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             4)),
//                                                 padding: EdgeInsets.symmetric(
//                                                     horizontal: 15.w),
//                                                 child: Column(children: [
//                                                   const SizedBox(height: 6),
//                                                   Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text(
//                                                             "${StringManager.name.tr(context)}: ${cubit.reservations![index].clientId!.fullName}",
//                                                             style: Styles
//                                                                 .textStyle12
//                                                                 .copyWith(
//                                                                     fontSize:
//                                                                         9)),
//                                                         Text(
//                                                             "${StringManager.car.tr(context)}: ${cubit.reservations![index].vehicleId!.brandId!.name}",
//                                                             style: Styles
//                                                                 .textStyle12
//                                                                 .copyWith(
//                                                                     fontSize:
//                                                                         9)),
//                                                         Text(
//                                                             "${StringManager.phoneNumber.tr(context)}:  ${cubit.reservations![index].clientId!.phoneNumber}",
//                                                             style: Styles
//                                                                 .textStyle12
//                                                                 .copyWith(
//                                                                     fontSize:
//                                                                         9))
//                                                       ]),
//                                                   Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceEvenly,
//                                                       children: [
//                                                         const Spacer(),
//                                                         Text(
//                                                             "${StringManager.date.tr(context)}:${bookingDate!.year}-${bookingDate.month}-${bookingDate.day}",
//                                                             style: Styles
//                                                                 .textStyle12
//                                                                 .copyWith(
//                                                                     fontSize:
//                                                                         9)),
//                                                         SizedBox(width: 30.w),
//                                                         Text(
//                                                             "${StringManager.time.tr(context)}: ${bookingDate.hour}:${bookingDate.minute}",
//                                                             style: Styles
//                                                                 .textStyle12
//                                                                 .copyWith(
//                                                                     fontSize:
//                                                                         9)),
//                                                         const Spacer()
//                                                       ])
//                                                 ])),
//                                             Container(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       vertical: 10),
//                                               child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceAround,
//                                                   children: [
//                                                     Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           if (cubit
//                                                               .reservations![
//                                                                   index]
//                                                               .services!
//                                                               .isNotEmpty)
//                                                             Column(
//                                                               children: [
//                                                                 Text(
//                                                                     "${StringManager.serviceType.tr(context)}: ${cubit.reservations![index].services![0].name}",
//                                                                     style: TextStyle(
//                                                                         fontSize: 12
//                                                                             .sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w600)),
//                                                                 const SizedBox(
//                                                                     height: 20),
//                                                               ],
//                                                             ),
//                                                           if (cubit
//                                                               .reservations![
//                                                                   index]
//                                                               .products!
//                                                               .isNotEmpty)
//                                                             Text(
//                                                                 "${StringManager.productType.tr(context)}: ${cubit.reservations![index].products![0].productId!.name}",
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         12.sp,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600))
//                                                         ]),
//                                                     Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           if (cubit
//                                                               .reservations![
//                                                                   index]
//                                                               .services!
//                                                               .isNotEmpty)
//                                                             Column(
//                                                               children: [
//                                                                 Text(
//                                                                     "${StringManager.price.tr(context)}: ${cubit.reservations![index].price!.finalPrice}",
//                                                                     style: TextStyle(
//                                                                         fontSize: 12
//                                                                             .sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w600)),
//                                                                 const SizedBox(
//                                                                     height: 20),
//                                                               ],
//                                                             ),
//                                                           if (cubit
//                                                               .reservations![
//                                                                   index]
//                                                               .products!
//                                                               .isNotEmpty)
//                                                             Text(
//                                                                 "${StringManager.price.tr(context)}: ${cubit.reservations![index].price!.finalPrice}",
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         12.sp,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600)),
//                                                         ])
//                                                   ]),
//                                             ),
//                                             Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         horizontal: 25),
//                                                 child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceBetween,
//                                                     children: [
//                                                       IconButton(
//                                                         onPressed: () {
//                                                           cubit.declineBooking(
//                                                               id: cubit
//                                                                   .reservations![
//                                                                       index]
//                                                                   .id!);
//                                                         },
//                                                         icon: SvgPicture.asset(
//                                                             AppAssets.closeIcon,
//                                                             height: 30),
//                                                       ),
//                                                       GestureDetector(
//                                                           onTap: () {
//                                                             calendarCustomAlertDialog(
//                                                                 context: context,
//                                                                 title: StringManager.dateSelection.tr(context),
//                                                                 content: const CalendarDialogContent());
//                                                           },
//                                                           child: SvgPicture.asset(AppAssets.scheduleIcon,
//                                                               height: 30)),
//                                                       if (cubit
//                                                               .reservations![
//                                                                   index]
//                                                               .status !=
//                                                           "APPROVED")
//                                                         IconButton(
//                                                             onPressed: () {
//                                                               cubit.approveBooking(
//                                                                   id: cubit
//                                                                       .reservations![
//                                                                           index]
//                                                                       .id!);
//                                                               print(
//                                                                   "APPROVE BOOKING ${cubit.reservations![index].id!}");
//                                                             },
//                                                             icon: SvgPicture.asset(
//                                                                 AppAssets
//                                                                     .checkIcon,
//                                                                 height: 30)),
//                                                     ])),
//                                             const SizedBox(height: 15)
//                                           ]));
//                                     },
//                                     separatorBuilder: (context, index) =>
//                                         SizedBox(height: 10.h),
//                                     itemCount: cubit.reservations!.length),
//                               ),
//                               SizedBox(height: 50.h),
//                               if (state is MoreLoadingState)
//                                 CustomLoadingIndicator(height: 40.h),
//                             ],
//                           ));
//       },
//     );
//   }
// }
