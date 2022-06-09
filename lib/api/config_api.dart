import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

String? register3003 = dotenv.env['host3003'];
String? gateway3006 = dotenv.env['host3006'];
String? connectGBWallet = dotenv.env['connect_gbwallet'];
String? authorization2 = dotenv.env['authorization2'];

Map messageOffline = {
  "success": false,
  "response": {"error_message": "lost_internet_connection".tr}
};

Map errorTimeout = {
  'success': false,
  'response': {'error_message': 'Connection_timeout'.tr}
};

Map errorNotFound = {
  'success': false,
  'response': {'error_message': 'Something_went_wrong_Please_try_again'.tr}
};

enum Authorization { token, auth2, none }

Map<String, String> setHeaders(Authorization headers) {
  switch (headers) {
    case Authorization.auth2:
      return {'Authorization2': authorization2!, 'lang': 'language'.tr};
    default:
      return {'lang': 'language'.tr};
  }
}
