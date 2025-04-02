import 'dart:io';

import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    final hastNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        if (menuItem.link != null) {
          //Navigator.pushNamed(context, menuItem.link!);
          Navigator.pushNamed(context, menuItem.link!);
        } else {
          Navigator.pop(context);
        }
      },
      children: [
        //! padding for the notch
        Padding(
          padding: EdgeInsets.fromLTRB(28, hastNotch ? 0 : 20, 16, 10),
          //titulo del drawer
          child: const Text('Main'),

          //!  menu del drawer
        ),
        ...appMenuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 20, 16, 10),
          //Subtitulo del drawer
          child: Text('Sub Main'),
        ),

        //! submenu del drawer

        ...appMenuItems.sublist(3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
