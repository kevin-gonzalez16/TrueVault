import 'package:encrypt/encrypt.dart';

class Encryptor {
  static String plainTextToCipher(String plaintext, String key, String uID) {
    key = padKey(key, uID);
    final securedKey = Key.fromUtf8(key);
    final iv = IV.fromLength(16);
    final encrypt = Encrypter(AES(securedKey));

    final encrypted = encrypt.encrypt(plaintext, iv: iv);
    return encrypted.base64;
  }

  static String cipherToPlainText(String cipher, String key, String uID) {
    key = padKey(key, uID);
    final securedKey = Key.fromUtf8(key);
    final encrypt = Encrypter(AES(securedKey));
    final iv = IV.fromLength(16);

    final decrypted = encrypt.decrypt64(cipher, iv: iv);
    return decrypted;
  }

  static String padKey(String key, String uID) {
    if (key.length >= 32) {

      String padding = "";
      int index = 1;
      int round = 1;

      for (int x = 0; x < 16; x++) {
        if(index >= uID.length){
          round += 1;
          index = 1 * round;
        }
        padding += uID.substring(index,index+1);
        index *= 2;
      }

      int paddingIndex = 0;
      for(int x = 0; x<32; x++){
        //replace every other with padding
        if (x % 2 == 0){
          key = key.substring(0,x) + padding.substring(paddingIndex,paddingIndex + 1) + key.substring(x+1);
          paddingIndex += 1;
        }
      }
      return key.length == 32 ? key : key.substring(0,32);
    }else {
      int missing = key.length;
      String padding = "";
      int index = 1;
      int round = 1;

      for (int x = 0; x < 32 - missing; x++) {
        if(index >= uID.length){
          round += 1;
          index = 1 * round;
        }
        padding += uID.substring(index,index+1);
        index *= 2;
      }
      return key+padding;
    }
  }
}