import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/utils/encryptor.dart';

void main() {
  dynamic encrypted;
  String uID = "2LrMteAPf2XoLYUFc8RM2xDh8P02";

  test("Encryptor pads a short key", () {
    String shortKey = "shortKey";
    String paddedKey = Encryptor.padKey(shortKey, uID);
    expect(paddedKey.length, 32);
    expect(paddedKey, "shortKeyLrtfcrtfcMAL8tfceX2AL8PU");
  });

  test("Encryptor pads a long key", () {
    String shortKey = "shortKeyshortKeyshortKeyshortKeyshortKey";
    String paddedKey = Encryptor.padKey(shortKey, uID);
    expect(paddedKey.length, 32);
    expect(paddedKey, "LhrrtKfychrrtKfychMrAKLy8htrfKcy");
  });

  test("Encryptor pads a 32 character length key", () {
    String longKey = "shortKeyshortKeyshortKeyshortKeY";
    String paddedKey = Encryptor.padKey(longKey, uID);
    expect(paddedKey.length, 32);
    expect(paddedKey, "LhrrtKfychrrtKfychMrAKLy8htrfKcY");
  });

  test("Encryptor encrypts cipher text", () {
    String shortKey = "shortKey";
    String plaintext = "This should not be the same";
    encrypted = Encryptor.plainTextToCipher(plaintext, shortKey, uID);
    expect(encrypted, isNot(plaintext));
  });

  test("Encryptor decrypts cipher text", () {
    String shortKey = "shortKey";
    String decrypted = Encryptor.cipherToPlainText(encrypted, shortKey, uID);
    expect(decrypted, equals("This should not be the same"));
  });

}
