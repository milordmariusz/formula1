import 'package:flutter/material.dart';
import 'package:formula1/src/custom_widgets/keyboard/keyboard_rows.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({Key? key}) : super(key: key);
  static ValueNotifier<int> keyboardPage = ValueNotifier<int>(0);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ValueListenableBuilder(
        valueListenable: Keyboard.keyboardPage,
        builder: (BuildContext context, int value, Widget? child) {
          if (Keyboard.keyboardPage.value == 0) {
            return Column(
              children: [
                Row(
                  children:
                      lettersFirstRow.map((e) => Flexible(child: e)).toList(),
                ),
                Row(
                  children:
                      lettersSecondRow.map((e) => Flexible(child: e)).toList(),
                ),
                Row(
                  children:
                      lettersThirdRow.map((e) => Flexible(child: e)).toList(),
                ),
                Row(
                  children:
                      lettersFourthRow.map((e) => Flexible(child: e)).toList(),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Row(
                  children: numbers.map((e) => Flexible(child: e)).toList(),
                ),
                Row(
                  children:
                      symbolsFirstRow.map((e) => Flexible(child: e)).toList(),
                ),
                Row(
                  children:
                      symbolsSecondRow.map((e) => Flexible(child: e)).toList(),
                ),
                Row(
                  children:
                      symbolsThirdRow.map((e) => Flexible(child: e)).toList(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
