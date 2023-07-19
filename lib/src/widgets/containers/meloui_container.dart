import 'package:flutter/material.dart';

class MeloUIContainer extends StatelessWidget {
  const MeloUIContainer(
      {super.key,
      required this.child,
      this.width = double.infinity,
      this.height = double.infinity,
      this.padding,
      this.margin});

  final Widget child;
  final double width;
  final double height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(32)),
        child: Padding(
            padding: padding ?? const EdgeInsets.all(32), child: child));
  }
}
