import 'package:flutter/material.dart';
import 'package:formula1/src/custom_widgets/navigation_drawer/navigation_drawer.dart';
import 'package:formula1/src/shared/math_formulas.dart';
import 'package:formula1/src/strings/strings.dart';
import 'package:formula1/src/style/color_palette.dart';

class EditMathEquationsPage extends StatefulWidget {
  const EditMathEquationsPage({super.key});

  @override
  State<StatefulWidget> createState() => _EditMathEquationsPageState();
}

class _EditMathEquationsPageState extends State<EditMathEquationsPage> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

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
            Container(
              height: 100,
              margin: const EdgeInsets.all(30),
              child: TextField(
                controller: _textController,
              ),
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
                      size: 100,
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
                      size: 100,
                      color: ColorPalette.lightGrey,
                      Icons.add_box,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void addMathFormula() {
    if (_textController.text != '') {
      MathFormulas().add(mathFormula: _textController.text);
    }
  }

  void clearMathFormula() {
    _textController.text = '';
  }
}
