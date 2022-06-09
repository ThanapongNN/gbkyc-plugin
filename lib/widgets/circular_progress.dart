import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

//Loading ที่ใช้ทั้งแอป
Widget circularProgress() {
  return const Center(
      child: SizedBox(
    width: 50,
    height: 50,
    child: LoadingIndicator(
      indicatorType: Indicator.ballRotateChase,
      colors: [Color(0xFFFF9F02)],
      strokeWidth: 4,
      backgroundColor: Colors.transparent,
      pathBackgroundColor: Colors.white,
    ),
  ));
}
