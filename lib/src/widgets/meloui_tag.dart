import 'package:flutter/material.dart';

class MeloUITag extends StatelessWidget {
  const MeloUITag(
      {super.key,
      required this.title,
      this.backgroundColor = Colors.red,
      this.textColor = Colors.white});

  final String title;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
