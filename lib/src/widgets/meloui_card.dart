import 'package:flutter/material.dart';

class MeloUICard extends StatelessWidget {
  const MeloUICard(
      {super.key,
      required this.child,
      this.width = 600,
      this.height = 600,
      this.backgroundColor,
      this.padding,
      this.border});
  final Widget child;
  final double width;
  final double height;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final Border? border;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
            border: border,
            borderRadius: BorderRadius.circular(16)),
        child: child);
  }
}
