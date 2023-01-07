import 'package:flutter/material.dart';
import 'package:formula1/src/functions/delete_pattern.dart';
import 'package:formula1/src/pages/edit_math_equation_page.dart';

class BackspaceKey extends StatelessWidget {
  final Color currentColor;

  const BackspaceKey({Key? key, this.currentColor = Colors.black45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          var str = EditMathEquationsPageState.equation.value;
          var cursour = EditMathEquationsPageState.cursourIndex.value;

          if (str.isNotEmpty) {
            var leftSubEquation = str.substring(0, cursour);
            var rightSubEquation = str.substring(cursour, str.length);
            if (leftSubEquation.isEmpty) {
              return;
            }
            if (leftSubEquation.length >= 12 &&
                leftSubEquation.substring(
                        leftSubEquation.length - 12, leftSubEquation.length) ==
                    "\\phantom{1}}") {
              EditMathEquationsPageState.cursourIndex.value -= 12;
              cursour -= 12;
              leftSubEquation =
                  leftSubEquation.substring(0, leftSubEquation.length - 12);
              rightSubEquation = "\\phantom{1}}$rightSubEquation";
              if (leftSubEquation.length >= 24 &&
                  leftSubEquation.substring(leftSubEquation.length - 24,
                          leftSubEquation.length) ==
                      "\\phantom{1}}{\\phantom{1}") {
                EditMathEquationsPageState.cursourIndex.value -= 24;
                cursour -= 24;
                leftSubEquation =
                    leftSubEquation.substring(0, leftSubEquation.length - 24);
                rightSubEquation =
                    "\\phantom{1}}{\\phantom{1}$rightSubEquation";
              }
            } else if (leftSubEquation.length >= 24 &&
                leftSubEquation.substring(
                        leftSubEquation.length - 24, leftSubEquation.length) ==
                    "\\phantom{1}}{\\phantom{1}") {
              EditMathEquationsPageState.cursourIndex.value -= 24;
              cursour -= 24;
              leftSubEquation =
                  leftSubEquation.substring(0, leftSubEquation.length - 24);
              rightSubEquation = "\\phantom{1}}{\\phantom{1}$rightSubEquation";
            } else if (leftSubEquation.length >= 17 &&
                leftSubEquation.substring(
                        leftSubEquation.length - 17, leftSubEquation.length) ==
                    "\\frac{\\phantom{1}") {
              EditMathEquationsPageState.cursourIndex.value -= 17;
              cursour -= 17;
              leftSubEquation =
                  leftSubEquation.substring(0, leftSubEquation.length - 17);
              rightSubEquation = "\\frac{\\phantom{1}$rightSubEquation";
            // } else if (leftSubEquation.length >= 2 &&
            //     leftSubEquation.substring(
            //             leftSubEquation.length - 2, leftSubEquation.length) ==
            //         "}}") {
            //   EditMathEquationsPageState.cursourIndex.value -= 2;
            //   cursour -= 2;
            //   leftSubEquation =
            //       leftSubEquation.substring(0, leftSubEquation.length - 2);
            //   rightSubEquation = "}}$rightSubEquation";
            //   if (leftSubEquation.length >= 5 &&
            //       leftSubEquation.substring(
            //               leftSubEquation.length - 5, leftSubEquation.length) ==
            //           "}\\to{") {
            //     EditMathEquationsPageState.cursourIndex.value -= 5;
            //     cursour -= 5;
            //     leftSubEquation =
            //         leftSubEquation.substring(0, leftSubEquation.length - 5);
            //     rightSubEquation = "}\\to{$rightSubEquation";
            //   }
            } else if (leftSubEquation.length >= 5 &&
                leftSubEquation.substring(
                        leftSubEquation.length - 5, leftSubEquation.length) ==
                    "}\\to{") {
              EditMathEquationsPageState.cursourIndex.value -= 5;
              cursour -= 5;
              leftSubEquation =
                  leftSubEquation.substring(0, leftSubEquation.length - 5);
              rightSubEquation = "}\\to{$rightSubEquation";
            } else if (leftSubEquation.length >= 3 &&
                leftSubEquation.substring(
                        leftSubEquation.length - 3, leftSubEquation.length) ==
                    "}^{") {
              EditMathEquationsPageState.cursourIndex.value -= 3;
              cursour -= 3;
              leftSubEquation =
                  leftSubEquation.substring(0, leftSubEquation.length - 3);
              rightSubEquation = "}^{$rightSubEquation";
            } else if (leftSubEquation.length >= 6 &&
                leftSubEquation.substring(
                        leftSubEquation.length - 6, leftSubEquation.length) ==
                    "\\int_{") {
              EditMathEquationsPageState.cursourIndex.value -= 6;
              cursour -= 6;
              leftSubEquation =
                  leftSubEquation.substring(0, leftSubEquation.length - 6);
              rightSubEquation = "\\int_{$rightSubEquation";
            } else if (leftSubEquation.length >= 7 &&
                leftSubEquation.substring(
                        leftSubEquation.length - 7, leftSubEquation.length) ==
                    "\\lim_{{") {
              EditMathEquationsPageState.cursourIndex.value -= 7;
              cursour -= 7;
              leftSubEquation =
                  leftSubEquation.substring(0, leftSubEquation.length - 7);
              rightSubEquation = "\\lim_{{$rightSubEquation";
            } else if (leftSubEquation[leftSubEquation.length - 1] == "}" &&
                leftSubEquation.substring(
                        leftSubEquation.length - 2, leftSubEquation.length) !=
                    "{}") {
              var leftBrakets = 0;
              var rightBrakets = 1;
              var counter= leftSubEquation.length;

              EditMathEquationsPageState.cursourIndex.value -= 1;
              cursour -= 1;
              leftSubEquation = leftSubEquation.substring(0, leftSubEquation.length - 1);
              rightSubEquation = "}$rightSubEquation";

              while(leftBrakets != rightBrakets){
                EditMathEquationsPageState.cursourIndex.value -= 1;
                cursour -= 1;
                leftSubEquation = leftSubEquation.substring(0, leftSubEquation.length - 1);
                if(leftSubEquation[counter] == "}"){
                  rightBrakets++;
                }
                else if(leftSubEquation[counter] == "{"){
                  leftBrakets++;
                }
                counter--;
              }



            }
            var deleteInstructions =
                deletePattern(leftSubEquation, rightSubEquation);

            str =
                leftSubEquation.substring(0, cursour - deleteInstructions[0]) +
                    rightSubEquation.substring(
                        deleteInstructions[1], rightSubEquation.length);
            EditMathEquationsPageState.cursourIndex.value =
                cursour - deleteInstructions[0];
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
            child: const Center(child: Icon(Icons.arrow_back)),
          ),
        ),
      ),
    );
  }
}
