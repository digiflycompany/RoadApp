import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/layout/cubit/app_layout_states.dart';
import 'package:roadapp/features/home/views/screens/home_screen.dart';
import 'package:roadapp/features/messages/messages_screen.dart';
import 'package:roadapp/features/profile/view/screens/profile_screen.dart';
import 'package:roadapp/features/search/views/screens/search_screen.dart';

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
