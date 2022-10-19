import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/utils/encryptor.dart';

void main() {
  dynamic encrypted;

  test("Encryptor pads a short key", () {
    String shortKey = "shortKey";
    String paddedKey = Encryptor.padKey(shortKey);
    expect(paddedKey.length, 32);
  });

  test("Encryptor encrypts cipher text", () {
    String shortKey = "shortKey";
    String plaintext = "This should not be the same";
    encrypted = Encryptor.plainTextToCipher(plaintext, shortKey);
    expect(encrypted.base64, isNot(plaintext));
  });

  test("Encryptor decrypts cipher text", () {
    String shortKey = "shortKey";
    String decrypted = Encryptor.cipherToPlainText(encrypted, shortKey);
    expect(decrypted, equals("This should not be the same"));
  });

}
