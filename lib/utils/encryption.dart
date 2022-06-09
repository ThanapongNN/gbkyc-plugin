import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final iv = IV.fromUtf8(dotenv.env['iv_key']!);
final encrypter =
    Encrypter(AES(Key.fromUtf8(dotenv.env['encrypt_key']!), mode: AESMode.cbc));

String encryptData({required String input}) {
  final encrypted = encrypter.encrypt(input, iv: iv).base64;

  return encrypted;
}

String decryptData({required String input}) {
  final decrypted = encrypter.decrypt(Encrypted.fromBase64(input), iv: iv);

  return decrypted;
}
