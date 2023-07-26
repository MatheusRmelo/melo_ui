import 'package:flutter/material.dart';

class MeloUIText extends StatelessWidget {
  const MeloUIText(this.text,
      {super.key, this.style = const TextStyle(), this.textAlign, this.color});

  final String text;
  final TextStyle style;
  final Color? color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: style.copyWith(
            color: color ??
                (Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white)));
  }
}
