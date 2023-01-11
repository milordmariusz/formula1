import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:formula1/src/custom_widgets/navigation_drawer/navigation_drawer.dart';
import 'package:formula1/src/pages/edit_math_equation_page.dart';
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
  List<String> equationCategory = [];
  String dropdownValue = 'Różne';

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getMathFormulasFromStorage(dropdownValue);
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.mathEquationDataBasePageTitle)),
      drawer: const NavigationDrawer(
        selectedPage: 1,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: equationCategory
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    var categoryController = TextEditingController();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text("Dodaj kategorię"),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: TextFormField(
                                controller: categoryController,
                                decoration: const InputDecoration(
                                  labelText: "Wpisz kategorię",
                                  icon: Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              child: const Text("Zapisz"),
                              onPressed: () {
                                setState(() {
                                  saveCategory(categoryController.text);
                                  Navigator.of(context).pop();
                                });
                              },
                            )
                          ],
                        );
                      },
                    ).then(
                      (value) => () {
                        categoryController.clear;
                        setState(() {});
                      },
                    );
                  },
                  child: const Text("Dodaj kategorię")),
              ElevatedButton(
                  onPressed: () {
                    var categoryController = TextEditingController();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text("Usuń kategorię i wzory "),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: TextFormField(
                                controller: categoryController,
                                decoration: const InputDecoration(
                                  labelText: "Usuń kategorię",
                                  icon: Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              child: const Text("Usuń"),
                              onPressed: () {
                                setState(() {
                                  deleteCategory(categoryController.text);
                                  Navigator.of(context).pop();
                                });
                              },
                            )
                          ],
                        );
                      },
                    ).then(
                      (value) => () {
                        categoryController.clear;
                        setState(() {});
                      },
                    );
                  },
                  child: const Text("Usuń kategorię")),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 35),
              itemCount: mathFormulasList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(mathFormulasList[index]),
                  onDismissed: (direction) {
                    deleteMathFormula(index, dropdownValue);
                  },
                  background: Container(color: Colors.red),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                    child: InkWell(
                      onTap: () {
                        print("piesek");
                        EditMathEquationsPageState.equation.value =
                            mathFormulasList[index];
                        EditMathEquationsPageState.cursourIndex.value =
                            mathFormulasList[index].length;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return EditMathEquationsPage();
                            },
                          ),
                        );
                      },
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Math.tex(
                                mathFormulasList[index],
                                mathStyle: MathStyle.text,
                                textStyle: TextStyle(color: ColorPalette.black),
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
        ],
      ),
    );
  }

  Future<void> getMathFormulasFromStorage(key) async {
    mathFormulasList = await shared.getMathFormulas(key);
    mathFormulasList = List.from(mathFormulasList.reversed);
    setState(() {});
  }

  Future<void> getCategories() async {
    equationCategory = await shared.getMathCategories();
    setState(() {});
  }

  Future<void> saveCategory(String category) async {
    if (equationCategory.contains(category)) {
      return;
    }
    equationCategory.add(category);
    await shared.saveCategories(equationCategory);
  }

  Future<void> deleteCategory(String category) async {
    if (!equationCategory.contains(category) || category == 'Różne') {
      return;
    }
    mathFormulasList.clear();
    shared.saveMathFormulas(mathFormulasList, category);
    if (category == dropdownValue) {
      dropdownValue = 'Różne';
    }
    equationCategory.removeAt(equationCategory.indexOf(category));
    await shared.saveCategories(equationCategory);
  }

  void deleteMathFormula(int index, String key) {
    mathFormulasList.removeAt(index);
    shared.saveMathFormulas(mathFormulasList, key);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Wzór usunięty'),
      ),
    );
  }
}
