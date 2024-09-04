import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
  static AccountCubit get(context) => BlocProvider.of(context);

  Widget userImage = SvgPicture.asset(AppAssets.emptyImageIcon);

  changeUserImage(Widget image) {
    userImage = image;
    emit(ChangeImageSuccessState());
  }
}
