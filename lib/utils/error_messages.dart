import 'package:get/get_utils/src/extensions/internacionalization.dart';

//ใช้แสดงข้อความ error จากหลังบ้าน
String errorMessages(Map response) {
  return response['response']['error_message'] ??
      response['response']['error_messages'][0] ??
      'Something_is_not_right'.tr;
}
