import 'package:get/get_rx/src/rx_types/rx_types.dart';

//ตัวแปรกองกลาง
class StateStore {
  static RxString balance = '0.00'.obs;
  static RxString deviceSerial = ''.obs;
  static RxString fcmToken = ''.obs;
  static RxString token = ''.obs;
  static RxString pin = ''.obs;
  static RxString role = ''.obs;
  static RxString lastLoginAt = ''.obs;
  static RxString fileText = ''.obs;

  static RxMap profile = {}.obs;
  static RxMap careers = {}.obs;
  static RxMap virtualCardInfo = {}.obs;

  static RxBool approve = false.obs;
  static RxBool isCorporate = false.obs;
  static RxBool remoteConfigIsDev = true.obs;
  static RxBool transactionHasData = false.obs;
  static RxBool virtualStatus = false.obs;

  static RxList recentSearch = [].obs;
  static RxList recentRedeemed = [].obs;
  static RxList transaction = [].obs;
}
