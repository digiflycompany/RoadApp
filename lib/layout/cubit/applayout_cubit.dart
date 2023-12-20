import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp2/layout/cubit/app_layout_states.dart';
import 'package:roadapp2/modules/home/views/screens/home_screen.dart';
import 'package:roadapp2/modules/messages/messages_screen.dart';
import 'package:roadapp2/modules/profile/view/screens/profile_screen.dart';

import '../../modules/search/views/screens/search_screen.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutInitState());

  static AppLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> appbarTitles = ['الرئيسية', "البحث",  "الرسائل", "الملف الشخصي"];
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    MessagesScreen(),
    const ProfileScreen(),
  ];


  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }
}
