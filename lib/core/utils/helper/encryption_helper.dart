import 'dart:developer';
import 'package:encrypt/encrypt.dart';

import '../app_secure_constants.dart';

class EncryptionHelper {
  final Key key;
  final IV iv;

  EncryptionHelper()
      : key = Key.fromUtf8(AppSecureConstants.keyString),
        iv = IV.fromUtf8(AppSecureConstants.ivString);

  String encryptText(String plainText) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cfb64));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  String decryptText(String encryptedText) {
    try {
      final encrypter = Encrypter(AES(key, mode: AESMode.cfb64));
      final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
      return decrypted;
    } catch (e) {
    log('Error decrypting text: $e');
      return 'Error decrypting text';
    }
  }
}
