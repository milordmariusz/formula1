import 'package:flutter/material.dart';
import 'package:formula1/src/pages/edit_math_equation_page.dart';

class MoveToBeginningKey extends StatelessWidget {
  final Color currentColor;

  const MoveToBeginningKey({Key? key, this.currentColor = Colors.black45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          EditMathEquationsPageState.cursourIndex.value = 0;
        },
        child: AspectRatio(
          aspectRatio: 8 / 3,
          child: Container(
            decoration: BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Center(
              child: Icon(Icons.keyboard_double_arrow_left),
            ),
          ),
        ),
      ),
    );
  }
}
