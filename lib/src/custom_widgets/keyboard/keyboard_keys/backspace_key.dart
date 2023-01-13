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
            }  else if (leftSubEquation.length >= 5 &&
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
            } else if (leftSubEquation.length >= 4 &&
                leftSubEquation.substring(
                    leftSubEquation.length - 4, leftSubEquation.length) ==
                    "}^{}") {
                  var leftBrakets = 0;
                  var rightBrakets = 0;

                  for (var counter = leftSubEquation.length - 3; counter > 0; counter--) {
                    if (leftSubEquation.substring(counter - 1, counter) == "}") {
                      rightBrakets++;
                    }
                    else
                    if (leftSubEquation.substring(counter - 1, counter) == "{") {
                      leftBrakets++;
                    }
                    if (leftBrakets == rightBrakets) {
                      if (counter >= 5 &&
                          leftSubEquation.substring(counter - 5, counter) ==
                              "int_{") {
                        EditMathEquationsPageState.cursourIndex.value -= 4;
                        cursour -= 4;
                        leftSubEquation =
                            leftSubEquation.substring(0, leftSubEquation.length - 4);
                        rightSubEquation = "}^{}$rightSubEquation";
                      }
                    }
                  }
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


              EditMathEquationsPageState.cursourIndex.value -= 1;
              cursour -= 1;
              leftSubEquation = leftSubEquation.substring(0, leftSubEquation.length - 1);
              rightSubEquation = "}$rightSubEquation";

              while(leftBrakets != rightBrakets){
                if(leftSubEquation.substring(leftSubEquation.length - 1, leftSubEquation.length) == "}"){
                  rightBrakets++;
                }
                else if(leftSubEquation.substring(leftSubEquation.length - 1, leftSubEquation.length) == "{"){
                  leftBrakets++;
                }
                if(leftBrakets != rightBrakets) {
                  EditMathEquationsPageState.cursourIndex.value -= 1;
                  cursour -= 1;
                  leftSubEquation =
                      leftSubEquation.substring(0, leftSubEquation.length - 1);
                }
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

        child: LayoutBuilder(
          builder: (BuildContext, BoxConstraints) {
            if (MediaQuery.of(context).orientation == Orientation.landscape) {
              return AspectRatio(
                aspectRatio: 4 / 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: currentColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Center(child: Icon(Icons.arrow_back)),
                ),
              );
            } else {
              return AspectRatio(
                aspectRatio: 2 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: currentColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Center(child: Icon(Icons.arrow_back)),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
