import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheManagerProtocol {
  Future<void> initialize();
  Future<void> clearCache();
  Future<bool> setBoolByKey(String key, bool value);
  Future<void> setStringByKey(String key, String value);
  bool getBoolByKey(String key, {bool defaultValue = false});
  String getStringByKey(String key, {String defaultValue = ''});
}

class CacheManager extends CacheManagerProtocol {
  late SharedPreferences _sharedPreferences;

  CacheManager() {
    initialize();
  }

  @override
  Future<void> initialize() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
    } on Exception catch (error, stacktrace) {
      //TODO: Adicionar log de erro
    }
  }

  @override
  bool getBoolByKey(String key, {bool defaultValue = false}) {
    return _sharedPreferences.getBool(key) ?? defaultValue;
  }

  @override
  String getStringByKey(String key, {String defaultValue = ''}) {
    return _sharedPreferences.getString(key) ?? defaultValue;
  }

  @override
  Future<bool> setBoolByKey(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> setStringByKey(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  @override
  Future<void> clearCache() async {
    await _sharedPreferences.clear();
  }
}
