import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:formula1/src/custom_widgets/keyboard/keyboard.dart';
import 'package:formula1/src/custom_widgets/navigation_drawer/navigation_drawer.dart';
import 'package:formula1/src/shared/math_formulas.dart';
import 'package:formula1/src/strings/strings.dart';
import 'package:formula1/src/style/color_palette.dart';

class EditMathEquationsPage extends StatefulWidget {
  const EditMathEquationsPage({super.key});

  @override
  State<StatefulWidget> createState() => EditMathEquationsPageState();
}

class EditMathEquationsPageState extends State<EditMathEquationsPage> {
  //static final textController = TextEditingController();
  static ValueNotifier<String> equation = ValueNotifier<String>("");
  var shared = MathFormulas();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.editMathEquationPageTitle)),
      drawer: const NavigationDrawer(
        selectedPage: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(Strings.editMathEquationPageSubTitle),
            const SizedBox(
              height: 50,
            ),
            ValueListenableBuilder<String>(
              builder: (BuildContext context, String value, Widget? child) {
                return Math.tex(equation.value);
              },
              valueListenable: equation,
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder<String>(
              builder: (BuildContext context, String value, Widget? child) {
                return Text(equation.value);
              },
              valueListenable: equation,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      clearMathFormula();
                    },
                    child: Icon(
                      size: 20,
                      color: ColorPalette.lightGrey,
                      Icons.delete_forever,
                    ),
                  ),
                ),
                SizedBox(
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      addMathFormula();
                    },
                    child: Icon(
                      size: 20,
                      color: ColorPalette.lightGrey,
                      Icons.add_box,
                    ),
                  ),
                ),
              ],
            ),
            const Keyboard(),
          ],
        ),
      ),
    );
  }

  Future<void> addMathFormula() async {
    if (equation.value != '') {
      var mathFormulasList = await shared.getMathFormulas();
      mathFormulasList.add(equation.value);
      shared.saveMathFormulas(mathFormulasList);
    }
  }

  void clearMathFormula() {
    equation.value = '';
  }
}
