import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:formula1/src/pages/edit_math_equation_page.dart';

class BackspaceKey extends StatelessWidget {
  final Color currentColor;

  const BackspaceKey(
      {Key? key,
        this.currentColor = Colors.black45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          var str = EditMathEquationsPageState.equation.value;
          if (str.isNotEmpty) {
            str = str.substring(0, str.length - 1);
            EditMathEquationsPageState.equation.value = str;
          }
        },
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Container(
            decoration: BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Center(
                child: Icon(Icons.arrow_back)
            ),
          ),
        ),
      ),
    );
  }
}