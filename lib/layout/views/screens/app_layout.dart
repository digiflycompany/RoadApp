import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/layout/cubit/app_layout_states.dart';
import 'package:roadapp2/layout/cubit/applayout_cubit.dart';
import 'package:roadapp2/layout/views/screens/drawer.dart';
import 'package:roadapp2/layout/views/widgets/bottom_nav_bar.dart';
import 'package:roadapp2/layout/views/widgets/floating_action_button_component.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit, AppLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppLayoutCubit.get(context);
          return Scaffold(
            extendBodyBehindAppBar: (cubit.currentIndex == 3) ? true : false,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 76.h),
              child: CustomAppBar(text: cubit.appbarTitles[cubit.currentIndex]),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: const FloatingActionButtonComponent(),
            resizeToAvoidBottomInset: false,
            extendBody: true,
            body: cubit.screens[cubit.currentIndex],
            drawer: const NavigatorDrawer(),
            bottomNavigationBar: const BottomNavBarComponent(),
          );
        });
  }
}

