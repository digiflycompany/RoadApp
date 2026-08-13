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
