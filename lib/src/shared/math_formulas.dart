import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MathFormulas {
  Future<void> saveMathFormulas(List<String> mathFormulas) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('mathFormulas', jsonEncode(mathFormulas));
  }

  Future<List<String>> getMathFormulas() async {
    final prefs = await SharedPreferences.getInstance();
    final List<dynamic> jsonData =
        jsonDecode(prefs.getString('mathFormulas') ?? '[]');
    return jsonData.map<String>((jsonItem) {
      return jsonItem.toString();
    }).toList();
  }
}
