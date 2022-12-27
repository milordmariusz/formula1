import 'package:flutter/material.dart';
import 'package:formula1/src/pages/edit_math_equation_page.dart';

class LetterKey extends StatelessWidget {
  final Color currentColor;
  final String keyboardInput;

  const LetterKey(
      {Key? key,
        this.currentColor = Colors.black45,
        required this.keyboardInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          EditMathEquationsPageState.equation.value += keyboardInput;
        },
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Container(
            decoration: BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
              child: Text(
                keyboardInput,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
