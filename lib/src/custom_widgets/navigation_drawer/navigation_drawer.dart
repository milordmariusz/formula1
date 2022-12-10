import 'package:flutter/material.dart';
import 'package:formula1/src/strings/strings.dart';
import 'package:formula1/src/style/color_palette.dart';

import 'navigation_drawer_tile.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    required this.selectedPage,
    Key? key,
  }) : super(key: key);

  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorPalette.orange,
            ),
            child: const Text(Strings.appTitle),
          ),
          NavigationDrawerTile(
            selectedPage: selectedPage,
            tileIndex: 0,
            tileTitle: Strings.editMathEquationPageTitle,
          ),
          NavigationDrawerTile(
            selectedPage: selectedPage,
            tileIndex: 1,
            tileTitle: Strings.mathEquationDataBasePageTitle,
          ),
          NavigationDrawerTile(
            selectedPage: selectedPage,
            tileIndex: 2,
            tileTitle: Strings.settingsPageTitle,
          ),
        ],
      ),
    );
  }
}