import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gbkyc/api/config_api.dart';
import 'package:gbkyc/utils/error_messages.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../widgets/custom_dialog.dart';

class PostAPI {
  //Call raw
  static Future<Map> call({
    required String url,
    required Authorization headers,
    required Map<String, String> body,
  }) async {
    try {
      await EasyLoading.show();
      final response = await http.post(Uri.parse(url), headers: setHeaders(headers), body: body).timeout(const Duration(seconds: 30));

      debugPrint('$url ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await EasyLoading.dismiss();
        if (!data['success']) {
          await Get.dialog(CustomDialog(title: 'Something_went_wrong'.tr, content: errorMessages(data), avatar: false));
        }
        return data;
      } else {
        await EasyLoading.dismiss();
        await Get.dialog(CustomDialog(title: 'Something_went_wrong'.tr, content: errorMessages(errorNotFound), avatar: false));
        return errorNotFound;
      }
    } on TimeoutException catch (_) {
      await EasyLoading.dismiss();
      await Get.dialog(CustomDialog(title: 'Something_went_wrong'.tr, content: errorMessages(errorTimeout), avatar: false));
      return errorTimeout;
    } on SocketException catch (_) {
      await EasyLoading.dismiss();
      await Get.dialog(CustomDialog(title: 'Something_went_wrong'.tr, content: errorMessages(messageOffline), avatar: false));
      return messageOffline;
    }
  }

  //Call form-data
  static Future<Map> callFormData({
    required String url,
    required Authorization headers,
    required List<MultipartFile> files,
    bool closeLoading = false,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    switch (headers) {
      case Authorization.auth2:
        request.headers['Authorization2'] = authorization2!;
        break;
      default:
    }

    for (var e in files) {
      request.files.add(e);
    }

    try {
      if (!closeLoading) await EasyLoading.show();
      var response = await request.send().timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final resStr = await response.stream.bytesToString();
        final data = json.decode(resStr);
        await EasyLoading.dismiss();
        if (!data['success']) {
          await Get.dialog(CustomDialog(title: 'Something_went_wrong'.tr, content: errorMessages(data), avatar: false));
        }
        return data;
      } else {
        await EasyLoading.dismiss();
        await Get.dialog(CustomDialog(title: 'Something_went_wrong'.tr, content: errorMessages(errorNotFound), avatar: false));
        return errorNotFound;
      }
    } on TimeoutException catch (_) {
      await EasyLoading.dismiss();
      await Get.dialog(CustomDialog(title: 'Something_went_wrong'.tr, content: errorMessages(errorTimeout), avatar: false));
      return errorTimeout;
    } on SocketException catch (_) {
      await EasyLoading.dismiss();
      await Get.dialog(CustomDialog(title: 'Something_went_wrong'.tr, content: errorMessages(messageOffline), avatar: false));
      return messageOffline;
    }
  }
}
