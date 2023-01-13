import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool latexPreviewSetting = false;

  @override
  void initState() {
    super.initState();
    getLatexPreviewSetting();
  }

  Future<void> getLatexPreviewSetting() async {
    latexPreviewSetting = await shared.getLatexPreviewSetting();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.editMathEquationPageTitle)),
      drawer: const NavigationDrawer(
        selectedPage: 0,
      ),
      body: LayoutBuilder(
        builder: (BuildContext, BoxConstraints) {
          if (MediaQuery.of(context).orientation == Orientation.landscape) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        ValueListenableBuilder(
                          valueListenable: cursourIndex,
                          builder: (context, int value, Widget? child) {
                            return ValueListenableBuilder<String>(
                              builder: (context, String value, Widget? child) {
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
                          height: 10,
                        ),
                        Visibility(
                          visible: latexPreviewSetting,
                          child: ValueListenableBuilder<String>(
                            builder: (context, String value, Widget? child) {
                              return Text(equation.value);
                            },
                            valueListenable: equation,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Flexible(child: Keyboard()),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {
                                cursourIndex.value = 0;
                                clearMathFormula();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Clear", style: TextStyle(fontSize: 15)),
                                  Icon(
                                    Icons.delete_forever_outlined,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 30,
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {
                                addMathFormula();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Add", style: TextStyle(fontSize: 15)),
                                  Icon(
                                    Icons.add,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 30,
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () async {
                                ClipboardData? cdata = await Clipboard.getData(
                                    Clipboard.kTextPlain);
                                String? cdataString = cdata?.text;
                                if (cdataString != null) {
                                  equation.value = cdataString;
                                  cursourIndex.value = equation.value.length;
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Import ",
                                      style: TextStyle(fontSize: 15)),
                                  Icon(
                                    Icons.copy,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 30,
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () async {
                                Clipboard.setData(
                                  ClipboardData(text: equation.value),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Coppied to Clipboard"),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Export ",
                                      style: TextStyle(fontSize: 15)),
                                  Icon(
                                    Icons.copy_rounded,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        ValueListenableBuilder(
                          valueListenable: cursourIndex,
                          builder: (context, int value, Widget? child) {
                            return ValueListenableBuilder<String>(
                              builder: (context, String value, Widget? child) {
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
                        Visibility(
                          visible: latexPreviewSetting,
                          child: ValueListenableBuilder<String>(
                            builder: (context, String value, Widget? child) {
                              return Text(equation.value);
                            },
                            valueListenable: equation,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {
                            cursourIndex.value = 0;
                            clearMathFormula();
                          },
                          child: Row(
                            children: const [
                              Text("Clear", style: TextStyle(fontSize: 12)),
                              Icon(
                                Icons.delete_forever_outlined,
                                size: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {
                            addMathFormula();
                          },
                          child: Row(
                            children: const [
                              Text("Add", style: TextStyle(fontSize: 12)),
                              Icon(
                                Icons.add,
                                size: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () async {
                            ClipboardData? cdata =
                                await Clipboard.getData(Clipboard.kTextPlain);
                            String? cdataString = cdata?.text;
                            if (cdataString != null) {
                              equation.value = cdataString;
                              cursourIndex.value = equation.value.length;
                            }
                          },
                          child: Row(
                            children: const [
                              Text("Import ", style: TextStyle(fontSize: 12)),
                              Icon(
                                Icons.copy,
                                size: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () async {
                            if(equation.value==""){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Brak danych do eksportu"),
                                ),
                              );
                            }
                            else{
                              exportEquation();
                            }
                          },
                          child: Row(
                            children: const [
                              Text("Export ", style: TextStyle(fontSize: 12)),
                              Icon(
                                Icons.copy_rounded,
                                size: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Keyboard(),
                  const SizedBox(
                    height: 25,
                  ),
                ]),
              ],
            );
          }
        },
      ),
    );
  }

  void exportEquation() {
    String equationToSend = equation.value;
    // equationToSend = changeLaTeXToMathMl(equationToSend);
    // Clipboard.setData(ClipboardData(text: equationToSend));
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("Coppied to Clipboard"),
    //   ),
    // );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text("Eksportuj wzór"),
          actions: [
            ElevatedButton(
              child: const Text("Latex"),
              onPressed: () {
                setState(
                  () {
                    Clipboard.setData(ClipboardData(text: equationToSend));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Coppied to Clipboard"),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
            ElevatedButton(
              child: const Text("MathMl"),
              onPressed: () {
                setState(
                  () {
                    equationToSend = changeLaTeXToMathMl(equationToSend);
                    Clipboard.setData(ClipboardData(text: equationToSend));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Coppied to Clipboard"),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
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

  String changeLaTeXToMathMl(String data) {
    String parsedEquation = "";
    parsedEquation += "<math><mrow>";
    parsedEquation += parseBodyToMathMl(data);
    parsedEquation += "</mrow></math>";
    return parsedEquation;
  }

  String parseBodyToMathMl(data) {
    String parsedEquation = "";
    int index = 0;
    do {
      if (data.substring(index, index + 1) == "(" ||
          data.substring(index, index + 1) == ")") {
        var symbol = data.substring(index, index + 1);
        parsedEquation += '<mo form="prefix" stretchy="false">$symbol</mo>';
        index += 1;
      } else if (data.substring(index, index + 1) == "<") {
        parsedEquation += """<mo>&lt;</mo>""";
        index += 1;
      } else if (data.substring(index, index + 1) == ">") {
        parsedEquation += """<mo>&gt;</mo>""";
        index += 1;
      } else if (data.substring(index, data.length).length >= 2 &&
          data.substring(index, index + 2) == "\\%") {
        parsedEquation += "<mi>%</mi>";
        index += 2;
      } else if (data.substring(index, data.length).length >= 3 &&
          data.substring(index, index + 3) == "\\pi") {
        parsedEquation += "<mi>π</mi>";
        index += 3;
      } else if (data.substring(index, data.length).length >= 7 &&
          data.substring(index, index + 7) == "\\degree") {
        parsedEquation += "<mi>°</mi>";
        index += 7;
      } else if (data.substring(index, data.length).length >= 6 &&
          data.substring(index, index + 6) == "\\infty") {
        parsedEquation += "<mi>∞</mi>";
        index += 6;
      } else if (data.substring(index, data.length).length >= 6 &&
          data.substring(index, index + 6) == "\\times") {
        parsedEquation += "<mo>×</mo>";
        index += 6;
      } else if (data.substring(index, data.length).length >= 4 &&
          data.substring(index, index + 4) == "\\div") {
        parsedEquation += "<mo>÷</mo>";
        index += 4;
      } else if (data.substring(index, index + 1) == "=") {
        parsedEquation += "<mo>=</mo>";
        index += 1;
      } else if (data.substring(index, data.length).length >= 3 &&
          data.substring(index, index + 3) == "\\ln") {
        parsedEquation +=
            """<mrow><mi>ln<mspace width="0.1667em"></mspace></mi></mrow>""";
        index += 3;
      } else if (data.substring(index, index + 1).contains(RegExp(r'[0-9]'))) {
        int counter = 1;
        while (data.substring(index + counter, data.length).length >= 1 &&
            data[counter].toString().contains(RegExp(r'[0-9]'))) {
          counter += 1;
        }
        var number = data.substring(index, index + counter);
        parsedEquation += "<mn>$number</mn>";
        index += counter;
      } else if (data.substring(index, index + 1).contains(RegExp(r'[.+-]'))) {
        var symbol = data.substring(index, index + 1);
        parsedEquation += "<mo>$symbol</mo>";
        index += 1;
      } else if (data.substring(index, data.length).length >= 6 &&
          data.substring(index, index + 6) == "\\frac{") {
        String fracBody = data.substring(index + 6, data.length);
        int counter = 0;
        String upperFracPart = "";
        String lowerFracPart = "";
        int leftBracketCounter = 2;
        int rightBracketCounter = 1;
        do {
          if (fracBody[counter] == "{") {
            leftBracketCounter += 1;
          } else if (fracBody[counter] == "}") {
            rightBracketCounter += 1;
          }
          counter += 1;
        } while (leftBracketCounter != rightBracketCounter);
        upperFracPart = fracBody.substring(0, counter);
        lowerFracPart = fracBody.substring(counter, fracBody.length);
        int bottomCounter = 0;
        leftBracketCounter = 0;
        rightBracketCounter = 0;
        do {
          if (lowerFracPart[bottomCounter] == "{") {
            leftBracketCounter += 1;
          } else if (lowerFracPart[bottomCounter] == "}") {
            rightBracketCounter += 1;
          }
          bottomCounter += 1;
        } while (leftBracketCounter != rightBracketCounter);
        lowerFracPart = fracBody.substring(counter, counter + bottomCounter);
        int wholeFracLength = 6 + upperFracPart.length + lowerFracPart.length;
        if (upperFracPart.substring(0, 11) == "\\phantom{1}") {
          upperFracPart = upperFracPart.substring(11, upperFracPart.length);
        }
        if (upperFracPart.substring(
                upperFracPart.length - 12, upperFracPart.length) ==
            "\\phantom{1}}") {
          upperFracPart = upperFracPart.substring(0, upperFracPart.length - 12);
        }

        if (lowerFracPart.substring(0, 12) == "{\\phantom{1}") {
          lowerFracPart = lowerFracPart.substring(12, lowerFracPart.length);
        }
        if (lowerFracPart.substring(
                lowerFracPart.length - 12, lowerFracPart.length) ==
            "\\phantom{1}}") {
          lowerFracPart = lowerFracPart.substring(0, lowerFracPart.length - 12);
        }
        upperFracPart = parseBodyToMathMl(upperFracPart);
        lowerFracPart = parseBodyToMathMl(lowerFracPart);
        parsedEquation +=
            """<mfrac><mrow>$upperFracPart</mrow><mrow>$lowerFracPart</mrow></mfrac>""";
        index += wholeFracLength;
      } else if (data.substring(index, data.length).length >= 6 &&
          data.substring(index, index + 6) == "\\sqrt{") {
        String sqrtBody = data.substring(index + 6, data.length);
        int counter = 0;
        String strUnderSqrt = "";
        int leftBracketCounter = 2;
        int rightBracketCounter = 1;
        do {
          if (sqrtBody[counter] == "{") {
            leftBracketCounter += 1;
          } else if (sqrtBody[counter] == "}") {
            rightBracketCounter += 1;
          }
          counter += 1;
        } while (leftBracketCounter != rightBracketCounter);
        strUnderSqrt = sqrtBody.substring(0, counter - 1);
        int lengthOfSqrtBody = strUnderSqrt.length;
        strUnderSqrt = parseBodyToMathMl(strUnderSqrt);
        parsedEquation += """<msqrt><mrow>$strUnderSqrt</mrow></msqrt>""";
        index += 7 + lengthOfSqrtBody;
      } else if (data.substring(index, data.length).length >= 2 &&
          data.substring(index, index + 2) == "^{") {
        String powBody = "";
        if (index == 0) {
          powBody = data.substring(index + 2, data.length);
        } else {
          powBody = data.substring(index + 2, data.length);
        }
        int counter = 0;
        String strInPow = "";
        int leftBracketCounter = 1;
        int rightBracketCounter = 0;
        do {
          if (powBody[counter] == "{") {
            leftBracketCounter += 1;
          } else if (powBody[counter] == "}") {
            rightBracketCounter += 1;
          }
          counter += 1;
        } while (leftBracketCounter != rightBracketCounter);
        strInPow = powBody.substring(0, counter - 1);
        int lengthOfPowBody = strInPow.length;
        strInPow = parseBodyToMathMl(strInPow);
        parsedEquation += """<msup><mi></mi><mrow>$strInPow</mrow></msup>""";
        index += 3 + lengthOfPowBody;
      } else if (data.substring(index, data.length).length >= 6 &&
          data.substring(index, index + 6) == "\\log_{") {
        String logBody = data.substring(index + 6, data.length);
        int counter = 0;
        String strUnderLog = "";
        int leftBracketCounter = 1;
        int rightBracketCounter = 0;
        do {
          if (logBody[counter] == "{") {
            leftBracketCounter += 1;
          } else if (logBody[counter] == "}") {
            rightBracketCounter += 1;
          }
          counter += 1;
        } while (leftBracketCounter != rightBracketCounter);
        strUnderLog = logBody.substring(0, counter - 1);
        int lengthOfLogBody = strUnderLog.length;
        strUnderLog = parseBodyToMathMl(strUnderLog);
        parsedEquation += """<msub><mi>log</mi>$strUnderLog</msub>""";
        index += 7 + lengthOfLogBody;
      } else if (data.substring(index, data.length).length >= 6 &&
          data.substring(index, index + 6) == "\\lim_{") {
        String limBody = data.substring(index + 6, data.length);
        int counter = 0;
        String leftLimPart = "";
        String rightLimPart = "";
        int leftBracketCounter = 0;
        int rightBracketCounter = 0;
        do {
          if (limBody[counter] == "{") {
            leftBracketCounter += 1;
          } else if (limBody[counter] == "}") {
            rightBracketCounter += 1;
          }
          counter += 1;
        } while (leftBracketCounter != rightBracketCounter);
        leftLimPart = limBody.substring(1, counter - 1);
        rightLimPart = limBody.substring(counter + 4, limBody.length);
        int bottomCounter = 0;
        leftBracketCounter = 1;
        rightBracketCounter = 0;
        do {
          if (rightLimPart[bottomCounter] == "{") {
            leftBracketCounter += 1;
          } else if (rightLimPart[bottomCounter] == "}") {
            rightBracketCounter += 1;
          }
          bottomCounter += 1;
        } while (leftBracketCounter != rightBracketCounter);
        rightLimPart =
            limBody.substring(counter + 4, counter + 4 + bottomCounter - 1);
        print(leftLimPart);
        print(rightLimPart);
        int wholeFracLength = 14 + leftLimPart.length + rightLimPart.length;
        print(wholeFracLength);
        leftLimPart = parseBodyToMathMl(leftLimPart);
        rightLimPart = parseBodyToMathMl(rightLimPart);
        parsedEquation +=
            """<munder><mi>lim</mi><mrow>$leftLimPart<mo>→</mo>$rightLimPart</mrow></munder>""";
        index += wholeFracLength;
      } else if (data.substring(index, data.length).length >= 6 &&
          data.substring(index, index + 6) == "\\int_{") {
        String intBody = data.substring(index + 6, data.length);
        int counter = 0;
        String leftIntPart = "";
        String rightIntPart = "";
        int leftBracketCounter = 1;
        int rightBracketCounter = 0;
        do {
          if (intBody[counter] == "{") {
            leftBracketCounter += 1;
          } else if (intBody[counter] == "}") {
            rightBracketCounter += 1;
          }
          counter += 1;
        } while (leftBracketCounter != rightBracketCounter);
        leftIntPart = intBody.substring(0, counter - 1);
        rightIntPart = intBody.substring(counter, intBody.length);
        int bottomCounter = 1;
        leftBracketCounter = 0;
        rightBracketCounter = 0;
        do {
          if (rightIntPart[bottomCounter] == "{") {
            leftBracketCounter += 1;
          } else if (rightIntPart[bottomCounter] == "}") {
            rightBracketCounter += 1;
          }
          bottomCounter += 1;
        } while (leftBracketCounter != rightBracketCounter);
        rightIntPart =
            intBody.substring(counter + 2, counter + bottomCounter - 1);
        int wholeIntLength = 10 + leftIntPart.length + rightIntPart.length;
        leftIntPart = parseBodyToMathMl(leftIntPart);
        rightIntPart = parseBodyToMathMl(rightIntPart);
        parsedEquation +=
            """<msubsup><mo movablelimits="false">∫</mo>$leftIntPart$rightIntPart</msubsup>""";
        index += wholeIntLength;
      } else {
        String symbol = data.substring(index, index + 1);
        parsedEquation += "<mo>$symbol</mo>";
        index += 1;
      }
    } while (index < data.length);
    return parsedEquation;
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
