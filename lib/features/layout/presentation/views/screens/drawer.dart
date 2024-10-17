import 'package:flutter/material.dart';
import 'package:roadapp/features/layout/presentation/views/widgets/drawer_header.dart';
import 'package:roadapp/features/layout/presentation/views/widgets/drawer_menu_item.dart';

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width * .7,
        child: const Scaffold(
            body: Column(children: [
          DrawerHeaderComponent(),
          Expanded(child: DrawerMenuItemComponent())
        ])));
  }
}