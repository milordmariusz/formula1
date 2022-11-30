import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MathFormulas extends ValueNotifier<List<String>> {
  MathFormulas._sharedInstance() : super([]);

  static final MathFormulas _shared = MathFormulas._sharedInstance();

  factory MathFormulas() => _shared;

  void add({required String mathFormula}) {
    final mathFormulas = value;
    mathFormulas.add(mathFormula);
    notifyListeners();
  }

  void remove({required String mathFormula}) {
    final mathFormulas = value;
    if (mathFormulas.contains(mathFormula)) {
      mathFormulas.remove(mathFormula);
      notifyListeners();
    }
  }

  int get length => value.length;

  Future<List<String>> mathFormulas() async => value;
}