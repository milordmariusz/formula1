import 'package:flutter/material.dart';
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
          brightness: Brightness.dark),
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
            const _MathFieldTextFieldExample(),
            _MathEquationsDataBase(),
            const _ClearableAutofocusExample(),
          ],
        ),
      ),
    );
  }
}

class _MathFieldTextFieldExample extends StatelessWidget {
  const _MathFieldTextFieldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Strona do edycji równań"),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.all(30),
            child: const TextField(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    size: 100,
                    color: ColorPalette.lightGrey,
                    Icons.delete_forever,
                  ),
                ),
              ),
              SizedBox(
                child: TextButton(
                  onPressed: () {},
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
    );
  }
}

class _MathEquationsDataBase extends StatelessWidget {
  _MathEquationsDataBase({
    Key? key,
  }) : super(key: key);

  final equationsList = [
    "Równanie: 1",
    "Równanie: 2",
    "Równanie: 3",
    "Równanie: 4",
    "Równanie: 5",
    "Równanie: 6",
    "Równanie: 7",
    "Równanie: 8",
    "Równanie: 9",
    "Równanie: 10",
    "Równanie: 11",
    "Równanie: 12",
    "Równanie: 13",
    "Równanie: 14",
    "Równanie: 15",
    "Równanie: 16",
    "Równanie: 17",
    "Równanie: 18",
    "Równanie: 19",
    "Równanie: 20",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: equationsList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            width: double.infinity,
            height: 150,
            child: Align(
              alignment: const Alignment(-0.9, 0),
              child: Text(
                equationsList[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        );
      },
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
