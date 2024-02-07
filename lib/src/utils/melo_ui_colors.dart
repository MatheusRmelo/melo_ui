import 'package:flutter/material.dart';

class MeloUIColors {
  final Color dominant;
  final Color secondary;
  final Color error;
  final Color highlight;
  final Color textNormal;
  final Color textLight;
  final Color textSubTitle;
  final Color success;
  final Color border;
  final Color disabled;
  final Color onHighlight;

  MeloUIColors({
    this.dominant = const Color(0xFFF1F1F1),
    this.secondary = const Color(0xFFFFFFFF),
    this.error = const Color(0xFF9C1616),
    this.highlight = const Color(0xFFB99A28),
    this.onHighlight = Colors.white,
    this.textNormal = Colors.black,
    this.textLight = Colors.white,
    this.textSubTitle = Colors.grey,
    this.success = const Color(0xFF0E651F),
    this.border = const Color(0xFFC4C4C4),
    this.disabled = Colors.grey,
  });
}
