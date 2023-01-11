import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:formula1/src/pages/edit_math_equation_page.dart';

class IconKey extends StatelessWidget {
  final Color currentColor;
  final String keyboardInput;
  final String keyboardIconTeXString;

  const IconKey(
      {Key? key,
      this.currentColor = Colors.black45,
      required this.keyboardInput,
      required this.keyboardIconTeXString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          var str = EditMathEquationsPageState.equation.value;
          var cursour = EditMathEquationsPageState.cursourIndex.value;
          str = str.substring(0, cursour) +
              keyboardInput +
              str.substring(cursour, str.length);
          EditMathEquationsPageState.equation.value = str;
          var newCursourPosition = 0;
          if(keyboardInput=="\\frac{\\phantom{1}\\phantom{1}}{\\phantom{1}\\phantom{1}}"){
            newCursourPosition = 17;
          }
          else if(keyboardInput=="^{}"){
            newCursourPosition = 2;
          }
          else if(keyboardInput=="\\sqrt{}"){
            newCursourPosition = 6;
          }
          else if(keyboardInput=="\\log_{}"){
            newCursourPosition = 6;
          }
          else if(keyboardInput=="\\lim_{{}\\to{}}"){
            newCursourPosition = 7;
          }
          else if(keyboardInput=="\\int_{}^{}"){
            newCursourPosition = 6;
          }
          else{
            newCursourPosition = keyboardInput.length;
          }
          EditMathEquationsPageState.cursourIndex.value += newCursourPosition;

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
                  child: Center(
                      child: Math.tex(keyboardIconTeXString, mathStyle: MathStyle.text)
                  ),
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
                  child: Center(
                      child: Math.tex(keyboardIconTeXString, mathStyle: MathStyle.text, textStyle: TextStyle(fontSize: MediaQuery.of(context).devicePixelRatio * 4 ),)
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
