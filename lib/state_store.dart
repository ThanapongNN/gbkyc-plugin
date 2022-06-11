import 'package:get/get_rx/src/rx_types/rx_types.dart';

//ตัวแปรกองกลาง
class StateStore {
  static RxString deviceSerial = ''.obs;
  static RxString fcmToken = ''.obs;
  static RxString fileText = ''.obs;

  static RxMap careers = {}.obs;
}
