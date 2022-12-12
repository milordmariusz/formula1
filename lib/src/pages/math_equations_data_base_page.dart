import 'package:flutter/material.dart';
import 'package:formula1/src/custom_widgets/navigation_drawer/navigation_drawer.dart';
import 'package:formula1/src/shared/math_formulas.dart';
import 'package:formula1/src/strings/strings.dart';
import 'package:formula1/src/style/color_palette.dart';

class MathEquationsDataBasePage extends StatelessWidget {
  const MathEquationsDataBasePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.mathEquationDataBasePageTitle)),
      drawer: const NavigationDrawer(
        selectedPage: 1,
      ),
      body: ValueListenableBuilder(
        valueListenable: MathFormulas(),
        builder: (mathFormula, value, child) {
          final mathFormulas = value;
          return ListView.builder(
            padding: const EdgeInsets.only(top: 35),
            itemCount: mathFormulas.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: ColorPalette.blackMaterialColor.shade400,
                            blurRadius: 25.0,
                            offset: const Offset(0, 10))
                      ],
                      color: ColorPalette.lightGreyMaterialColor.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  width: double.infinity,
                  height: 150,
                  child: Align(
                    alignment: const Alignment(-0.9, 0),
                    child: Text(
                      mathFormulas[index],
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        // child:
      ),
    );
  }
}
