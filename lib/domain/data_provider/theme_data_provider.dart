

import 'package:shared_preferences/shared_preferences.dart';

class ThemeDataProvider{
  Future<bool> isDark() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("is_dark") ?? false;
  }

  Future<void> setTheme(bool isDark) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_dark", !isDark);
  }
    Future<int> getDegrees() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('degrees')??0;  

  }

  Future<void> setDegrees(int typeDegrees) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('degrees', typeDegrees);

  }
}