import 'package:encrypt/encrypt.dart';

class Encryptor {
  static String plainTextToCipher(String plaintext, String key) {
    key = padKey(key);
    final securedKey = Key.fromUtf8(key);
    final iv = IV.fromLength(16);
    final encrypt = Encrypter(AES(securedKey));

    final encrypted = encrypt.encrypt(plaintext, iv: iv);
    return encrypted.base64;
  }

  static String cipherToPlainText(String cipher, key) {
    key = padKey(key);
    final securedKey = Key.fromUtf8(key);
    final encrypt = Encrypter(AES(securedKey));
    final iv = IV.fromLength(16);

    final decrypted = encrypt.decrypt64(cipher, iv: iv);
    return decrypted;
  }

  static String padKey(String key) {
    if (key.length >= 32) {
      return key;
    } else {
      int missing = key.length;
      for (int x = 0; x < 32 - missing; x++) {
        key += ".";
      }
      return key;
    }
  }
}