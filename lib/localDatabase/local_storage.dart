import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setRegime(bool active) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.setBool('lightMode', active);
  }

  Future<bool> getRegime() async {
    final SharedPreferences prefs = await _prefs;
    final isLight = prefs.getBool('lightMode');

    return isLight ?? false;
  }
}
