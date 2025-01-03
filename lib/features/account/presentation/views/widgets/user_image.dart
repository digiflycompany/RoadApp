import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/change_pic_bottom_sheet.dart';

// class UserImage extends StatelessWidget {
//   const UserImage({super.key, this.clickable});
//
//   final bool? clickable;
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = AccountCubit.get(context);
//     return Center(child:
//         BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
//       return InkWell(
//           onLongPress: () => showDialog(
//               context: context,
//               builder: (_) => Center(
//                   child: SizedBox(
//                       height: 200, width: 200, child: cubit.userImage))),
//           onTap: clickable != false
//               ? () => showModalBottomSheet(
//                   context: context,
//                   builder: (BuildContext context) =>
//                        ChangePicBottomSheet(cubit: cubit,))
//
//               : null,
//           child: cubit.userImage);
//     }));
//   }
// }
