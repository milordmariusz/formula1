import 'package:formula1/src/custom_widgets/keyboard/keyboard_keys/backspace_key.dart';
import 'package:formula1/src/custom_widgets/keyboard/keyboard_keys/change_keys_key.dart';
import 'package:formula1/src/custom_widgets/keyboard/keyboard_keys/icon_key.dart';
import 'package:formula1/src/custom_widgets/keyboard/keyboard_keys/left_arrow_key.dart';
import 'package:formula1/src/custom_widgets/keyboard/keyboard_keys/letter_key.dart';
import 'package:flutter/material.dart';
import 'package:formula1/src/custom_widgets/keyboard/keyboard_keys/move_to_beginning_key.dart';
import 'package:formula1/src/custom_widgets/keyboard/keyboard_keys/move_to_end_key.dart';
import 'package:formula1/src/custom_widgets/keyboard/keyboard_keys/right_arrow_key.dart';

const List<LetterKey> lettersFirstRow = [
  LetterKey(keyboardInput: "q"),
  LetterKey(keyboardInput: "w"),
  LetterKey(keyboardInput: "e"),
  LetterKey(keyboardInput: "r"),
  LetterKey(keyboardInput: "t"),
  LetterKey(keyboardInput: "y"),
  LetterKey(keyboardInput: "u"),
  LetterKey(keyboardInput: "i"),
  LetterKey(keyboardInput: "o"),
  LetterKey(keyboardInput: "p"),
];
const List<LetterKey> lettersSecondRow = [
  LetterKey(keyboardInput: "a"),
  LetterKey(keyboardInput: "s"),
  LetterKey(keyboardInput: "d"),
  LetterKey(keyboardInput: "f"),
  LetterKey(keyboardInput: "g"),
  LetterKey(keyboardInput: "h"),
  LetterKey(keyboardInput: "j"),
  LetterKey(keyboardInput: "k"),
  LetterKey(keyboardInput: "l"),
];
const List<Widget> lettersThirdRow = [
  ChangeKeysKey(),
  LetterKey(keyboardInput: "z"),
  LetterKey(keyboardInput: "x"),
  LetterKey(keyboardInput: "c"),
  LetterKey(keyboardInput: "v"),
  LetterKey(keyboardInput: "b"),
  LetterKey(keyboardInput: "n"),
  LetterKey(keyboardInput: "m"),
  BackspaceKey(),
];
const List<Widget> lettersFourthRow = [
  MoveToBeginningKey(),
  LeftArrowKey(),
  RightArrowKey(),
  MoveToEndKey(),
];
const List<Widget> numbers = [
  LetterKey(keyboardInput: "0"),
  LetterKey(keyboardInput: "1"),
  LetterKey(keyboardInput: "2"),
  LetterKey(keyboardInput: "3"),
  LetterKey(keyboardInput: "4"),
  LetterKey(keyboardInput: "5"),
  LetterKey(keyboardInput: "6"),
  LetterKey(keyboardInput: "7"),
  LetterKey(keyboardInput: "8"),
  LetterKey(keyboardInput: "9"),
];
const List<Widget> symbolsFirstRow = [
  LetterKey(keyboardInput: "("),
  LetterKey(keyboardInput: ")"),
  IconKey(keyboardInput: "\\frac{\\phantom{1}\\phantom{1}}{\\phantom{1}\\phantom{1}}", keyboardIconTeXString: "\\frac a b"),
  IconKey(keyboardInput: "\\pi ", keyboardIconTeXString: "\\pi"),
  IconKey(keyboardInput: "<", keyboardIconTeXString: "<"),
  IconKey(keyboardInput: ">", keyboardIconTeXString: ">"),
  IconKey(keyboardInput: "^{}", keyboardIconTeXString: "a^b"),
  IconKey(keyboardInput: "\\sqrt{}", keyboardIconTeXString: "\\sqrt a"),
  IconKey(keyboardInput: "\\% ", keyboardIconTeXString: "\\%"),
  LetterKey(keyboardInput: "."),
  IconKey(keyboardInput: "\\degree ", keyboardIconTeXString: "\\degree"),
  IconKey(keyboardInput: "\\infty ", keyboardIconTeXString: "\\infty"),
];
const List<Widget> symbolsSecondRow = [
  ChangeKeysKey(),
  LetterKey(keyboardInput: "="),
  LetterKey(keyboardInput: "+"),
  LetterKey(keyboardInput: "-"),
  IconKey(keyboardInput: "\\times ", keyboardIconTeXString: "\\times"),
  IconKey(keyboardInput: "\\div ", keyboardIconTeXString: "\\div"),
  IconKey(keyboardInput: "\\log_{}", keyboardIconTeXString: "\\log_a"),
  IconKey(keyboardInput: "\\ln ", keyboardIconTeXString: "\\ln"),
  IconKey(keyboardInput: "\\lim_{{}\\to{}}", keyboardIconTeXString: "\\lim"),
  IconKey(keyboardInput: "\\int_{}^{}", keyboardIconTeXString: "\\int_{a}^{b}"),
  BackspaceKey(),
];
const List<Widget> symbolsThirdRow = [
  MoveToBeginningKey(),
  LeftArrowKey(),
  RightArrowKey(),
  MoveToEndKey(),
];
