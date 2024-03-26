import 'package:flutter/material.dart';

class MeloUICard extends StatelessWidget {
  const MeloUICard(
      {super.key,
      required this.child,
      this.width = 600,
      this.height = 600,
      this.padding = const EdgeInsets.all(24)});
  final Widget child;
  final double width;
  final double height;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16)),
        child: child);
  }
}
