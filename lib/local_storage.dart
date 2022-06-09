import 'package:gbkyc/utils/encryption.dart';
import 'package:get_storage/get_storage.dart';

//เก็บข้อมูลลงใน Local
class LocalStorage {
  static setAutoPIN(bool autoPIN) async {
    await GetStorage().write('auto_pin', autoPIN);
  }

  static getAutoPIN() {
    return GetStorage().read('auto_pin');
  }

  static setIsCorporate(bool isCorporate) async {
    await GetStorage().write('is_corporate', isCorporate);
  }

  static getIsCorporate() {
    return GetStorage().read('is_corporate') ?? false;
  }

  static setUserLoginID(String userLoginId) async {
    if (userLoginId.isNotEmpty) {
      await GetStorage().write('user_login_id', encryptData(input: userLoginId));
    } else {
      await GetStorage().write('user_login_id', '');
    }
  }

  static getUserLoginID() {
    String userLoginId = GetStorage().read('user_login_id') ?? '';

    if (userLoginId.isNotEmpty) {
      return decryptData(input: userLoginId);
    } else {
      return '';
    }
  }

  static setMobileNumber(String mobileNumber) async {
    await GetStorage().write('mobile_number', mobileNumber);
  }

  static getMobileNumber() {
    return GetStorage().read('mobile_number');
  }

  static setCoperateMail(String coperateMail) async {
    await GetStorage().write('coperate_mail', coperateMail);
  }

  static getCoperateMail() {
    return GetStorage().read('coperate_mail');
  }

  static setTimeToken(String timeToken) async {
    await GetStorage().write('time_token', timeToken);
  }

  static getTimeToken() {
    return GetStorage().read('time_token');
  }

  static setStatusPIN(bool statusPIN) async {
    await GetStorage().write('status_pin', statusPIN);
  }

  static getStatusPIN() {
    return GetStorage().read('status_pin') ?? true;
  }
}
