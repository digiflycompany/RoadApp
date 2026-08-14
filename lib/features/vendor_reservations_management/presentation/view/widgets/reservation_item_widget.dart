import 'package:flutter/material.dart';
import 'package:roadapp/core/helpers/functions/extensions.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_cubit.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import '../../../data/models/reservation_managment_model.dart';

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
    bool isLoadingApprove = cubit.loadingApproveMap[reservation.id] ??
        false; // ⬅️ جلب حالة اللود للعنصر الحالي
    bool isLoadingDeclineMap = cubit.loadingDeclineMap[reservation.id] ??
        false; // ⬅️ جلب حالة اللود للعنصر الحالي
    bool isLoadingUpdateMap = cubit.loadingUpdateMap[reservation.id] ??
        false; // ⬅️ جلب حالة اللود للعنصر الحالي
    bool isLoadingCompleted =
        cubit.loadingCompletedMap[reservation.id] ?? false;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: const [
          BoxShadow(
              color: Color(0xFFD7D7D7), blurRadius: 10, offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildBookingDetails(reservation, context),
          buildServiceAndProductDetails(reservation, context),
          buildActionButtons(context, reservation, isLoadingApprove,
              isLoadingDeclineMap, isLoadingUpdateMap, isLoadingCompleted),
          if (!reservation.comment.isNullOrEmpty()) ...[
            Text('${StringManager.notes.tr(context)}:'),
            Text(reservation.comment!, style: Styles.textStyle12)
          ],
          const SizedBox(height: 15)
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
    bool isLoadingCompleted,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: reservation.status == 'PENDING'
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isLoadingDeclineMap
                    ? const CircularProgressIndicator() // ⬅️ عرض اللودنج عند تنفيذ العملية
                    : IconButton(
                        onPressed: () =>
                            cubit.declineBooking(id: reservation.id!),
                        icon: SvgPicture.asset(AppAssets.closeIcon, height: 30),
                      ),
                if (reservation.status != "APPROVED")
                  isLoadingUpdateMap
                      ? const CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () =>
                              cubit.pickupDate(context, reservation.id!),
                          child: SvgPicture.asset(AppAssets.scheduleIcon,
                              height: 30),
                        ),
                isLoadingApprove
                    ? const CircularProgressIndicator()
                    : IconButton(
                        onPressed: () =>
                            cubit.approveBooking(id: reservation.id!),
                        icon: SvgPicture.asset(AppAssets.checkIcon, height: 30),
                      ),
              ],
            )
          : reservation.status == "APPROVED"
              ? isLoadingCompleted
                  ? const CircularProgressIndicator()
                  : Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          onPressed: () =>
                              cubit.completeBooking(id: reservation.id!),
                          icon:
                              SvgPicture.asset(AppAssets.checkIcon, height: 30),
                        )
                      ],
                    )
              : const SizedBox(),
    );
  }

  Widget buildBookingDetails(Booking reservation, BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.27),
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

  Widget buildServiceAndProductDetails(
      Booking reservation, BuildContext context) {
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
    );
  }

  Widget buildDropdownOrText(
      BuildContext context, String label, List<String> items) {
    return items.length > 1
        ? Row(
            children: [
              Text("$label :   ",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600)),
              DropdownButton<String>(
                hint: Text(items.first),
                items: items
                    .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600))))
                    .toList(),
                onChanged: (value) {},
              ),
            ],
          )
        : Text("$label: ${items.first}",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600));
  }
}
