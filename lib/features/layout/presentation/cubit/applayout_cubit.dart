import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/home/presentation/views/screens/home_screen.dart';
import 'package:roadapp/features/layout/data/repos/deactivate_acc_repo.dart';
import 'package:roadapp/features/layout/presentation/cubit/app_layout_states.dart';
import 'package:roadapp/features/messages/presentation/views/screens/messages_screen.dart';
import 'package:roadapp/features/profile/view/screens/profile_screen.dart';
import 'package:roadapp/features/search/presentation/views/screens/search_screen.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit(this._deactivateAccRepo) : super(AppLayoutInitState());
  final DeactivateAccRepo _deactivateAccRepo;
  static AppLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const MessagesScreen(),
    const ProfileScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  deactivateAcc() async {
    emit(DeactivateAccountLoadingState());

    final response = await _deactivateAccRepo.deactivateAcc();
    response.when(success: (deactivateAccRes) {
      emit(DeactivateAccountSuccessState());
    }, failure: (error) {
      emit(DeactivateAccountErrorState(error.toString()));
    });
  }
}
