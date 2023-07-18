import 'package:flutter/material.dart';

class MeloUICard extends StatelessWidget {
  const MeloUICard(
      {super.key, required this.child, this.width = 600, this.height = 600});
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16)),
        child: child);
  }
}
