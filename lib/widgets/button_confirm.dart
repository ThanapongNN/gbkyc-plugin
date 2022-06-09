import 'package:flutter/material.dart';

//สำหรับปุ่มตกลงทั้งแอป
class ButtonConfirm extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final double radius;
  final double width;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color? colorText;

  const ButtonConfirm({
    Key? key,
    required this.onPressed,
    required this.text,
    this.radius = 25,
    this.width = double.infinity,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        onPressed: onPressed,
        child: FittedBox(fit: BoxFit.scaleDown, child: Text(text, style: TextStyle(color: colorText))),
      ),
    );
  }
}
