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
  static ValueNotifier<String> equation = ValueNotifier<String>("");
  static ValueNotifier<int> cursourIndex = ValueNotifier<int>(0);
  List<String> equationCategory = [];
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
            ValueListenableBuilder(
              valueListenable: cursourIndex,
              builder: (BuildContext context, int value, Widget? child) {
                return ValueListenableBuilder<String>(
                  builder: (BuildContext context, String value, Widget? child) {
                    var equationString =
                        "${value.substring(0, cursourIndex.value)}|${value.substring(cursourIndex.value, value.length)}";
                    return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Math.tex(equationString));
                  },
                  valueListenable: equation,
                );
              },
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
                      cursourIndex.value = 0;
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
      // var mathFormulasList = await shared.getMathFormulas('Różne');
      // mathFormulasList.add(equation.value);
      // shared.saveMathFormulas(mathFormulasList, 'Różne');
      getCategories();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text("Zapisz wzór"),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 400,
                width: 250,
                child: ListView.builder(
                  itemCount: equationCategory.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        var mathFormulasList = await shared
                            .getMathFormulas(equationCategory[index]);
                        mathFormulasList.add(equation.value);
                        shared.saveMathFormulas(
                            mathFormulasList, equationCategory[index]);
                        cursourIndex.value = 0;
                        equation.value = "";
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: ColorPalette.lightGrey,
                            elevation: 10,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: ListTile(
                                    title: Text(
                                      equationCategory[index],
                                      style: TextStyle(
                                        color: ColorPalette.white,
                                      ),
                                    ),
                                    leading: const Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text("Anuluj"),
                onPressed: () {
                  setState(
                    () {
                      Navigator.of(context).pop();
                    },
                  );
                },
              )
            ],
          );
        },
      );
    }
  }

  Future<void> getCategories() async {
    equationCategory = await shared.getMathCategories();
    setState(() {});
  }

  void clearMathFormula() {
    equation.value = '';
  }
}
