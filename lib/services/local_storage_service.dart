import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _prefs;

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }

    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  dynamic getFromDisk(String key) => _prefs.get(key);

  void saveToDisk<T>(String key, T content) {
    if(content is String) {
      _prefs.setString(key, content);
    }
    if(content is bool) {
      _prefs.setBool(key, content);
    }
    if(content is int) {
      _prefs.setInt(key, content);
    }
    if(content is double) {
      _prefs.setDouble(key, content);
    }
    if(content is List<String>) {
      _prefs.setStringList(key, content);
    }
  }

  void removeFromDisk(String key) => _prefs.remove(key);
}
