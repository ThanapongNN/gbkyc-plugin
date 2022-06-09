import 'package:flutter/material.dart';

//ปุ่มตัวเลขแบบ Pad
class Numpad extends StatefulWidget {
  final int? length;
  final Function? onChange;
  final bool reset;
  const Numpad({Key? key, this.length, this.onChange, this.reset = false}) : super(key: key);

  @override
  State<Numpad> createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  String number = '';

  setValue(String val) {
    if (number.length < widget.length!) {
      setState(() {
        number += val;
        widget.onChange!(number);
      });
    }
  }

  backspace(String text) {
    if (text.isNotEmpty) {
      setState(() {
        number = text.split('').sublist(0, text.length - 1).join('');
        widget.onChange!(number);
      });
    }
  }

  reset(state) {
    if (state) {
      number = '';
      widget.onChange!(number);
    }
  }

  @override
  Widget build(BuildContext context) {
    reset(widget.reset);
    return Column(
      children: <Widget>[
        Preview(text: number, length: widget.length),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NumpadButton(
              text: '1',
              onPressed: () => setValue('1'),
            ),
            const SizedBox(width: 8),
            NumpadButton(
              text: '2',
              onPressed: () => setValue('2'),
            ),
            const SizedBox(width: 8),
            NumpadButton(
              text: '3',
              onPressed: () => setValue('3'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NumpadButton(
              text: '4',
              onPressed: () => setValue('4'),
            ),
            const SizedBox(width: 8),
            NumpadButton(
              text: '5',
              onPressed: () => setValue('5'),
            ),
            const SizedBox(width: 8),
            NumpadButton(
              text: '6',
              onPressed: () => setValue('6'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NumpadButton(
              text: '7',
              onPressed: () => setValue('7'),
            ),
            const SizedBox(width: 8),
            NumpadButton(
              text: '8',
              onPressed: () => setValue('8'),
            ),
            const SizedBox(width: 8),
            NumpadButton(
              text: '9',
              onPressed: () => setValue('9'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const NumpadButton(haveBorder: false),
            NumpadButton(
              text: '0',
              onPressed: () => setValue('0'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MaterialButton(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                onPressed: () => backspace(number),
                child: const Icon(Icons.backspace_outlined, color: Color(0xFFEB5757), size: 35),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Preview extends StatelessWidget {
  final int? length;
  final String? text;
  const Preview({Key? key, this.length, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> previewLength = [];
    for (var i = 0; i < length!; i++) {
      previewLength.add(Dot(isActive: text!.length >= i + 1));
    }
    return Container(padding: const EdgeInsets.symmetric(vertical: 10), child: Wrap(children: previewLength));
  }
}

class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool haveBorder;
  final Function? onPressed;
  const NumpadButton({Key? key, this.text, this.icon, this.haveBorder = true, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle buttonStyle = TextStyle(fontSize: 28, color: Theme.of(context).primaryColor);
    Widget label = icon != null
        ? Icon(
            icon,
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            size: 35.0,
          )
        : Text(text ?? '', style: buttonStyle);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        shape: CircleBorder(
          side: haveBorder ? const BorderSide(color: Color(0xFF115899)) : const BorderSide(color: Colors.white),
        ),
        padding: const EdgeInsets.all(15),
        onPressed: onPressed as void Function()?,
        child: label,
      ),
    );
  }
}
