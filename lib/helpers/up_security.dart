import 'package:encrypt/encrypt.dart';
import 'dart:developer';

class UpSecurity {
  static IV? iv;

  static initialize(String ivKey) {
    iv = IV.fromBase64(ivKey);
  }

  static String encrypt({
    required String key,
    required String text,
  }) {
    if (iv != null) {
      String result;
      if (key.length < 16) {
        return "";
      }
      try {
        final encrypter =
            Encrypter(AES(Key.fromBase64(key), mode: AESMode.cbc));

        final encrypted = encrypter.encrypt(text, iv: iv);
        result = encrypted.base64;
        return result;
      } on Exception catch (e) {
        log(e.toString());
        return "";
      }
    } else {
      return "";
    }
  }

  static String? decrypt({required String key, required String text}) {
    String result;
    if (key.length < 16) {
      return null;
    }
    try {
      final encrypter = Encrypter(AES(Key.fromBase64(key), mode: AESMode.cbc));
      result = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);
      return result;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
