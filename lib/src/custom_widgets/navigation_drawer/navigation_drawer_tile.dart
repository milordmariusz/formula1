import 'package:flutter/material.dart';
import 'package:formula1/main.dart';
import 'package:formula1/src/style/color_palette.dart';

class NavigationDrawerTile extends StatelessWidget {
  const NavigationDrawerTile({
    Key? key,
    required this.selectedPage,
    required this.tileIndex,
    required this.tileTitle,
  }) : super(key: key);

  final int selectedPage;
  final int tileIndex;
  final String tileTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tileTitle,
        style: TextStyle(
          color: selectedPage == tileIndex
              ? ColorPalette.orange
              : ColorPalette.white,
        ),
      ),
      onTap: () {
        if (selectedPage != tileIndex) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                switch (tileIndex) {
                  case 0:
                    {
                      return const EditMathEquationsPage();
                    }
                  case 1:
                    {
                      return const MathEquationsDataBasePage();
                    }
                  case 2:
                    {
                      return const SettingsPage();
                    }
                  default:
                    {
                      return const EditMathEquationsPage();
                    }
                }
              },
            ),
          );
        }
      },
    );
  }
}