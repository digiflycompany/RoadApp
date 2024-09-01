import 'package:flutter/material.dart';
import 'package:roadapp/features/layout/views/widgets/drawer_header.dart';
import 'package:roadapp/features/layout/views/widgets/drawer_menu_item.dart';

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [DrawerHeaderComponent(), DrawerMenuItemComponent()],
        ),
      ),
    );
  }

}
