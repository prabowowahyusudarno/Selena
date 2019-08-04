import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';


class SharedPreferencesHelper {
  static void putString(String keyValue, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = encrypt.Key.fromUtf8(AppConfig.encryptionKey);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(value, iv: iv);
    prefs.setString(keyValue, encrypted.base64);
  }

  static void putBool(String keyValue, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyValue, value);
  }

  static Future<String> getString(String keyValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String base64 = prefs.get(keyValue);
    if (base64 != null) {
      final key = encrypt.Key.fromUtf8(AppConfig.encryptionKey);
      final iv = encrypt.IV.fromLength(16);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final decrypted =
          encrypter.decrypt(encrypt.Encrypted.fromBase64(base64), iv: iv);
      return decrypted;
    } else {
      return "";
    }
  }

  static Future<bool> getBool(String keyValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyValue);
  }

  static void remove(String keyValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(keyValue);
  }
}
