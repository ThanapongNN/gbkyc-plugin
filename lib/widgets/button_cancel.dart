import 'package:flutter/material.dart';

//สำหรับปุ่มปฏิเสธทั้งแอป
class ButtonCancel extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final double width;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const ButtonCancel({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(color: Color(0xFF02416D)),
        ),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(text, style: const TextStyle(color: Color(0xFF02416D))),
        ),
      ),
    );
  }
}
