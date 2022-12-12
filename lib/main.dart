import 'package:flutter/material.dart';
import 'package:formula1/src/pages/edit_math_equation_page.dart';
import 'package:formula1/src/strings/strings.dart';
import 'package:formula1/src/style/color_palette.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: ColorPalette.orangeMaterialColor,
        primaryColor: ColorPalette.darkGrey,
        brightness: Brightness.dark,
      ),
      home: const EditMathEquationsPage(),
    );
  }
}



