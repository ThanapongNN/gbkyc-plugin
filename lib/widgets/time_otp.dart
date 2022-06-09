import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

//แสดงระยะเวลาของ OTP
Widget timeOTP({
  required bool expiration,
  DateTime? datetimeOTP,
  Function? onPressed,
  Function? onDone,
}) {
  if (expiration) {
    return Center(
      child: Container(
        width: 136,
        height: 44,
        margin: const EdgeInsets.only(top: 20),
        child: MaterialButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: const BorderSide(color: Color(0xFF02416D)),
          ),
          onPressed: onPressed as void Function()?,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.rotate_right,
                color: Color(0xFF02416D),
              ),
              Text(
                'sent_new_code'.tr,
                style: const TextStyle(color: Color(0xFF02416D), fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  } else {
    Duration expirationOTP = datetimeOTP!.difference(DateTime.now());
    int minutesOTP = expirationOTP.inMinutes.remainder(60);
    int secondsOTP = expirationOTP.inSeconds.remainder(60);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'sent_code_again'.tr,
            style: const TextStyle(color: Color(0xFFFF9F02), fontSize: 15),
          ),
          TweenAnimationBuilder<Duration>(
            duration: Duration(minutes: minutesOTP, seconds: secondsOTP),
            tween: Tween(begin: Duration(minutes: minutesOTP, seconds: secondsOTP), end: Duration.zero),
            onEnd: onDone as void Function()?,
            builder: (BuildContext context, Duration value, Widget? child) {
              final minutes = value.inMinutes;
              final seconds = value.inSeconds % 60;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '0$minutes : ${seconds.toString().padLeft(2, '0')}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xFFFF9F02), fontSize: 15),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
