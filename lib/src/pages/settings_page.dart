import 'package:flutter/material.dart';
import 'package:formula1/src/custom_widgets/navigation_drawer/navigation_drawer.dart' as nd;
import 'package:formula1/src/shared/math_formulas.dart';
import 'package:formula1/src/strings/strings.dart';
import 'package:formula1/src/style/color_palette.dart';

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
      appBar: AppBar(title: const Text(Strings.settingsPageTitle)),
      drawer: const nd.NavigationDrawer(
        selectedPage: 2,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(20.0),
                color: ColorPalette.darkGrey,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Text(
                      Strings.settingsPageTitle,
                      style: TextStyle(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          Strings.settingsPageLatexPreview,
                          style: TextStyle(fontSize: 15),
                        ),
                        CustomSwitch()
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(25.0),
                color: ColorPalette.darkGrey,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      Strings.abutApplication,
                      style: TextStyle(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      Strings.applicationDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      Strings.authors,
                      style: TextStyle(fontSize: 28),
                    ),
                    Column(
                      children: const [
                        Text(
                          Strings.mariuszNameSurname,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Strings.patrykNameSurname,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Strings.arkadiuszNameSurname,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Strings.dawidNameSurname,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitch();
}

class _CustomSwitch extends State<CustomSwitch> {
  var shared = MathFormulas();
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    getSettings();
  }

  Future<void> getSettings() async {
    isSwitched = await shared.getLatexPreviewSetting();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Switch(
            activeColor: ColorPalette.orange,
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                shared.saveLatexPreviewSetting(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
