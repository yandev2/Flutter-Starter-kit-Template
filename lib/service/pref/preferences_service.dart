import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future<String?> getString(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  Future setString(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(key, value);
  }

  Future<int?> getInt(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }

  Future setInt(String key, int value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setInt(key, value);
  }
}
