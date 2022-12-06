import 'package:flutter/material.dart';
import 'package:formula1/src/custom_widgets/navigation_drawer/navigation_drawer.dart';
import 'package:formula1/src/shared/math_formulas.dart';
import 'package:formula1/src/style/color_palette.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formula 1',
      theme: ThemeData(
        primarySwatch: ColorPalette.orangeMaterialColor,
        primaryColor: ColorPalette.darkGrey,
        brightness: Brightness.dark,
      ),
      home: const EditMathEquationsPage(),
    );
  }
}

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
      appBar: AppBar(title: const Text('Edycja Równań')),
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
            const Text("Strona do edycji równań"),
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



class MathEquationsDataBasePage extends StatelessWidget {
  const MathEquationsDataBasePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Baza Równań')),
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

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ustawienia')),
      drawer: const NavigationDrawer(
        selectedPage: 2,
      ),
      body: const Center(
        child: Text(
          "Tutaj będą ustawienia aplikacji",
        ),
      ),
    );
  }
}
