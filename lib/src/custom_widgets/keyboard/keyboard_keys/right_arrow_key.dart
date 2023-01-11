import 'package:flutter/material.dart';
import 'package:formula1/src/functions/find_pattern_right.dart';
import 'package:formula1/src/pages/edit_math_equation_page.dart';

class RightArrowKey extends StatelessWidget {
  final Color currentColor;

  const RightArrowKey({Key? key, this.currentColor = Colors.black45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          var str = EditMathEquationsPageState.equation.value;
          var cursour = EditMathEquationsPageState.cursourIndex.value;
          if (str.isNotEmpty && cursour != str.length) {
            EditMathEquationsPageState.cursourIndex.value +=
                findPatternRight(str.substring(cursour, str.length));
          }
        },
        child: LayoutBuilder(
          builder: (BuildContext, BoxConstraints) {
            if (MediaQuery.of(context).orientation == Orientation.landscape) {
              return AspectRatio(
                aspectRatio: 6 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: currentColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Center(child: Icon(Icons.chevron_right)),
                ),
              );
            } else {
              return AspectRatio(
                aspectRatio: 8 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: currentColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Center(child: Icon(Icons.chevron_right)),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
