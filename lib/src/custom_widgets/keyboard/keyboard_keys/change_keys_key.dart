import 'package:flutter/material.dart';
import 'package:formula1/src/custom_widgets/keyboard/keyboard.dart';

class ChangeKeysKey extends StatelessWidget {
  final Color currentColor;

  const ChangeKeysKey({Key? key, this.currentColor = Colors.black45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Keyboard.keyboardPage.value == 0
              ? Keyboard.keyboardPage.value = 1
              : Keyboard.keyboardPage.value = 0;
        },
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Container(
            decoration: BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Center(
              child: Icon(Icons.emoji_symbols),
            ),
          ),
        ),
      ),
    );
  }
}
