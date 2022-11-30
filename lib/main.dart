import 'package:flutter/material.dart';
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
      title: 'Math Keyboard Demo',
      theme: ThemeData(
        primarySwatch: ColorPalette.orangeMaterialColor,
        primaryColor: ColorPalette.darkGrey,
        brightness: Brightness.dark,
        accentColor: ColorPalette.orange,
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    final upperTab = SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: TabBar(
            indicatorColor: ColorPalette.orange,
            labelColor: ColorPalette.orange,
            unselectedLabelColor: ColorPalette.lightGrey,
            tabs: <Tab>[
              Tab(icon: Icon(Icons.calculate)),
              Tab(icon: Icon(Icons.book)),
              Tab(icon: Icon(Icons.settings)),
            ]),
      ),
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: upperTab,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: TabBarView(
          children: [
            const MathFieldTextFieldExample(),
            _MathEquationsDataBase(),
            const _ClearableAutofocusExample(),
          ],
        ),
      ),
    );
  }
}

class MathFieldTextFieldExample extends StatefulWidget {
  const MathFieldTextFieldExample({super.key});

  @override
  State<StatefulWidget> createState() => _MathFieldTextFieldExampleState();
}

class _MathFieldTextFieldExampleState extends State<MathFieldTextFieldExample> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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

class _MathEquationsDataBase extends StatelessWidget {
  _MathEquationsDataBase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MathFormulas(),
      builder: (mathFormula, value, child) {
        final mathFormulas = value;
        return ListView.builder(
          padding: EdgeInsets.only(top: 35),
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
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
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
    );
  }
}

class _ClearableAutofocusExample extends StatefulWidget {
  const _ClearableAutofocusExample({Key? key}) : super(key: key);

  @override
  _ClearableAutofocusExampleState createState() =>
      _ClearableAutofocusExampleState();
}

class _ClearableAutofocusExampleState
    extends State<_ClearableAutofocusExample> {
  late final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          "Tutaj będą ustawienia aplikacji",
        ),
      ),
    );
  }
}
