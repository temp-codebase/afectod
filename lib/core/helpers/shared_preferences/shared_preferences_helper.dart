import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> get _instance async {
    if (_prefs != null) return _prefs!;
    try {
      _prefs = await SharedPreferences.getInstance();
      return _prefs!;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> saveData(String key, bool value) async {
    try {
      final prefs = await _instance;
      await prefs.setBool(key, value);
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool?> getData(String key) async {
    try {
      final prefs = await _instance;
      final value = prefs.getBool(key);
      return value;
    } catch (e) {
      return null;
    }
  }
}
