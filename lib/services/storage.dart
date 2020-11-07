import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static const _storage = FlutterSecureStorage();

  static Future<String> get(key) {
    return _storage.read(key: key);
  }

  static Future<void> set(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  static Future<void> remove(String key) {
    return _storage.delete(key: key);
  }

  static Future<void> clear() {
    return _storage.deleteAll();
  }

  static Future<bool> exists(String key) {
    return _storage.containsKey(key: key);
  }
}