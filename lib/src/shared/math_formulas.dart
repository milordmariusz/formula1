import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MathFormulas {
  Future<void> saveMathFormulas(List<String> mathFormulas, String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(mathFormulas));
  }

  Future<List<String>> getMathFormulas(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final List<dynamic> jsonData =
        jsonDecode(prefs.getString(key) ?? '[]');
    return jsonData.map<String>((jsonItem) {
      return jsonItem.toString();
    }).toList();
  }

  Future<void> saveCategories(List<String> mathFormulas) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("mathCategories", jsonEncode(mathFormulas));
  }

  Future<List<String>> getMathCategories() async {
    final prefs = await SharedPreferences.getInstance();
    final List<dynamic> jsonData =
    jsonDecode(prefs.getString("mathCategories") ?? '["Różne"]');
    return jsonData.map<String>((jsonItem) {
      return jsonItem.toString();
    }).toList();
  }

  Future<void> saveLatexPreviewSetting(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("latexPreviewSetting", jsonEncode(value));
  }

  Future<bool> getLatexPreviewSetting() async {
    final prefs = await SharedPreferences.getInstance();
    final bool jsonData =
    jsonDecode(prefs.getString("latexPreviewSetting") ?? 'false');
    return jsonData;
  }
}
