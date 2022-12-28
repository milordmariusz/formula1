import 'package:flutter/material.dart';
import 'package:formula1/src/functions/find_pattern_left.dart';
import 'package:formula1/src/pages/edit_math_equation_page.dart';

class LeftArrowKey extends StatelessWidget {
  final Color currentColor;

  const LeftArrowKey({Key? key, this.currentColor = Colors.black45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          var str = EditMathEquationsPageState.equation.value;
          var cursour = EditMathEquationsPageState.cursourIndex.value;
          if (str.isNotEmpty && cursour != 0) {
            EditMathEquationsPageState.cursourIndex.value -=
                findPatternLeft(str.substring(0, cursour));
          }
        },
        child: AspectRatio(
          aspectRatio: 8 / 3,
          child: Container(
            decoration: BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Center(child: Icon(Icons.chevron_left)),
          ),
        ),
      ),
    );
  }
}
