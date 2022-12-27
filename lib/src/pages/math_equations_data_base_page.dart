import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:formula1/src/custom_widgets/navigation_drawer/navigation_drawer.dart';
import 'package:formula1/src/shared/math_formulas.dart';
import 'package:formula1/src/strings/strings.dart';
import 'package:formula1/src/style/color_palette.dart';

class MathEquationsDataBasePage extends StatefulWidget {
  const MathEquationsDataBasePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MathEquationsDataBasePage> createState() =>
      _MathEquationsDataBasePageState();
}

class _MathEquationsDataBasePageState extends State<MathEquationsDataBasePage> {
  var shared = MathFormulas();
  List<String> mathFormulasList = [];

  @override
  void initState() {
    getMathFormulasFromStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.mathEquationDataBasePageTitle)),
      drawer: const NavigationDrawer(
        selectedPage: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 35),
        itemCount: mathFormulasList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(mathFormulasList[index]),
            onDismissed: (direction) {
              deleteMathFormula(index);
            },
            background: Container(color: Colors.red),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorPalette.blackMaterialColor.shade400,
                      blurRadius: 25.0,
                      offset: const Offset(0, 10),
                    )
                  ],
                  color: ColorPalette.lightGreyMaterialColor.shade200,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                width: double.infinity,
                height: 150,
                child: Align(
                  alignment: const Alignment(-0.9, 0),
                  child: TeXView(
                    child: TeXViewDocument(
                      "\$\$${mathFormulasList[index]}\$\$",
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> getMathFormulasFromStorage() async {
    mathFormulasList = await shared.getMathFormulas();
    setState(() {});
  }

  void deleteMathFormula(int index) {
    mathFormulasList.removeAt(index);
    shared.saveMathFormulas(mathFormulasList);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Wzór usunięty'),
      ),
    );
  }
}
