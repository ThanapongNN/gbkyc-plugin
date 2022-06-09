import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomDialog extends StatelessWidget {
  final String? title, content, textConfirm, textCancel;
  final bool avatar, buttonConfirm, buttonCancel, exclamation;
  final VoidCallback? onPressedConfirm, onPressedCancel;
  final Widget? multiplyWidget;

  const CustomDialog({
    Key? key,
    this.title,
    this.content,
    this.avatar = true,
    this.buttonConfirm = true,
    this.buttonCancel = false,
    this.exclamation = false,
    this.textConfirm,
    this.textCancel,
    this.onPressedConfirm,
    this.onPressedCancel,
    this.multiplyWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Column(children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title ?? '-',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            if (multiplyWidget == null)
              Text(
                content ?? '-',
                style: const TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
          ]),
          if (multiplyWidget != null) multiplyWidget!,
          const SizedBox(height: 20),
          if (buttonConfirm)
            Column(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF115899),
                      Color(0xFF02416D),
                    ],
                  ),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  onPressed: onPressedConfirm ?? () => Navigator.pop(context),
                  child: Text(
                    textConfirm ?? 'ok'.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ]),
          if (buttonCancel)
            Column(children: [
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: const BorderSide(color: Color(0xFF02416D)),
                ),
                onPressed: onPressedCancel ?? () => Navigator.pop(context),
                child: Text(
                  textCancel ?? "Cancel".tr,
                  style: const TextStyle(
                    color: Color(0xFF02416D),
                  ),
                ),
              ),
            ]),
        ]),
      ),
      avatar
          ? CircleAvatar(
              maxRadius: 32,
              backgroundColor: Colors.white,
              child: Image.asset(
                exclamation ? 'assets/images/Exclamation.png' : 'assets/images/Check.png',
                package: 'gbkyc',
                height: 48,
                width: 48,
              ),
            )
          : CircleAvatar(
              maxRadius: 32,
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/images/Close.png',
                package: 'gbkyc',
                height: 48,
                width: 48,
              ),
            ),
    ]);
  }
}
